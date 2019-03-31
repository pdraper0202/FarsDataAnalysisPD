#' Create a file name.
#'
#' \code{make_filename} creates a file name for an accident file using
#' the year input.
#'
#' @param year Numeric. The year to append to the file name.
#'
#' @return \code{make_filename} will return a file name based on the year input.
#'   Non-integer inputs are truncated.
#'
#' @examples
#' \dontrun{make_filename(2013)}
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
