#' HCL data
#'
#' These function help you consider colors in terms of their hue, chroma, and
#' luminance (HCL). You will need the {[colorspace](http://hclwizard.org/r-colorspace/)}
#' package to run these functions.
#'
#' - `hcl_dataframe()`: get a data frame with HCL data
#' - `hcl_table()`: get a formatted [gt table](https://gt.rstudio.com/index.html);
#'   you will need the {gt} package.
#'
#' @param colors   `character` vector of R colors. Can be hex codes, etc.
#'                             Names can be meaningful.
#' @param title    `character` title for table.
#' @param decimals `numeric`   number of decimal places for values in table.
#'
#' @return
#' \describe{
#'   \item{`hcl_dataframe()`}{`data.frame` with columns:
#'     `name`, `color`, `hue`, `chroma` `luminance`.}
#'   \item{`hcl_table()`}{An object with S3 class `gt_tbl`.}
#' }
#'
#' @examples
#'   # return data
#'   hcl_dataframe("red")
#'   hcl_dataframe("#FF0000")
#'   hcl_dataframe(c("red", "green"))
#'
#'   # return formatted table
#'   hcl_table(c("red", "green"))
#'
#' @export
#'
hcl_dataframe <- function(colors) {

  hcl <- hcl_list(colors)

  values <- unname(unlist(colors))
  names <- names(colors)

  names <- names %||% rep(NA_character_, length(colors))

  data.frame(
    name = names,
    color = values,
    hue = hcl$hue,
    chroma = hcl$chroma,
    luminance = hcl$luminance,
    stringsAsFactors = FALSE
  )

}

# given colors, return a list of HCL values.
hcl_list <- function(colors) {

  if (!requireNamespace("colorspace", quietly = TRUE)) {
    stop("This function needs the {colorspace} package, please install it.")
  }

  rgb_num <- grDevices::col2rgb(colors)
  trgb_num <- t(rgb_num) / 255
  rgb <- colorspace::sRGB(trgb_num)

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

#' @rdname hcl_dataframe
#' @export
#'
hcl_table <- function(colors, title = NULL, decimals = 0) {

  if (!requireNamespace("gt", quietly = TRUE)) {
    stop("This function needs the {gt} package, please install it.")
  }

  df_colors <- hcl_dataframe(colors)

  # if names are empty, remove
  has_no_names <- all(is.na(df_colors$name))
  if (has_no_names) {
    df_colors$name <- NULL
  }

  df_colors %>%
    gt::gt() %>%
    gt::cols_align(
      align = "right",
      columns = gt::vars("color")
    ) %>%
    gt::data_color(
      columns = gt::vars("color"),
      colors = identity
    ) %>%
    gt::fmt_number(
      columns = gt::vars("hue", "chroma", "luminance"),
      decimals = decimals
    ) %>%
    gt::tab_header(title = title) %>%
    gt::opt_align_table_header(align = "left")

}


