
<!-- README.md is generated from README.Rmd. Please edit that file -->

# corpdiss: A corpus-based model of dissonance perception

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The `corpdiss` R package implements a corpus-based model of dissonance
perception. This model represents the idea that dissonance decreases
through familiarity, and therefore perceptual dissonance should decrease
in proportion to a chord’s prevalence in a given musical style.

## Installation

You can install the current version of `corpdiss` from Github by
entering the following commands into R:

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("corpdiss")
```

## Example usage

### Estimating chordal consonance

The `corpus_dissonance` function estimates the consonance of an
individual chord.

``` r
library(corpdiss)

# Major triad, root position
corpus_dissonance(c(60, 64, 67))
#> [1] 0.7802433

# Major triad, first inversion
corpus_dissonance(c(64, 67, 72))
#> [1] 4.06715

# Minor triad, root position
corpus_dissonance(c(60, 63, 67))
#> [1] 2.271055

# Diminished triad
corpus_dissonance(c(60, 63, 66))
#> [1] 6.134397

# Augmented triad
corpus_dissonance(c(60, 64, 67))
#> [1] 0.7802433
```

By default, the `corpus_dissonance` function uses chord prevalences
extracted from the McGill Billboard dataset (Burgoyne, 2011). The
dataset’s contents were sampled from the Billboard magazine’s United
States “Hot 100” chart between 1958 and 1991, and transcribed by expert
musicians.

By default, the dissonance estimation treats chords as transposition
invariant, and chord pitches as octave-invariant, but differentiates
between different inversions of the same chord. Different behaviour can
be achieved by passing a custom corpus analysis to `corpus_dissonance`
(see `?corpus_dissonance` for more details).

### Adding new corpora

It is easy to analyse dissonance using a different corpus, or a
different chord representation.

``` r
corpus <- hcorp::classical_1[1:5]
analysis <- corpus_dissonance_table(corpus, type = "pc_set", add = 0)
chord <- c(60, 64, 67)
corpus_dissonance(chord, analysis)
#> [1] 4.106767
```
