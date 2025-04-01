test_that("game starts", {
    expect_error(icehouse_martian_chess(n_players = 3L))

    skip_on_os("windows")
    skip_if_not_installed("ppcli")

    expect_snapshot(ppcli::cat_piece(icehouse_martian_chess(seed = 42, n_players = 2L)))
    expect_snapshot(ppcli::cat_piece(icehouse_martian_chess(seed = 42, n_players = 4L)))
    expect_equal(nrow(icehouse_none()), 0L)
    expect_snapshot(ppcli::cat_piece(icehouse_setup_by_name("Alien City", seed = 42),
                                     reorient = "symbols"))

    skip_if_not_installed("ppn", "0.2.0-4")
    game <- ppn::read_ppn(system.file("ppn/martian-chess.ppn", package = "piecenikr"))[[1L]]                                       
    expect_snapshot(ppn::cat_move(game))
})
