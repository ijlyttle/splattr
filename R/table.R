#' Create HCL data frame
#'
#' Needs colorspace package.
#'
#' @param colors `character` vector of R colors. Can be hex codes, etc.
#'
#' @return `data.frame` with columns: `color`, `hue`, `chroma` `luminance`.
#' @examples
#'   df_hcl("red")
#'   df_hcl("#FF0000")
#'   df_hcl(c("red", "green"))
#' @export
#'
df_hcl <- function(colors) {

  hcl <- list_hcl(colors)

  data.frame(
    color = colors,
    hue = hcl$hue,
    chroma = hcl$chroma,
    luminance = hcl$luminance,
    stringsAsFactors = FALSE
  )

}

# given colors, return a list of HCL values.
list_hcl <- function(colors) {

  if (!requireNamespace("colorspace", quietly = TRUE)) {
    stop("This function needs the {colorspace} package, please install it.")
  }

  rgb_num <- grDevices::col2rgb(colors)
  trgb_num <- t(rgb_num) / 255
  rgb <- colorspace::RGB(trgb_num)
  hcl <- methods::as(rgb, "polarLUV")

  access <- function(x) {
    unname(hcl@coords[, x])
  }

  list(
    hue = access("H"),
    chroma = access("C"),
    luminance = access("L")
  )
}
