remove_alpha <- function(x) {
  # some hex-colors have an alpha channel, this removes that
  sub("^(#[A-Fa-f0-9]{6})[A-Fa-f0-9]{2}$", "\\1", x)
}


as_hex <- function(x) {

  # unnanme
  x <- unname(x)

  # reduce to 7 characters
  x <- remove_alpha(x)

  # return as list
  x <- as.list(x)

  x
}
