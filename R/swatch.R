#' Create swatch widget
#'
#' Useful for showing discrete palettes
#'
#' @param colors     `character` vector of CSS colors. Can be hex codes, etc.
#' @param height     `numeric` height of widget (pixels).
#' @param dx         `numeric` spacing between color-swatches (pixels).
#' @param margin     `numeric` margin around the canvas (pixels).
#' @param background `character` CSS color for the canvas background.
#' @param elementId  `character` ID for the enclosing element.
#'
#' @return htmlwidget
#' @examples
#'   swatch(terrain.colors(10))
#' @export
#'
swatch <- function(colors, height = 40, dx = 10, margin = 0,
                   background = NULL, elementId = NULL) {

  x <- list(
    colors = as_hex(colors),
    height = height,
    dx = dx,
    margin = margin,
    background = unlist(as_hex(background))
  )

  htmlwidgets::createWidget(
    "splattr_swatch",
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
