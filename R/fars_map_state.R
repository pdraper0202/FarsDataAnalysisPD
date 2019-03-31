#' Create map of accidents by state.
#'
#' \code{fars_map_state} plots the geographic location of accidents for the
#' input state and year.
#'
#' @param state.num Numeric. The state number.
#' @param year Numeric. The relevant year.
#'
#' @return \code{fars_map_state} returns a plot of the map of the given state, as well
#'   as the geographic location of the accidents occurring in that state for the given year.
#'   If the state number does not exist, \code{fars_map_state} will throw an error.
#'   If there are no accidents in the state for the given year, \code{fars_map_state} will
#'   display a message indicating this.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @examples
#' \dontrun{fars_map_state(23, 2014)}
#'
#' \dontrun{fars_map_state(52, 2014)}
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
