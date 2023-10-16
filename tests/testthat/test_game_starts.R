test_that("game starts", {
    expect_error(df_martian_chess(n_players = 3))

    skip_on_os("windows")
    skip_if_not_installed("ppcli")

    expect_snapshot(ppcli::cat_piece(df_martian_chess(seed = 42, n_players = 2)))
    expect_snapshot(ppcli::cat_piece(df_martian_chess(seed = 42, n_players = 4)))
})
