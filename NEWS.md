# splattr 0.0.0 (development version)

* `hcl_table()` uses a monospace font to show the hex-codes colors.

* Added argument `background` to `hcl_dataframe()` and `hcl_table()`. If provided, the prominence (perceptual distance) of each color with respect to the `background` is calculated. Further, the background color of the table is set. 

* Functions `hcl_dataframe()` and `hcl_table()` can take a named list or vector of `colors`. Tweaks table-formatting. (#16)

* Added arguments `background` and `margin` to `ramp()` and `swatch()`, can help to simulate, for example, dark-mode. (#1, #2)
 
* Unexported `input_cvd()`; plan to restore when it can be made useful. (#12)

* Added functions `hcl_dataframe()` and `hcl_table()`: work with colors in terms of 
  hue, chroma, and luminance. (#9)

* Added functions `ramp()` and `swatch()`: HTMLWidgets to display discrete and 
  contintuous palettes, respectively.

* Added a `NEWS.md` file to track changes to the package.
