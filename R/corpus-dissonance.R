#' Corpus dissonance
#'
#' Calculates a corpus-based estimate of the dissonance of a sonority.
#' @param x Sonority to analyse.
#' This should be an object created by the \code{hrep} package,
#' representing a pitch chord (\code{\link[hrep]{pi_chord}}),
#' representing a pitch-class chord (\code{\link[hrep]{pc_chord}}),
#' representing a pitch-class chord type (\code{\link[hrep]{pc_chord_type}}),
#' or a pitch-class set (\code{\link[hrep]{pc_set}}).
#' This object will be coerced to the same type as the table,
#' i.e. \code{type(table)}.
#' @param table Corpus dissonance table, as created by
#' \code{\link{corpus_dissonance_table}()}.
#' This table summarises chord prevalences within a corpus.
#' The default is \code{\link{popular_1_pc_chord_type}}.
#' @return Dissonance estimate, as a numeric scalar.
#' @export
corpus_dissonance <- function(x, table = corpdiss::popular_1_pc_chord_type) {
  typ <- type(table)
  x <- hrep::represent(x, typ)
  i <- hrep::encode(x)
  table$neg_log_prob[i]
}
