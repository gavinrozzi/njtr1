#' Download NJ car accident records for a given year
#'
#'
#' @param year Year to download crash data
#' @return tibble of all reported accidents for the year
#' @examples
#' get_crashes(2019)
#' @importFrom readr read_csv
#' @export
get_crashes <- function(year) {
  fields <- read.csv('data/crash_fields_17_final.csv',header = FALSE)
  base_url <- 'https://www.state.nj.us/transportation/refdata/accident/'
  # Build download URL from function arguments
  file_name <- paste0(base_url,year,'/NewJersey',year,'Accidents.zip')
  # create a temporary directory and file
  zip_file <- tempfile(fileext = ".zip")
  td = tempdir()
  download.file(file_name, zip_file, mode = "wb")
  # Get name of first file in the ZIP archive
  fname <- unzip(zip_file, list=TRUE)$Name[1]
  # unzip the file to the temporary directory
  unzip(zip_file, files=fname, exdir=td, overwrite=TRUE)
  # Store path of extracted file
  fpath = file.path(td, fname)
  # Read in the file
  data <- suppressWarnings(readr::read_csv(fpath, col_names = FALSE, trim_ws = TRUE,quote="", col_types = cols()))
  # Add field names
  names(data) <- fields$V1
return(data)
}

#' Download NJ car accident driver data for a given year
#'
#'
#' @param year Year to download crash data
#' @return tibble of all drivers involved in car accidents for the year
#' @examples
#' get_drivers(2019)
#' @importFrom readr read_csv
#' @export
get_drivers <- function(year) {
  fields <- read.csv('data/driver_fields_17_final.csv',header = FALSE)
  base_url <- 'https://www.state.nj.us/transportation/refdata/accident/'
  # Build download URL from function arguments
  file_name <- paste0(base_url,year,'/NewJersey',year,'Drivers.zip')
  # create a temporary directory and file
  zip_file <- tempfile(fileext = ".zip")
  td = tempdir()
  download.file(file_name, zip_file, mode = "wb")
  # Get name of first file in the ZIP archive
  fname <- unzip(zip_file, list=TRUE)$Name[1]
  # unzip the file to the temporary directory
  unzip(zip_file, files=fname, exdir=td, overwrite=TRUE)
  # Store path of extracted file
  fpath = file.path(td, fname)
  # Read in the file
  data <- suppressWarnings(readr::read_csv(fpath, col_names = FALSE, trim_ws = TRUE,quote="", col_types = cols()))
  # Add field names
  names(data) <- fields$V1
  return(data)
}

#' Download NJ car accident vehicle data for a given year
#'
#'
#' @param year Year to download crash data
#' @return tibble of all vehicles involved in accidents for the year
#' @examples
#' get_accidents(2019)
#' @importFrom readr read_csv
#' @export
get_vehicles <- function(year) {
  fields <- read.csv('data/vehicle_fields_17_final.csv',header = FALSE)
  base_url <- 'https://www.state.nj.us/transportation/refdata/accident/'
  # Build download URL from function arguments
  file_name <- paste0(base_url,year,'/NewJersey',year,'Vehicles.zip')
  # create a temporary directory and file
  zip_file <- tempfile(fileext = ".zip")
  td = tempdir()
  download.file(file_name, zip_file, mode = "wb")
  # Get name of first file in the ZIP archive
  fname <- unzip(zip_file, list=TRUE)$Name[1]
  # unzip the file to the temporary directory
  unzip(zip_file, files=fname, exdir=td, overwrite=TRUE)
  # Store path of extracted file
  fpath = file.path(td, fname)
  # Read in the file
  data <- suppressWarnings(readr::read_csv(fpath, col_names = FALSE, trim_ws = TRUE,quote="", col_types = cols()))
  # Add field names
  names(data) <- fields$V1
  return(data)
}  

