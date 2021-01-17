#' Download NJ car accident records for a given year
#'
#'
#' @param year Year to download crash data
#' @param type The table of NJDOT crash data to download
#' @return tibble of all reported accidents for the year
#' @importFrom readr read_csv
#' @importFrom readr cols
#' @importFrom stringr str_to_lower
#' @importFrom lubridate mdy
#' @examples
#' get_njtr1(year = 2019, type = "Pedestrians")
#' @export
get_njtr1 <- function(year, type) {

  # Validate input for table selection
  tables <- c("Accidents", "Drivers", "Pedestrians", "Occupants", "Vehicles")

  if (type %in% tables == FALSE) {
    stop(paste("Invalid table type entered. Please choose from one of the following:", "\n", "Accidents, Drivers, Pedestrians, Occupants, Vehicles"))
  }

  # Convert Year to integer
  year <- as.integer(year)

  # Set base URL for data downloads
  base_url <- "https://www.state.nj.us/transportation/refdata/accident/"


  if (year >= 2017) {
    # Set parameters for download using input to function
    fields <- utils::read.csv(paste0(system.file("extdata", package = "njtr1"), "/fields/2017/", type, ".csv"), header = FALSE)
    file_name <- paste0(base_url, as.character(year), "/NewJersey", year, type, ".zip")
  } else if (year <= 2016) {
    stop("Years prior to 2017 are not yet supported")
  } else if (year > 2019) {
    stop("Years past 2019 are not yet supported")
  }

  # create a temporary directory and file for downloading the data
  zip_file <- tempfile(fileext = ".zip")
  td <- tempdir()
  utils::download.file(file_name, zip_file, mode = "wb")

  # Get name of first file in the ZIP archive
  fname <- utils::unzip(zip_file, list = TRUE)$Name[1]

  # unzip the file to the temporary directory
  utils::unzip(zip_file, files = fname, exdir = td, overwrite = TRUE)

  # Store path of extracted file
  fpath <- file.path(td, fname)


  # Read in the file
  data <- suppressWarnings(readr::read_csv(fpath, col_names = FALSE, trim_ws = TRUE, quote = "", col_types = readr::cols()))

  # Add field names
  names(data) <- fields$V1

  return(data)
}
