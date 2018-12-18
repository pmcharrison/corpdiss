#' Count chords
#'
#' This function counts chords within a corpus.
#' @param x Corpus to analyse.
#' @param type Representation to which chords should be coerced
#' before counting.
#' @return Integer vector providing the observed counts for each chord,
#' indexed by the type encoding defined in the \code{hrep} package.
#' @rdname count_chords
#' @export
count_chords <- function(x, type = "pc_chord_type") {
  UseMethod("count_chords")
}

#' @rdname count_chords
#' @export
count_chords.corpus <- function(x, type = "pc_chord_type") {
  hrep::represent(x, type) %>%
    do.call(c, .) %>%
    factor(levels = seq_len(hrep::alphabet_size(type))) %>%
    table %>%
    as.integer
}
