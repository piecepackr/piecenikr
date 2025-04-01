#' Icehouse movetext parser
#'
#' `icehouse_parser()` provides a parser to be used with PPN movetext.
#' `looney_pyramid_parser()` is an alias.
#'
#' @examples
#' if (requireNamespace("ppn", quietly = TRUE)) {
#'   l <- ppn::read_ppn(system.file("ppn/martian-chess.ppn", package = "piecenikr"),
#'                      parse = FALSE)[[1L]]
#'   game <- icehouse_parser(l$movetext, l$metadata)
#' }
#' @param movetext A named character vector of move text.
#' @param metadata A named list of metadata
#' @param ... Passed to [ppn::default_parser()].
#' @return A named list of data frames with parsed game states.
#' @export
icehouse_parser <- function(movetext = character(),
                            metadata = list(),
                            ...) {
    stopifnot(requireNamespace("ppn", quietly = TRUE))
    ppn::default_parser(movetext, metadata, ..., default_system = "icehouse")
}

#' @rdname icehouse_parser
#' @export
looney_pyramid_parser <- icehouse_parser
