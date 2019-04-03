library(FarsDataAnalysisPD)
library(testthat)
library(maps)

test_that("Filename has proper extension", {
  filename <- make_filename(2020)
  expect_that(substr(filename, nchar(filename) - 8, nchar(filename)), matches(".csv.bz2"))
})

test_that("Invalid state numbers handled properly", {
  expect_error(fars_map_state(52, 2013))
})
