#' Generate icehouse pieces
#'
#' `icehouse_pyramids()` generates a data frame of icehouse pyramids,
#'  `looney_pyramids()` is an alias.
#' `icehouse_none()` generates a zero-row data frame.
#' `icehouse_setup_by_name()` generates a data frame from a given icehouse game name.
#' @importFrom rlang check_dots_empty
#' @param side Normally either "top" (default) or "face".
#' @param rank Number of pips on the icehouse pyramid.
#' @inheritParams ppdf::chess_bits
#' @importFrom ppdf dice_rank piece_angle piece_suit
#' @export
icehouse_pyramids <- function(...,
                              side = "top",
                              piece_side = paste0("pyramid_", side),
                              suit = rep(1:5, each = 3L),
                              rank = rep.int(1:3, 5L),
                              x = as.double(rep.int(1:5, 3L)),
                              y = as.double(rep(3:1, each = 5L)),
                              angle = 0,
                              length.out = NA_integer_) {
    check_dots_empty()
    tibble(piece_side = rep(paste0("pyramid_", side), length.out = length.out),
           suit = rep(piece_suit(suit), length.out = length.out),
           rank = rep(dice_rank(rank), length.out = length.out),
           cfg = rep("icehouse_pieces", length.out = length.out),
           x = rep(as.double(x), length.out = length.out),
           y = rep(as.double(y), length.out = length.out),
           angle = rep(piece_angle(angle), length.out = length.out))
}

#' @rdname icehouse_pyramids
#' @export
icehouse_none <- function() ppdf::piecepack_none()

#' @rdname icehouse_pyramids
#' @inheritParams ppdf::setup_by_name
#' @export
icehouse_setup_by_name <- function(name, ...,
                                   getter = function(x) get(x, envir=getNamespace("piecenikr"))) {
    tryCatch(ppdf::setup_by_name(name, "icehouse", ..., getter = getter),
             error = function(e1) {
                 getter = function(x) get(x, envir=getNamespace("ppdf"))
                 tryCatch(ppdf::setup_by_name(name, "icehouse", ..., getter = getter),
                          error = function(e2) stop(e1))
             })
}
