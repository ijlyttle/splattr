# splattr 0.0.0 (development version)

* Added function `curtain()`: HTMLWidget to help evaluate perceptual uniformity. This is based on `pals::pal.sineramp()` by Kevin Wright, which is based on work by Peter Kovesi. (#5)

* Functions `hcl_dataframe()` and `hcl_table()` can take a named list or vector of `colors`. Tweaks table-formatting. (#16)

* Added arguments `background` and `margin` to `ramp()` and `swatch()`, can help to simulate, for example, dark-mode. (#1, #2)
 
* Unexported `input_cvd()`; plan to restore when it can be made useful. (#12)

* Added functions `hcl_dataframe()` and `hcl_table()`: work with colors in terms of 
  hue, chroma, and luminance. (#9)

* Added functions `ramp()` and `swatch()`: HTMLWidgets to display discrete and 
  contintuous palettes, respectively.

* Added a `NEWS.md` file to track changes to the package.
