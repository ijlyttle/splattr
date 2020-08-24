list_red <- list(hue = 12.17, chroma = 179.04, luminance = 53.24)

red_green <- c("red", "green", "#48216A")
list_red_green <-
  list(
    hue = c(12.17, 127.72, 282.40),
    chroma = c(179.04, 135.78, 45.05),
    luminance = c(53.24, 87.74, 21.97)
  )

test_that("hcl_list works", {
  expect_equal(
    hcl_list("#FF0000"),
    list_red,
    tolerance = 0.01
  )

  expect_equal(
    hcl_list(red_green),
    list_red_green,
    tolerance = 0.01
  )
})

test_that("hcl_dataframe works", {

  df_red_green <- hcl_dataframe(red_green)

  expect_s3_class(df_red_green, "data.frame")

  expect_named(
    df_red_green,
    c("name", "color", "hue", "chroma", "luminance")
  )

  expect_identical(
    df_red_green$name,
    c(NA_character_, NA_character_, NA_character_)
  )

  red_green_named <- red_green
  names(red_green_named) <- red_green
  df_red_green_named <- hcl_dataframe(red_green_named)

  expect_identical(
    df_red_green_named$name,
    red_green
  )
  expect_identical(
    df_red_green$color,
    red_green
  )

  expect_equal(
    df_red_green$hue,
    list_red_green$hue,
    tolerance = 0.01
  )

  expect_equal(
    df_red_green$chroma,
    list_red_green$chroma,
    tolerance = 0.01
  )

  expect_equal(
    df_red_green$luminance,
    list_red_green$luminance,
    tolerance = 0.01
  )

})

test_that("hcl_table works", {

  expect_is(hcl_table(red_green), "gt_tbl")

})
