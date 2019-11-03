#' Create swatch widget
#'
#' Useful for showing discrete palettes
#'
#' @param colors    `character` vector of CSS colors. Can be hex codes, etc.
#' @param height    `numeric` height of widget (pixels).
#' @param dx        `numeric` spacing between color-swatches (pixels).
#' @param elementId `character` ID for the enclosing element.
#'
#' @return htmlwidget
#' @examples
#'   swatch(terrain.colors(10))
#' @export
#'
swatch <- function(colors, height = 40, dx = 10, elementId = NULL) {

  x <- list(colors = colors, height = height, dx = dx)

  htmlwidgets::createWidget(
    "swatch",
    x,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      defaultHeight = "auto",
      padding = 0,
      viewer.padding = 10
    ),
    package = "splattr",
    elementId = elementId
  )
}
