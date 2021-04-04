# cran-comments (2021-04-04)
## Update 0.1.1
In this update, the vignette has been updated so that it will not fail if external data is unable to be downloaded in order to address comments by the CRAN team. The vignette now does not depend on any external data sources.


## Test environments
* local macOS Big Sur install on Apple Silicon, R 4.0.4
* win-builder (oldrelease, devel, release)
* local Windows 10 development machine, R 4.0.4

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE: 
Possibly mis-spelled words in DESCRIPTION:
  NJTR (10:164)

This is a proper acronym for the type of traffic data covered by this package, and can be disregarded.

## Downstream dependencies
I have also run R CMD check on all downstream dependencies used by zipcodeR using revdep. There were no errors.



