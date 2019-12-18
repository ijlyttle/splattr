hex <- "#123456"
hex_alpha <- "#12345678"

test_that("as_hex returns a list", {
  expect_identical(as_hex(hex), list(hex))
  expect_identical(as_hex(c(hex, hex)), list(hex, hex))
})

test_that("as_hex removes the alpha", {
  expect_identical(as_hex(hex_alpha), list(hex))
})

test_that("as_hex removes the names", {
  expect_identical(as_hex(c("name" = hex)), list(hex))
})
