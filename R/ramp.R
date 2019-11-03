#' Create ramp widget
#'
#' Useful for showing continuous palettes
#'
#' @param colors    `character` vector of CSS colors. Can be hex codes, etc.
#' @param n         `numeric` number of colors to interpolate into the ramp.
#'   Uses `d3.interpolateRgbBasis()` to interpolate.
#' @param height    `numeric` height of widget (pixels).
#' @param elementId `character` ID for the enclosing element.
#'
#' @return htmlwidget
#' @examples
#'   ramp(terrain.colors(100))
#' @export
#'
ramp <- function(colors, n = 512, height = 40, elementId = NULL) {

  x <- list(colors = colors, n = n, height = height)

  htmlwidgets::createWidget(
    "splattr_ramp",
    x,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "auto",
      padding = 0,
      viewer.padding = 10
    ),
    package = "splattr",
    elementId = elementId,
    dependencies = r2d3::html_dependencies_d3(version = "5")
  )
}
