context("test-corpus_dissonance")

test_that("examples", {
  test <- function(x, y, tolerance = 1e-5) {
    expect_equal(corpus_dissonance(x), y, tolerance = tolerance)
  }
  test(c(60, 64, 67), 0.7802433)
  test(c(64, 67, 72), 4.06715)
  test(c(60, 63, 67), 2.271055)
  test(c(60, 63, 66), 6.134397)
  test(c(60, 64, 68), 7.551463)
  test(c(60, 64, 67, 70), 2.610535)
  test(c(60, 63, 67, 70), 2.650456)

  expect_equal(
    corpus_dissonance(c(60, 64, 67)),
    corpus_dissonance(hrep::pc_chord(c(0, 4, 7)))
  )
  expect_equal(
    corpus_dissonance(c(64, 67, 72)),
    corpus_dissonance(hrep::pc_chord(c(4, 7, 0)))
  )
  expect_equal(
    corpus_dissonance(hrep::pc_set(c(0, 3, 6))),
    corpus_dissonance(hrep::pc_chord_type(c(0, 3, 6)))
  )
})

