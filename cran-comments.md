# cran-comments (2021-06-13)
## Update 

This update refactors `get_njtr1()` to use `read_njtr1()` for downloading data to avoid repetitions in code. The functions have also been modified to better handle the removal of excess whitespace.

## Test environments
* local macOS Big Sur install on Apple Silicon, R 4.1.0
* Win-builder (oldrelease, devel, release)
* local Windows 10 development machine, R 4.0.5

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE: 
Possibly mis-spelled words in DESCRIPTION:
  NJDOT (10:117)

This is a proper acronym for the government agency that publishes the data used by this package, and can be disregarded.




