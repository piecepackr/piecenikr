#' @importFrom piecepackr as_pp_cfg pp_cfg
#' @importFrom grid circleGrob gpar gList gTree makeContent unit
NULL

#' Basic grob function for Looney Pyramids
#'
#' \code{looneyPyramidGrob} provides a basic grob function for the sides Looney Pyramids.
#'
#' @param piece_side Piece side of the piece
#' @param suit Suit of the piece
#' @param rank Rank of the piece
#' @param cfg Piecepackr configuration object
#'
#' @import grid
#' @export
looneyPyramidGrob <- function(piece_side, suit, rank, cfg = pp_cfg()) { # nolint
    cfg <- as_pp_cfg(cfg)
    opt <- cfg$get_piece_opt(piece_side, suit, rank)
    gTree(opt = opt, rank = rank,
          border = TRUE, flip = FALSE, scale = 1,
          name = NULL, gp = gpar(), vp = NULL, cl = "looney_pyramid_face")
}

#' @export
makeContext.looney_pyramid_face <- function(x) {
    x <- update_gp(x, gp = gpar(cex = x$scale, lex = x$scale))
    x
}

#' @export
makeContent.looney_pyramid_face <- function(x) { # nolint
    opt <- x$opt
    rank <- x$rank
    shape <- piecepackr::pp_shape(opt$shape, opt$shape_t, opt$shape_r, opt$back)

    # Background
    background_grob <- shape$shape(gp = gpar(col = NA, fill = opt$background_color), name = "background")

    # Circles
    gp_c <- gpar(fill = opt$ps_color, col = opt$ps_color)
    c1_grob <- circleGrob(x = unit(0.5, "npc"), y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c2_grob <- circleGrob(x = unit(0.5, "npc") - unit(0.38, "cm"),
                          y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c3_grob <- circleGrob(x = unit(0.5, "npc") - unit(0.76, "cm"),
                          y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c_grob <- switch(rank, c1_grob, gList(c1_grob, c2_grob), gList(c1_grob, c2_grob, c3_grob))

    # Border
    if (x$border) {
        gp_border <- gpar(col = opt$border_color, fill = NA, lex = opt$border_lex)
        border_grob <- shape$shape(gp = gp_border, name = "border")
    } else {
        border_grob <- nullGrob(name = "border")
    }

    if (x$flip)
        gl <- gList(c_grob, background_grob, border_grob)
    else
        gl <- gList(background_grob, c_grob, border_grob)

    setChildren(x, gl)
}

# Pyramid Base 9/16", 25/32", 1"
# Pyramid Height 1, 1 3/8", 1 3/4"
# Pyramid Face Height = sqrt((Pyramid Height)^2 + (Base / 2)^2)

#' Configuration objects for drawing Looney Pyramids
#'
#' \code{looney_pyramids} provides a basic configuration object
#' for drawing Looney Pyramids.
#'
#' Looney Pyramids aka Icehouse pieces is a game system invented by Andrew Looney.
#' See \url{https://www.looneylabs.com/looney-pyramids}.
#'
#' @return Returns a list with an \code{icehouse_pieces} configuration for drawing Looney Pyramids.
#' @export
looney_pyramids <- function() {
    icehouse_pieces <- list(n_ranks = 3, n_suits = 6,
                            width.r1.pyramid = 0.5625, width.r2.pyramid = 0.78125, width.r3.pyramid = 1,
                            height.r1.pyramid = 1.03879813366216633419, height.r2.pyramid = 1.429409979895551074947,
                            height.r3.pyramid = 1.820027472320129513506,
                            rank_text = ",\u25cf,\u25cf\u25cf,\u25cf\u25cf\u25cf",
                            # suit_color = "#D55E00,#808080,#009E73,#56B4E9,#E69F00,#808080",
                            suit_color = "#B53E00,#808080,#007E53,#3694C9,#C67F00,#808080",
                            border_color.pyramid = "#D55E00A0,#808080FF,#009E73A0,#56B4E9A0,#E69F00A0,#808080FF",
                            background_color.pyramid = "#D55E0090,#000000,#009E7390,#56B4E890,#E69F0090,#FFFFFF",
                            border_lex.pyramid = 4, grob_fn.pyramid = looneyPyramidGrob
                            )
    list(icehouse_pieces = pp_cfg(icehouse_pieces))
}

# Internal function copied from `{piecepackr}`
# unlike `grid::editGrob()` *updates* previous cex, lex, alpha values
# by multiplying new values with previous values.
#' @importFrom utils hasName
update_gp <- function(grob, gp = gpar()) {
    stopifnot(all(names(gp) %in% c("alpha", "cex", "lex")))
    if(is.null(grob$gp)) {
        grob$gp <- gp
    } else {
        for (name in c("alpha", "cex", "lex")) {
            if(hasName(grob$gp, name) && hasName(gp, name)) {
                grob$gp[[name]] <- grob$gp[[name]] * gp[[name]]
            } else if (hasName(gp, name)) {
                grob$gp[[name]] <- gp[[name]]
            }
        }
    }
    grob
}
