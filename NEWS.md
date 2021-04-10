# *News*

# njtr1 0.1
Initial public release

# njtr1 0.1.1
Hotfix to address archival by CRAN, one vignette updated

# njtr1 0.2 (in development)
Support added for download crash data from 2001 - 2016
Date fields are now parsed for driver DOB and crash date fields using `{lubridate}`
`get_njtr1()` refactored to fail gracefully when internet resources unavailable
New argument added to select only geotagged crash data (geo = TRUE)
Fix an error that caused coordinates to be unavailable in crash data due to parsing failures

