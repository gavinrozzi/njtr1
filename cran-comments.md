# cran-comments (2021-05-14)
## Update 

This update adds an additional function, `read_njtr1()` for reading and cleaning offline data. Additionally, this update enhances the core functionality of the package by supporting downloading data for a specific county via the county argument of `get_njtr1()`

## Test environments
* local macOS Big Sur install on Apple Silicon, R 4.0.5
* Win-builder (oldrelease, devel, release)
* local Windows 10 development machine, R 4.0.5

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE: 
Possibly mis-spelled words in DESCRIPTION:
  NJDOT (10:117)

This is a proper acronym for the government agency that publishes the data used by this package, and can be disregarded.




