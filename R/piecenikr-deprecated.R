# nocov start
#' Deprecated functions
#'
#' These functions are Deprecated in this release of piecenikr,
#' they will be marked as Defunct and removed in a future version.
#'
#' @name piecenikr-deprecated
NULL

#' @rdname piecenikr-deprecated
#' @inheritParams icehouse_martian_chess
#' @export
df_martian_chess <- function(n_players = 2, seed = NULL) {
    .Deprecated("icehouse_martian_chess")
    icehouse_martian_chess(n_players = n_players, seed = seed)
}

# nocov end
