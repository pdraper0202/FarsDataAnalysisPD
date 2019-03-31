#' Read in multiple Fatality Analysis Reporting System data files.
#'
#' \code{fars_read_years} will read in multiple Fatality Analysis Reporting
#' System data files based on the years input.
#'
#' @param years Numeric. A vector of years of the associated files to be read in.
#'
#' @return \code{fars_read_years} will search for the filenames based on the years input.
#'   Refer to \code{\link{make_filename}} for the file naming conventions used.
#'   If the files exist a list containing the appropriate data will be returned.
#'   For files that do not exist, \code{fars_read_years} will throw a warning stating
#'   the relevant year.
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom magrittr "%>%"
#'
#' @examples
#' \dontrun{fars_read_years(2013:2014)}
#'
#' \dontrun{fars_read_years(2020)}
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
