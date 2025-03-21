#' Generate icehouse pieces
#'
#' `icehouse_pyramids()` generates a data frame of icehouse pyramids.
#' `icehouse_none()` generates a zero-row data frame.
#' @importFrom rlang check_dots_empty
#' @param side Normally either "top" (default) or "face".
#' @param rank Number of pips on the icehouse pyramid.
#' @inheritParams ppdf::chess_bits
#' @export
icehouse_pyramids <- function(...,
                              side = "top",
                              piece_side = paste0("pyramid_", side),
                              suit = rep(1:5, each = 3L),
                              rank = rep.int(1:3, 5L),
                              x = as.double(rep.int(1:5, 3L)),
                              y = as.double(rep(3:1, each = 5L)),
                              angle = 0, length.out = NA_integer_) {
    check_dots_empty()
    tibble(piece_side = rep(piece_side, length.out = length.out),
           suit = rep(as.integer(suit), length.out = length.out),
           rank = rep(as.integer(rank), length.out = length.out),
           cfg = rep("icehouse_pieces", length.out = length.out),
           x = rep(as.double(x), length.out = length.out),
           y = rep(as.double(y), length.out = length.out),
           angle = rep(as.double(angle), length.out = length.out))
}

#' @rdname icehouse_pyramids
#' @export
icehouse_none <- function() ppdf::piecepack_none()
