#' HCL data
#'
#' These functions help you consider colors in terms of their hue, chroma, and
#' luminance (HCL). You will need the {[colorspace](http://hclwizard.org/r-colorspace/)}
#' package to run these functions.
#'
#' If you provide a `background` color, the *prominence* of each color from the
#' background, i.e. the perceptual distance from the background, is calculated.
#' Furthermore, `hcl_table()` sets the background color accordingly.
#'
#' - `hcl_dataframe()`: get a data frame with HCL data
#' - `hcl_table()`: get a formatted [gt table](https://gt.rstudio.com/index.html);
#'   you will need the {gt} package.
#'
#' @param colors     `character` vector of R colors. Can be hex codes, etc.
#'                               Names can be meaningful.
#' @param background `character` R color to use as background; used for
#'   prominence calculation.
#' @param title      `character` title for table.
#' @param decimals   `numeric`   number of decimal places for values in table.
#'
#' @return
#' \describe{
#'   \item{`hcl_dataframe()`}{`data.frame` with columns:
#'     `name`, `color`, `hue`, `chroma` `luminance`, `prominence`.}
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
hcl_dataframe <- function(colors, background = NULL) {

  hcl <- hcl_list(colors)

  values <- unname(unlist(colors))
  names <- names(colors)

  names <- names %||% rep(NA_character_, length(colors))

  df <-
    data.frame(
      name = names,
      color = values,
      hue = hcl$hue,
      chroma = hcl$chroma,
      luminance = hcl$luminance,
      stringsAsFactors = FALSE
    )

  if (!is.null(background)) {
    # add background prominence
    df$prominence <- hex_distance(values, background, method = "cie2000")
  }

  df
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
hcl_table <- function(colors, background = NULL, title = NULL, decimals = 1) {

  if (!requireNamespace("gt", quietly = TRUE)) {
    stop("This function needs the {gt} package, please install it.")
  }

  df_colors <- hcl_dataframe(colors, background = background)

  # if names are empty, remove
  has_no_names <- all(is.na(df_colors$name))
  if (has_no_names) {
    df_colors$name <- NULL
  }

  hcl_df_table(
    df_colors,
    background = background,
    title = title,
    decimals = decimals
  )
}

hcl_df_table <- function(df, background = NULL, title = NULL, decimals = 1) {

  is_numeric <- purrr::map_lgl(df, is.numeric)
  vars_numeric <- names(df)[is_numeric]

  is_character <- purrr::map_lgl(df, is.character)
  vars_character <- names(df)[is_character]

  df %>%
    gt::gt() %>%
    gt::cols_align(
      align = "right",
      columns = vars_character
    ) %>%
    gt::data_color(
      columns = "color",
      colors = identity
    ) %>%
    gt::fmt_number(
      columns = vars_numeric,
      decimals = decimals
    ) %>%
    gt::tab_style(
      style = gt::cell_text(
        transform = "lowercase",
        font = c("Courier New"),
        weight = "bold"
      ),
      locations = gt::cells_body(columns = "color")
    ) %>%
    gt::tab_header(title = title) %>%
    gt::opt_align_table_header(align = "left") %>%
    gt::tab_options(table.background.color = background)

}


