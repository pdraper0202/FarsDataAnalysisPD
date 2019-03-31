#' Read in a Fatality Analysis Reporting System data file.
#'
#' \code{fars_read} reads in a data file from the US National Highway
#' Traffic Safety Administration's Fatality Analysis Reporting System.
#'
#' @param filename Character. The name of the file containing the data.
#'
#' @return A dataframe table.
#'   If \code{filename} does not exist, an error will be thrown.
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @examples
#' \dontrun{fars_read("data/accident_2013.csv.bz2")}
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
