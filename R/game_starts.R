#' Data frames of starting diagrams for various games
#'
#' \code{tibble} data frames of starting diagrams for various games.
#'
#' Here is some more information about the various games:
#'  \describe{
#'  \item{Martian Chess}{An abstract by Andrew Looney.
#'                      See \url{https://www.looneylabs.com/rules/martian-chess}.}
#'}
#' @param n_players Number of players
#' @param seed Random seed
#' @name df_lp_games
#' @rdname df_lp_games
NULL

#' @importFrom tibble tibble
#' @importFrom dplyr %>% bind_rows mutate
#' @importFrom rlang .data

scale_xy <- function(df, factor) {
    df <- mutate(df, x = factor * .data$x, y = factor * .data$y)
    attr(df, "scale_factor") <- factor
    df
}

#' @rdname df_lp_games
#' @export
df_martian_chess <- function(n_players = 2, seed = NULL) {
    if (!is.null(seed)) withr::local_seed(seed)
    set.seed(seed)
    if (n_players == 2) {
        df_board <- tibble(piece_side = "board_face", suit = 6, rank = 4,
                       x = 2.5, y = c(2.5, 6.5), cfg = "checkers2")
        df_pawn <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                          rank = 1, suit = sample.int(6),
                          x = rep(2:3, each = 3), y = c(2:3, 6, 3, 6:7))
        df_drone <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                          rank = 2, suit = sample.int(6),
                          x = c(1:3, 2:4), y = c(6:8, 1:3))
        df_queen <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                          rank = 3, suit = sample.int(6),
                          x = c(1, 1, 2, 3, 4, 4), y = c(7, 8, 8, 1, 1, 2))
    } else if (n_players == 4) {
        df_board <- tibble(piece_side = "board_face", suit = 6, rank = 4,
                       x = rep(c(2.5, 6.5), 2), y = rep(c(2.5, 6.5), each = 2), cfg = "checkers2")
        df_pawn <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                          rank = 1, suit = sample(rep(1:6, 2)),
                          x = c(rep(c(2, 7), each = 2), rep(c(3, 6), each = 4)),
                          y = c(rep(c(3, 6), 2), rep(c(2:3, 6:7), 2)))
        df_drone <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                           rank = 2, suit = sample(rep(1:6, 2)),
                           x = c(1:3, 1:3, 6:8, 6:8),
                           y = c(3:1, 6:8, 8:6, 1:3))
        df_queen <- tibble(piece_side = "pyramid_top", cfg = "icehouse_pieces",
                           rank = 3, suit = sample(rep(1:6, 2)),
                           x = c(rep(c(1, 8), each = 4), rep(c(2, 7), each = 2)),
                           y = c(rep(c(1:2, 7:8), 2), rep(c(1, 8), 2)))
    } else {
        stop(paste("Don't know how to do Martian Chess for", n_players, "(yet)"))
    }
    bind_rows(df_board, df_pawn, df_drone, df_queen) %>% scale_xy(2)
}
