context("test-corpus_dissonance_table")

library(magrittr)

test_that("examples", {
  list(
    c(1, 2),
    c(3, 4),
    c(5, 6)
  ) %>%
    purrr::map(~ hrep::coded_vec(., type = "pc_set")) %>%
    hrep::corpus(type = "pc_set") %>%
    corpus_dissonance_table(type = "pc_set") %>%
    expect_equal(
      .corpus_dissonance_table(
        tibble::tibble(
          count = c(rep(1, times = 6), rep(0, times = hrep::alphabet_size("pc_set") - 6)),
          prob = (count + 1) / sum(count + 1),
          neg_log_prob = - log(prob)
        ), type = "pc_set"))
})
