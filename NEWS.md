# splattr 0.0.0.9000 (development version)

* Added function `curtain()`: HTMLWidget to help evaluate perceptual uniformity. This is based on `pals::pal.sineramp()` by Kevin Wright, which is based on work by Peter Kovesi. (#5)

* Unexported `input_cvd()`; plan to restore when it can be made useful. (#12)

* Added functions `hcl_dataframe()` and `hcl_table()`: work with colors in terms of 
  hue, chroma, and luminance. (#9)

* Added functions `ramp()` and `swatch()`: HTMLWidgets to display discrete and 
  contintuous palettes, respectively.

* Added a `NEWS.md` file to track changes to the package.
