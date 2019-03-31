#' Summarize multiple FARS data files by year.
#'
#' \code{fars_summarize_years} provides a summary of the number of observations
#' in the FARS data files for each month for the given years input.
#'
#' @param years Numeric. A vector of years associated with the files to be summarized.
#'
#' @return \code{fars_summarize_years} returns a dataframe.
#'   If a file does not exist for a given year, \code{fars_summarize_years}
#'   will throw a warning regarding the given year.
#'
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#' @importFrom magrittr "%>%"
#'
#' @examples
#' \dontrun{fars_summarize_years(2013:2015)}
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
