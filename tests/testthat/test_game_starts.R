library("ppgames")
test_that("game starts", {
    verify_output("../text_diagrams/martian_chess_2.txt", cat_piece(df_martian_chess(seed = 42, n_players = 2)))
    expect_error(df_martian_chess(n_players = 3))
    verify_output("../text_diagrams/martian_chess_4.txt", cat_piece(df_martian_chess(seed = 42, n_players = 4)))
})
