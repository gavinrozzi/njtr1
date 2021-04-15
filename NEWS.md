# *News*

# njtr1 0.1
Initial public release

# njtr1 0.1.1
Hotfix to address archival by CRAN, one vignette updated

# njtr1 0.2
Support added for downloading historical crash data from 2001 - 2016

Date fields are now automatically parsed for driver DOB and crash date fields using `{lubridate}`

`get_njtr1()` refactored to fail gracefully when internet resources unavailable

New argument added to select only geotagged crash data suitable for mapping (geo = TRUE)

Fix an error that caused coordinates to be unavailable in crash data due to parsing failures

