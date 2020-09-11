hex_distance <- function (hex, hex_ref, method = "cie2000") {

  assertthat::assert_that(
    # is_hexcolor(hex),
    # is_hexcolor(hex_ref),
    method %in% c("euclidean", "cie1976", "cie94", "cie2000","cmc")
  )

  if (identical(length(hex), 1L)) {
    hex <- rep(hex, length(hex_ref))
  }

  if (identical(length(hex_ref), 1L)) {
    hex_ref <- rep(hex_ref, length(hex))
  }

  if (!identical(length(hex), length(hex_ref))) {
    stop(
      "Cannot reconcile length of `hex` and `hex_ref`",
      call. = FALSE
    )
  }

  list_rgb <- function(x) {
    purrr::map(x, ~t(grDevices::col2rgb(.x)))
  }
  rgb <- list_rgb(hex)
  rgb_ref <- list_rgb(hex_ref)
  distance <- purrr::map2_dbl(
    rgb,
    rgb_ref,
    farver::compare_colour,
    from_space = "rgb", method = method
  )

  distance
}
