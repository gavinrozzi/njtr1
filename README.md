# njtr1 <a href='https://gavinrozzi.github.io/njtr1/'><img src='man/figures/logo.png' align="right" height="139" /></a>


`njtr1` is an R package that provides provides an interface to easily download car crash records maintained by the New Jersey Department of Transportation. These records are collected from police officers in New Jersey when they complete the form NJTR-1 following a motor vehicle crash that is reported to law enforcement.

This package allows for the download of multiple tables of crash records and cleans and formats the data for analysis.

More details about the NJTR-1 crash reporting process is available through the [New Jersey Department of Transportation.](https://www.state.nj.us/transportation/refdata/accident/pdf/NJTR-1CrashReportManual12517.pdf)

This package currently provides data from 2017 - 2019. We are currently working on implementing the format of the older data from 2016 prior.

## Installation
The latest development version can be installed like so using devtools:
``` r
devtools::install_github("gavinrozzi/njtr1")
```
## Usage
``` r
# Load the njtr1 library into R
library(njtr1)

# Get crash data for the year 2019
get_njtr1(year = 2019, type = "Accidents")

# Get vehicle data for the year 2019
get_njtr1(year = 2019, type = "Vehicles")

# Get driver data for the year 2019
get_njtr1(year = 2019, type = "Drivers")

# Get occupant data for the year 2019
get_njtr1(year = 2019, type = "Occupants")

# Get pedestrian data for the year 2019
get_njtr1(year = 2019, type = "Pedestrians")

```

## Documentation
Documentation for the current release [is available here.](https://gavinrozzi.github.io/njtr1/)
See the [reference section](https://gavinrozzi.github.io/njtr1/reference/) for full details on how to use each of the functions provided by `njtr1`.
