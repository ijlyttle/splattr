list_red <- list(hue = 12.17, chroma = 179.04, luminance = 53.24)

red_green <- c("red", "green")
list_red_green <-
  list(
    hue = c(12.17, 127.72),
    chroma = c(179.04, 135.78),
    luminance = c(53.24, 87.74)
  )

test_that("list_hcl works", {
  expect_equal(
    list_hcl("red"),
    list_red,
    tolerance = 0.01
  )

  expect_equal(
    list_hcl(red_green),
    list_red_green,
    tolerance = 0.01
  )
})

test_that("df_hcl works", {

  df_red_green <- df_hcl(red_green)

  expect_is(df_red_green, "data.frame")

  expect_named(
    df_red_green,
    c("color", "hue", "chroma", "luminance")
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
