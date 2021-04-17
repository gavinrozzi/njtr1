# cran-comments (2021-04-17)
## Update 

This is a resubmission. The DESCRIPTION file has been corrected to address an issue identified by the CRAN team.

This version contains additional changes to code to ensure that the function `get_njtr1()` fails gracefully to supplement changes to the vignette. Furthermore, this update adds additional enhancements to core functionality by parsing dates and supporting the download of additional years of data.


## Test environments
* local macOS Big Sur install on Apple Silicon, R 4.0.5
* rhub (oldrelease, devel, release)
* local Windows 10 development machine, R 4.0.4

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE: 
Possibly mis-spelled words in DESCRIPTION:
  NJTR (10:164)

This is a proper acronym for the type of traffic data covered by this package, and can be disregarded.

## Downstream dependencies
I have also run R CMD check on all downstream dependencies used by zipcodeR using revdep. There were no errors.



