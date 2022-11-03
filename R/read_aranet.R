#' Read CSVs from Aranet4
#'
#' @param x A path to a single CSV file
#' @export
#'
#' @return A data.table data.frame
read_one_aranet <- function(x) {
  recorded_date_time <- NULL

  meta_d <- fs::path_file(x) |>
    fs::path_ext_remove() |>
    stringr::str_split("_", n = 2, simplify = TRUE)

  dt <- data.table::fread(x)
  dt$temp <- dt[, 3]
  dt[, 3] <- NULL

  data.table::setnames(
    dt,
    c(
      "Time(dd/mm/yyyy)",
      "Carbon dioxide(ppm)",
      "Relative humidity(%)",
      "Atmospheric pressure(hPa)",
      "temp"
    ),
    c(
      "recorded_date_time",
      "carbon_dioxide_ppm",
      "relative_humidity_percent",
      "atmospheric_pressure_hpa",
      "temperature_celcius"
    )
  )

  dt <- dt[, ":="(
    recorded_date_time = lubridate::dmy_hms(recorded_date_time),
    sensor_display_name = as.factor(meta_d[1]),
    export_date_time = lubridate::ymd_hms(meta_d[2])
  ), ]

  return(dt)
}

#' Read and combine CSVs exported from Aranet4
#'
#' @param x A path to a directory or a list of paths to CSVs
#'
#' @return A data.table data.frame containing Aranet4 data
#' @details If you give this function a single CSV it will
#' read it in standardize all the columns and add some metadata
#' from the file name. If you give this function a directory
#' containing multiple CSVs or a vector of paths to multiple CSVs,
#' it will read and standardize all the supplied files into a single
#' dataframe. It will also remove duplicate rows allowing one to export
#' results from their device multiple times and then combine them
#' into a single file.
#' @export
#'
#' @examples
#' \dontrun{
#' # Read every CSV in a directory
#' dt <- read_aranet("path/to/directory/of/csvs")
#' # Read only specified CSVs
#' x <- c(
#'   "path/to/aranet_file_one.csv",
#'   "path/to/aranet_file_two.csv"
#' )
#' dt <- read_aranet(x)
#' }
read_aranet <- function(x) {
  if (fs::is_dir(x)) {
    x <- fs::dir_ls(x, regexp = "csv$")
  }

  df <- lapply(x, read_one_aranet)
  df <- do.call(rbind, df)
  df <- df[!duplicated(df[, 1:6]), ]

  return(df)
}
