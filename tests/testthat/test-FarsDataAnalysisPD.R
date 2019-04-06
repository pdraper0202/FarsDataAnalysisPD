library(FarsDataAnalysisPD)
library(testthat)
library(maps)

test_that("Invalid state numbers handled properly", {
  expect_error(fars_map_state(52, 2013))
})
