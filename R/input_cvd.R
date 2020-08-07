#' Create CVD widget
#'
#' This is a set of inputs that offers a transformation matrix
#' for color-vision deficiency.
#'
#' @param choice `character` initialization: indicates which form of CVD to simulate.
#' @param severity `numeric` initialization: indicates the severity of CVD to simulate.
#' @param label `character` label for the widget.
#' @param elementId `character` ID for the enclosing element.
#'
#' @return htmlwidget
#' @examples
#'   # input_cvd("cvd-control")
#' @noRd
#'
input_cvd <- function(choice = c("none", "deutan", "protan", "tritan"),
                      severity = 0, label = "Color-Vision Deficiency",
                      elementId = NULL) {

   choice <- match.arg(choice)

   assertthat::assert_that(
     assertthat::is.number(severity),
     severity >= 0,
     severity <= 1
   )

   x <- list(choice = choice, severity = severity, label = label)

   htmlwidgets::createWidget(
     "splattr_input_cvd",
     x,
     package = "splattr",
     elementId = elementId
   )
}
