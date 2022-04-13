op <- options(piecepackr.at.inform = FALSE)
on.exit(options(op))
library("piecepackr")
library("tibble")
library("vdiffr")
context("looney_pyramids")
test_that("Looney Pyramids works as expected", {
    # icehouse pyramids
    cfg <- looney_pyramids()$icehouse_pieces
    dft <- tibble(piece_side = "tile_back", x = 1.5, y = 1.5, suit = NA, rank = NA, angle = NA)
    dfp <- tibble(piece_side = c("pyramid_face", "pyramid_left", "pyramid_right", "pyramid_back"),
                  x = c(1, 2, 2, 1), y = c(2, 2, 1, 1), suit = 1:4, rank = c(1:3, 3), angle = seq(90, 360, 90))
    df1 <- rbind(dft, dfp)

    dft <- tibble(piece_side = "tile_back", x = 3.5, y = 3.5, suit = NA, rank = NA, angle = NA)
    dfp <- tibble(piece_side = "pyramid_top", x = 2 + c(1, 2, 2, 1, 1, 2, 2, 2),
                  y = 2 + c(2, 2, 1, 1, 1, 1, 1, 1),
                  suit = c(1:6, 2, 3), rank = c(1:3, 3, 1, 2, 1, 1), angle = seq(0, 630, 90))
    df2 <- rbind(dft, dfp)
    df <- rbind(df1, df2)

    skip_on_ci()
    expect_doppelganger("looney_pyramids",
        function() pmap_piece(df, cfg = cfg, default.units = "in")
    )
})
