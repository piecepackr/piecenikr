#' @importFrom piecepackr as_pp_cfg get_shape_grob_fn pp_cfg
#' @importFrom grid circleGrob gpar gList gTree unit
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
#' @export
looneyPyramidGrob <- function(piece_side, suit, rank, cfg = pp_cfg()) { # nolint
    cfg <- as_pp_cfg(cfg)
    opt <- cfg$get_piece_opt(piece_side, suit, rank)

    shape_fn <- get_shape_grob_fn(opt$shape, opt$shape_t, opt$shape_r)

    # Background
    background_grob <- shape_fn(gp = gpar(col = NA, fill = opt$background_color))

    # Circles
    gp_c <- gpar(fill = opt$ps_color, col = opt$ps_color)
    c1_grob <- circleGrob(x = unit(0.5, "npc"), y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c2_grob <- circleGrob(x = unit(0.5, "npc") - unit(0.38, "cm"), y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c3_grob <- circleGrob(x = unit(0.5, "npc") - unit(0.76, "cm"), y = unit(0.48, "cm"), r = unit(0.12, "cm"), gp = gp_c)
    c_grob <- switch(rank, c1_grob, gList(c1_grob, c2_grob), gList(c1_grob, c2_grob, c3_grob))

    # Border
    border_grob <- shape_fn(gp = gpar(col = opt$border_color, fill = NA, lex = opt$border_lex))
    gl <- gList(background_grob, c_grob, border_grob)

    gTree(children = gl, name = piece_side)
}

#' Looney Pyramids configuration object
#'
#' \code{looney_pyramids} provides a basic configuration object
#' for drawing Looney Pyramids
#'
#' Looney Pyramids aka Icehouse pieces is a game system invented by Andrew Looney.
#' See \url{https://www.looneylabs.com/looney-pyramids}.
#' @export
looney_pyramids <- pp_cfg(list(
   n_ranks = 3, n_suits = 6,
   width.r1.pyramid = 9/16, width.r2.pyramid = 25/32, width.r3.pyramid = 1,
   height.r1.pyramid = 1, height.r2.pyramid = 1.375, height.r3.pyramid = 1.75,
   rank_text = ",\u25cf,\u25cf\u25cf,\u25cf\u25cf\u25cf",
   suit_color = "#D55E00,#808080,#009E73,#56B4E9,#E69F00,#808080",
   border_color.pyramid = "#D55E00,#808080,#009E73,#56B4E9,#E69F00,#808080",
   background_color.pyramid = "#D55E0080,#000000,#009E7380,#56B4E980,#E69F0080,#FFFFFF",
   border_lex.pyramid = 4, grob_fn.pyramid = looneyPyramidGrob
))
