#' Corpus dissonance table
#'
#' Derives sufficient information from a corpus to formulate
#' a corpus-based dissonance model.
#' @param x Corpus to analyse, as created by \code{hrep::\link[hrep]{corpus}}.
#' @param type (Scalar character) Representation to which chords should be coerced
#' before counting.
#' @param add (Scalar numeric) Number to add to each count before computing probabilities.
#' This is useful for ensuring that chord probabilities exceed zero.
#' @return Returns an object of class \code{corpus_dissonance_table},
#' a \link[tibble]{tibble} where each row corresponds to a
#' different pitch-class chord type (i.e. an object of class \code{pc_chord_type}),
#' with the mapping between integer indices and chord types defined by
#' the \code{hrep} package.
#' This tibble contains the following columns:
#' \item{count}{The number of times the chord type was observed in the corpus.}
#' \item{prob}{The inferred probability of that chord type.}
#' \item{log_prob}{The inferred log probability of that chord type.}
#' @rdname corpus_dissonance_table
#' @export
corpus_dissonance_table <- function(x, type = "pc_chord_type", add = 1L) {
  UseMethod("corpus_dissonance_table")
}

#' @rdname corpus_dissonance_table
#' @export
corpus_dissonance_table.corpus <- function(x, type = "pc_chord_type", add = 1L) {
  df <- tibble::tibble(count = count_chords(x, type))
  df$count <- df$count
  df$prob <- (df$count + add) / sum(df$count + add)
  df$neg_log_prob <- - log(df$prob)
  .corpus_dissonance_table(df, type)
}

.corpus_dissonance_table <- function(df, type) {
  class(df) <- c("corpus_dissonance_table", class(df))
  type(df) <- type
  df
}

#' @export
print.corpus_dissonance_table <- function(x, ...) {
  cat("# An object of class 'corpus_dissonance_table'\n")
  cat("# Type: ", type(x), "\n", sep = "")
  NextMethod()
}

#' @export
type.corpus_dissonance_table <- function(x) {
  attr(x, "type")
}

`type<-.corpus_dissonance_table` <- function(x, value) {
  attr(x, "type") <- value
  x
}
