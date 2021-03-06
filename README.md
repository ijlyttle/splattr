
<!-- README.md is generated from README.Rmd. Please edit that file -->

# splattr

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/splattr)](https://CRAN.R-project.org/package=splattr)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/ijlyttle/splattr/workflows/R-CMD-check/badge.svg)](https://github.com/ijlyttle/splattr/actions)
<!-- badges: end -->

The goal of splattr is to provide some HTML-based tools for viewing and
evaluating color-palettes. It is strongly inspired by the approach that
Mike Bostock takes to show d3 color-palettes in
[Observable](https://observablehq.com/@d3/working-with-color).

## Installation

You can install the development version of splattr from
[GitHub](https://github.com/ijlyttle/splattr) with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/splattr")
```

## Examples

These examples are not run in the README because I am not able to get
`swatch()` and `ramp()` to print outside of an HTML context.

You can see them in action in the [get-started
article](https://ijlyttle.github.io/splattr/articles/splattr.html).

``` r
library("splattr")

colors <- colorspace::terrain_hcl(10)

swatch(colors)

ramp(colors)
```

## Contributing

Please note that the ‘splattr’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
