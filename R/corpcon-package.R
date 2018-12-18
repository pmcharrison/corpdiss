#' @keywords internal
"_PACKAGE"

#' @importFrom tibble tibble
NULL

#' Consonance tables for popular music
#'
#' This table summarises chord prevalences in the
#' McGill Billboard corpus \insertCite{Burgoyne2011}{hcorp}.
#' These pieces were sampled from the Billboard magazine's
#' United States "Hot 100" chart between 1958 and 1991,
#' and transcribed by expert musicians.
#' See \code{\link[hcorp]{popular_1}} for more details.
#'
#' @details
#' Chords are represented as pitch-class chord types:
#' see \code{\link[hrep]{pc_chord_type}} for details.
#'
#' @name popular_1_pc_chord_type
#' @docType data
#' @references
#' \insertAllCited{}
#' @keywords data
NULL

utils::globalVariables(".", "corpdiss")
