#' Download New Jersey car accident records for a given year
#'
#'
#' @param year Year to download crash data for
#' @param type The table of NJDOT crash data to download
#' @param geo Logical, whether to filter only to geotagged cases (default = FALSE)
#' @return data.frame of all reported accidents for the year
#' @importFrom httr http_error
#' @importFrom lubridate mdy
#' @importFrom stats complete.cases
#' @examples
#' get_njtr1(year = 2019, type = "Pedestrians")
#' @export
get_njtr1 <- function(year, type, geo = FALSE) {

  # Validate input for table selection
  tables <- c("Accidents", "Drivers", "Pedestrians", "Occupants", "Vehicles")

  if (type %in% tables == FALSE) {
    stop(paste("Invalid table type entered. Please choose from one of the following:", "\n", "Accidents, Drivers, Pedestrians, Occupants, Vehicles"))
  }

  # Convert Year to integer
  year <- as.integer(year)

  # Set base URL for data downloads
  base_url <- "https://www.state.nj.us/transportation/refdata/accident/"

  # Set column names based on year selected to match NHJDOT schema
  if (year >= 2017 & year <= 2019) {
    # Set parameters for download using input to function
    fields <- utils::read.csv(paste0(system.file("extdata", package = "njtr1"), "/fields/2017/", type, ".csv"), header = FALSE)
    file_name <- paste0(base_url, as.character(year), "/NewJersey", year, type, ".zip")
  } else if (year <= 2016 & year >= 2001) {
    fields <- utils::read.csv(paste0(system.file("extdata", package = "njtr1"), "/fields/2001/", type, ".csv"), header = FALSE)
    file_name <- paste0(base_url, as.character(year), "/NewJersey", year, type, ".zip")
  } else if (year > 2019) {
    stop("Invalid year: No data for years past 2019 is currently available")
  }

  # create a temporary directory and file for downloading the data
  zip_file <- tempfile(fileext = ".zip")
  td <- tempdir()

  # Check if internet connection exists before attempting data download
  if (curl::has_internet() == FALSE) {
    message("No internet connection. Please connect to the internet and try again.")
    return(NULL)
  }

  # Check if data is available and download the data
  if (httr::http_error(file_name)) {
    message("Data source broken. Please try again.")
    return(NULL)
  } else {
    message("njtr1: downloading data")
    utils::download.file(file_name, zip_file, mode = "wb")
  }

  # Get name of first file in the ZIP archive
  fname <- utils::unzip(zip_file, list = TRUE)$Name[1]

  # unzip the file to the temporary directory
  utils::unzip(zip_file, files = fname, exdir = td, overwrite = TRUE)

  # Store path of extracted file
  fpath <- file.path(td, fname)


  # Read in the file
  data <- utils::read.csv(fpath, header = FALSE, row.names = NULL, quote = "")

  # Add field names
  names(data) <- fields$V1

  # Parse dates
  if (type == "Accidents") {
    suppressWarnings(data$crash_date <- lubridate::mdy(data$crash_date))
    # If geo is TRUE, only return geotagged cases
    if (geo == TRUE) {
      data <- data[complete.cases(data[, 46:47]), ]
    }
  } else if (type == "Pedestrians") {
    suppressWarnings(data$date_of_birth <- lubridate::mdy(data$date_of_birth))
  } else if (type == "Drivers") {
    data$driver_dob <- suppressWarnings(lubridate::mdy(data$driver_dob))
  }
  # Clean any empty columns
  keep.cols <- names(data) %in% c(NA)
  data_clean <- data[!keep.cols]
  return(data_clean)
}
