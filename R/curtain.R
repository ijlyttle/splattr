#' Create curtain widget
#'
#' Acknowledge [pals::pal.sineramp()], Peter Kovesi.
#'
#' @section Widget Sizing:
#'
#' The canvas width can be decreased according to the enclosing container, but will not exceed `width`.
#'
#' @param colors          `character` vector of CSS colors, e.g. hex-codes.
#' @param width           `numeric`   width of canvas (pixels).
#' @param height          `numeric`   height of canvas (pixels).
#' @param margin          `numeric`   margin around canvas (pixels).
#' @param background      `character` CSS color for canvas background.
#' @param wave_width      `numeric`   width of sine wave, i.e. wavelength
#'                                    (pixels).
#' @param wave_amplitude  `numeric`   amplitude of sine wave (non-dimensional).
#' @param wave_exponent   `numeric`   exponent for vertical dampening of
#'                                    sine wave (non-dimensional):
#'                                      use 0 for no dampening,
#'                                      use 1 for linear dampening.
#' @param n_color_interp  `numeric`   number interpolated colors on canvas.
#' @param elementId       `character` ID for enclosing element.
#'
#' @return Object with S3 classes `splattr_curtain`, `htmlwidget`.
#'
#' @export
#'
curtain <- function(colors, width = 512, height = 256,
                    margin = 0, background = NULL,
                    wave_width = 8, wave_amplitude = 0.125, wave_exponent = 2,
                    n_color_interp = 512, elementId = NULL) {

  # validate inputs

  # colors should be character vector

  # width, height, margin - scalar integerish

  # background: NULL or scalar character

  # wave_width, wave_amplitude. wave_exponent: scalar numeric

  # n_color_interp: scalar integerish

  # elementId: scalar character

  # forward options using x
  x <- list(
    colors = colors,
    width = width,
    height = height,
    margin = margin,
    background = background,
    waveWidth = wave_width,
    waveAmplitude = wave_amplitude,
    waveExponent = wave_exponent,
    nColorInterp = n_color_interp
  )

  # create widget
  htmlwidgets::createWidget(
    name = "splattr_curtain",
    x,
    sizingPolicy = splattr_sizing_policy(),
    width = width,
    height = height,
    package = "splattr",
    elementId = elementId
  )
}

