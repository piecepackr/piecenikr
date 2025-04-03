#' Data frames of starting diagrams for various games
#'
#' \code{tibble} data frames of setups for `r nrow(icehouse_games())` games playable with the Looney Pyramids game system.
#'   Data frame output can usually be plotted with \code{pmap_piece(df, default.units = "in")}.
#'
#' Here are links for more information about the various other games:
#'
#' `r man_markdown_table(icehouse_games())`
#'
#' @param n_players Number of players
#' @param seed Random seed
#' @return `r return_df()`
#' @name icehouse_setups
#' @rdname icehouse_setups
NULL

#' @importFrom tibble tibble tribble
#' @importFrom dplyr %>% bind_rows mutate
#' @importFrom rlang .data
NULL

#' Data frames with game info
#'
#' `icehouse_games()` contain information about the games
#' whose setups are provided by this package.
#'
#' @examples
#' head(icehouse_games())
#' nrow(icehouse_games())
#' @return A [tibble::tibble()] data frame with character columns "game", "methods", "comment", and "url"
#'         for game name, setup function name(s), possible comment, and url for more information.
#' @export
icehouse_games <- function() {
    tribble(~game
            , ~methods
            , ~comment
            , ~url
            , "Martian Chess"
            , "``icehouse_martian_chess()``"
            , NA_character_
            , "https://www.looneylabs.com/rules/martian-chess"
    )
}

scale_xy <- function(df, factor) {
    df <- mutate(df, x = factor * .data$x, y = factor * .data$y)
    attr(df, "scale_factor") <- factor
    df
}

#' @rdname icehouse_setups
#' @importFrom ppdf checker_board
#' @export
icehouse_martian_chess <- function(n_players = 2, seed = NULL) {
    if (!is.null(seed)) withr::local_seed(seed)
    set.seed(seed)
    if (n_players == 2) {
        df_board <- tibble(piece_side = "board_face", suit = 6L, rank = 4L,
                           cfg = "checkers2",
                           x = 2.5, y = c(2.5, 6.5), angle = 0.0)
        df_pawn <- icehouse_pyramids(rank = 1, suit = sample.int(6),
                                     x = rep(2:3, each = 3), y = c(2:3, 6, 3, 6:7))
        df_drone <- icehouse_pyramids(rank = 2, suit = sample.int(6),
                                      x = c(1:3, 2:4), y = c(6:8, 1:3))
        df_queen <- icehouse_pyramids(rank = 3, suit = sample.int(6),
                                      x = c(1, 1, 2, 3, 4, 4), y = c(7, 8, 8, 1, 1, 2))
    } else if (n_players == 4) {
        df_board <- tibble(piece_side = "board_face", suit = 6L, rank = 4L,
                           cfg = "checkers2", x = rep(c(2.5, 6.5), 2),
                           y = rep(c(2.5, 6.5), each = 2), angle = 0.0)
        df_pawn <- icehouse_pyramids(rank = 1, suit = sample(rep(1:6, 2)),
                                     x = c(rep(c(2, 7), each = 2), rep(c(3, 6), each = 4)),
                                     y = c(rep(c(3, 6), 2), rep(c(2:3, 6:7), 2)))
        df_drone <- icehouse_pyramids(rank = 2, suit = sample(rep(1:6, 2)),
                                      x = c(1:3, 1:3, 6:8, 6:8),
                                      y = c(3:1, 6:8, 8:6, 1:3))
        df_queen <- icehouse_pyramids(rank = 3, suit = sample(rep(1:6, 2)),
                                      x = c(rep(c(1, 8), each = 4), rep(c(2, 7), each = 2)),
                                      y = c(rep(c(1:2, 7:8), 2), rep(c(1, 8), 2)))
    } else {
        stop(paste("Don't know how to do Martian Chess for", n_players, "(yet)"))
    }
    bind_rows(df_board, df_pawn, df_drone, df_queen) %>% scale_xy(2)
}
