df <- read_aranet(system.file("extdata", package = "aranet4r"))
test_that("reading df works", {
  expect_length(df, 7)
  expect_equal(nrow(df), 499)
  expect_equal(max(df$temperature_celcius), 22.7)
})
