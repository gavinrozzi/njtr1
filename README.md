
<!-- README.md is generated from README.Rmd. Please edit that file -->

# njtr1 <a href='https://gavinrozzi.github.io/njtr1/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->
[![R-CMD-check](https://github.com/gavinrozzi/njtr1/workflows/R-CMD-check/badge.svg)](https://github.com/gavinrozzi/njtr1/actions)
[![CRAN
Status](https://www.r-pkg.org/badges/version-last-release/njtr1)](https://www.r-pkg.org/badges/version-last-release/zipcodeR)
[![CRAN
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/njtr1)](https://cranlogs.r-pkg.org/badges/grand-total/zipcodeR)
<!-- badges: end -->

[njtr1](https://gavinrozzi.github.io/njtr1/index.html) is an R package
that provides provides an interface to easily download car crash records
maintained by the New Jersey Department of Transportation. These records
are collected from police officers in New Jersey when they complete the
form NJTR-1 following a motor vehicle crash that is reported to law
enforcement.

This package allows for the download of multiple tables of crash records
and cleans and formats the data for analysis.

More details about the NJTR-1 crash reporting process is available
through the [New Jersey Department of
Transportation.](https://www.state.nj.us/transportation/refdata/accident/pdf/NJTR-1CrashReportManual12517.pdf)

This package currently supports the download of all crash table data
maintained by NJDOT from 2001-2019.

## Installation

You can install the released version of njtr1 from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("njtr1")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gavinrozzi/njtr1")
```

## Examples

This is a basic example which shows you how to solve a common problem:

``` r
library(njtr1)

# Get crash data for the year 2019
acc_19 <- get_njtr1(year = 2019, type = "Accidents")
#> njtr1: downloading data

head(acc_19)
#>                       id county_name municipality_name crash_date
#> 1      201901011902-0465    ATLANTIC      ABSECON CITY 2019-02-14
#> 2 20190101I-02019-002921    ATLANTIC      ABSECON CITY 2019-01-28
#> 3  20190101I-2019-000096    ATLANTIC      ABSECON CITY 2019-01-01
#> 4  20190101I-2019-000242    ATLANTIC      ABSECON CITY 2019-01-02
#> 5  20190101I-2019-000962    ATLANTIC      ABSECON CITY 2019-01-09
#> 6  20190101I-2019-001122    ATLANTIC      ABSECON CITY 2019-01-11
#>   crash_day_of_week crash_time police_dept_code police_department
#> 1                TH       1005                1  ATLANTIC CITY PD
#> 2                MO        953                1   ABSECON CITY PD
#> 3                TU        853                1   ABSECON CITY PD
#> 4                WE       2200                1   ABSECON CITY PD
#> 5                WE       1253                1   ABSECON CITY PD
#> 6                FR        855                1   ABSECON CITY PD
#>   police_station total_killed total_injured pedestrians_killed
#> 1                           0             0                  0
#> 2                           0             2                  0
#> 3                           0             0                  0
#> 4                           0             4                  0
#> 5                           0             0                  0
#> 6                           0             0                  0
#>   pedestrians_injured severity intersection alcohol_involved hazmat_involved
#> 1                   0        P            B                N               N
#> 2                   0        I            B                N               N
#> 3                   0        P            B                N               N
#> 4                   0        I            I                N               N
#> 5                   0        P            B                N               N
#> 6                   0        P            B                N               N
#>   crash_type_code total_vehicles_involved         crash_location
#> 1              11                       1                  US 30
#> 2               1                       2              ROUTE 585
#> 3              11                       1 ATLANTIC COUNTY 646 II
#> 4               3                       2    ATLANTIC COUNTY 601
#> 5               1                       2    ATLANTIC COUNTY 651
#> 6               2                       2    ATLANTIC COUNTY 651
#>   location_direction route route_suffix sri_std_rte_identifier milepost
#> 1                  W    30                          00000030__    54.30
#> 2                      585                          00000585__     9.23
#> 3                      646            2             010006462_     0.16
#> 4                      601                          01000601__     0.68
#> 5                      651                          01000651__    12.00
#> 6                      651                          01000651__    11.95
#>   road_system road_character road_horizontal_alignment road_grade
#> 1           2             NA                         1          4
#> 2           5             NA                         1          4
#> 3           5             NA                         2          6
#> 4           5             NA                         1          4
#> 5           5             NA                         1          4
#> 6           5             NA                         1          4
#>   road_surface_type surface_condition light_condition environmental_condition
#> 1                 2                 1               1                       1
#> 2                 2                 1               1                       1
#> 3                 2                 2               1                       1
#> 4                 2                 1               7                       1
#> 5                 2                 1               1                       1
#> 6                 2                 1               1                       1
#>   road_divided_by temporary_traffic_control_zone distance_to_cross_street
#> 1               1                              1                       NA
#> 2               5                              1                      209
#> 3               5                              1                      821
#> 4               5                              1                       NA
#> 5               5                              1                      100
#> 6               5                              1                      158
#>   unit_of_measurement directn_from_cross_street           cross_street_name
#> 1                                                                          
#> 2                  FE                         N W BOLTON AVE / E BOLTON AVE
#> 3                  FE                         E    US 30 / WHITE HORSE PIKE
#> 4                  AT                           CR 651 / MILL AVE / MILL RD
#> 5                  FE                         N        US 30 / ABSECON BLVD
#> 6                  FE                         S        US 30 / ABSECON BLVD
#>   is_ramp ramp_tofrom_route_name ramp_tofrom_route_direction posted_speed
#> 1      NA                                                              50
#> 2      NA                                                              35
#> 3      NA                                                              35
#> 4      NA                                                              40
#> 5      NA                                                              35
#> 6      NA                                                              35
#>   posted_speed_cross_street first_harmful_event latitude longitude
#> 1                        NA                  NA       NA        NA
#> 2                        25                  26       NA        NA
#> 3                        50                  48       NA        NA
#> 4                        35                  26       NA        NA
#> 5                        40                  26       NA        NA
#> 6                        40                  26       NA        NA
#>   cell_phone_in_use_flag other_property_damage reporting_badge_no
#> 1                      N                                      840
#> 2                      N                                      861
#> 3                      N                                      864
#> 4                      N                                      846
#> 5                      N                                      849
#> 6                      N                                      847

# Get vehicle data for the year 2019
veh_19 <- get_njtr1(year = 2019, type = "Vehicles")
#> njtr1: downloading data

head(veh_19)
#>                       id vehicle_number insurance_company_code owner_state
#> 1      201901011902-0465              1                    134          NJ
#> 2 20190101I-02019-002921              1                    411          NJ
#> 3 20190101I-02019-002921              2                    134          NJ
#> 4  20190101I-2019-000096              1                     NA          NJ
#> 5  20190101I-2019-000242              1                    135          NJ
#> 6  20190101I-2019-000242              2                    963          NJ
#>   make_of_vehicle model_of_vehicle color_of_vehicle year_of_vehicle
#> 1           HONDA       ELEMENT LX               RD            2005
#> 2      VOLKSWAGEN              JET               GY            2017
#> 3            JEEP               GC               BL            2006
#> 4         MERCURY              GRA               BK            2006
#> 5          NISSAN              PAT               TN            1998
#> 6           BUICK              LAC               BL            2011
#>   license_plate_state vehicle_weight_rating towed removed_by
#> 1                  NJ                                     NA
#> 2                  NJ                                      3
#> 3                  NJ                                      3
#> 4                  NJ                                      3
#> 5                  NJ                                      3
#> 6                  NJ                                      3
#>   drivenleft_at_scenetowed initial_impact_location principal_damage_location
#> 1                        3                      11                        12
#> 2                        3                      12                        12
#> 3                        1                       6                         6
#> 4                        3                      11                        11
#> 5                        3                      12                        12
#> 6                        3                      10                        10
#>   extent_of_damage traffic_controls_present vehicle_type vehicle_use
#> 1                4                        4            4           1
#> 2                4                        4            1           1
#> 3                3                        4            4           1
#> 4                4                        4            1           2
#> 5                4                        3            4           1
#> 6                4                        3            1           1
#>   special_function_vehicles cargo_body_type contributing_circumstances_1
#> 1                        NA              NA                            2
#> 2                        NA              NA                           20
#> 3                        NA              NA                           25
#> 4                         6              NA                           51
#> 5                        NA              NA                            3
#> 6                        NA              NA                           25
#>   contributing_circumstances_2 direction_of_travel precrash_action
#> 1                           NA                   4               1
#> 2                            2                   3               1
#> 3                           NA                   3               8
#> 4                           NA                   4              16
#> 5                           NA                   2               1
#> 6                           NA                   1               1
#>   first_sequence_of_events second_sequence_of_events third_sequence_of_events
#> 1                       48                        NA                       NA
#> 2                       26                        NA                       NA
#> 3                       26                        NA                       NA
#> 4                       48                        NA                       NA
#> 5                       26                        NA                       NA
#> 6                       26                        NA                       NA
#>   fourth_sequence_of_events most_harmful_event oversizeoverweight_permit
#> 1                        NA                 NA                        NA
#> 2                        NA                 26                        NA
#> 3                        NA                 26                        NA
#> 4                        NA                 48                        NA
#> 5                        NA                 26                        NA
#> 6                        NA                 26                        NA
#>   hazmat_status hazmat_class hazmat_placard usdot_number mcmx_number
#> 1                                                                   
#> 2                                                                   
#> 3                                                                   
#> 4                                                                   
#> 5                                                                   
#> 6                                                                   
#>   usdot__other_flag usdot__other_number carrier_name hit__run_driver_flag
#> 1                NA                  NA                                  
#> 2                NA                  NA                                  
#> 3                NA                  NA                                  
#> 4                NA                  NA                                  
#> 5                NA                  NA                                  
#> 6                NA                  NA

# Get driver data for the year 2019
driv_19 <- get_njtr1(year = 2019, type = "Drivers")
#> njtr1: downloading data

head(driv_19)
#>                       id vehicle_number   driver_city driver_state
#> 1      201901011902-0465              1 PLEASANTVILLE           NJ
#> 2 20190101I-02019-002921              1 ATLANTIC CITY           NJ
#> 3 20190101I-02019-002921              2       ABSECON           NJ
#> 4  20190101I-2019-000096              1 PLEASANTVILLE           NJ
#> 5  20190101I-2019-000242              1       ABSECON           NJ
#> 6  20190101I-2019-000242              2       ABSECON           NJ
#>   driver_zip_code driver_license_state driver_dob driver_sex alcohol_test_given
#> 1           08232                   NJ 1983-10-17          F                  N
#> 2           08401                   NJ 1997-10-07          F                  N
#> 3           08201                   NJ 1990-08-16          F                  N
#> 4           08232                   NJ 1958-07-02          M                  N
#> 5           08201                   NJ 1973-08-30          F                  N
#> 6           08201                   NJ 1985-08-12          M                  N
#>   alcohol_test_type alcohol_test_results                 charge_1 summons_1
#> 1                                                                          
#> 2                                        39:4-97 CARELESS DRIVING E19000154
#> 3                                                                          
#> 4                                                                          
#> 5                                                         39:4-81 E19000016
#> 6                                                                          
#>   charge_2 summons_2 charge_3 summons_3 charge_4 summons_4
#> 1                                                         
#> 2                                                         
#> 3                                                         
#> 4                                                         
#> 5                                                         
#> 6                                                         
#>   driver_physical_status_1 driver_physical_status_2
#> 1                       NA                       NA
#> 2                       NA                       NA
#> 3                       NA                       NA
#> 4                       NA                       NA
#> 5                       NA                       NA
#> 6                       NA                       NA

# Get occupant data for the year 2019
occ_19 <- get_njtr1(year = 2019, type = "Occupants")
#> njtr1: downloading data

head(occ_19)
#>                       id vehicle_number occupant_number physical_condition
#> 1      201901011902-0465              1               1                 NA
#> 2 20190101I-02019-002921              1               1                  4
#> 3 20190101I-02019-002921              1               2                 NA
#> 4 20190101I-02019-002921              2               3                  4
#> 5  20190101I-2019-000096              1               1                 NA
#> 6  20190101I-2019-000242              1               1                  4
#>   position_in_on_vehicle ejection_code age sex location_of_most_severe_injury
#> 1                      1             1  35   F                             NA
#> 2                      1             1  21   F                              5
#> 3                      6             1   1   F                             NA
#> 4                      1             1  28   F                              1
#> 5                      1             1  60   M                             NA
#> 6                      1             1  45   F                              5
#>   type_of_most_severe_phys_injury refused_medical_attention
#> 1                              NA                        NA
#> 2                               8                         2
#> 3                               0                         2
#> 4                               8                         1
#> 5                              NA                         1
#> 6                               8                         2
#>   safety_equipment_available safety_equipment_used airbag_deployment
#> 1                         11                    11                 1
#> 2                         11                    11                 4
#> 3                          5                     5                 4
#> 4                         11                     4                NA
#> 5                         11                     4                NA
#> 6                         11                     4                NA

# Get pedestrian data for the year 2019
ped_19 <- get_njtr1(year = 2019, type = "Pedestrians")
#> njtr1: downloading data

head(ped_19)
#>                      id pedestrian_number physical_condition  address_city
#> 1 20190101I-2019-003261                 1                  2 PLEASANTVILLE
#> 2 20190101I-2019-005077                 1                  4       ABSECON
#> 3 20190101I-2019-014064                 1                  3      GALLOWAY
#> 4 20190101I-2019-021064                 1                  1    LINDENWOLD
#> 5 20190101I-2019-025773                31                 NA     TUCKERTON
#> 6 20190101I-2019-030896                 1                  3       ABSECON
#>   address_state address_zip date_of_birth age sex alcohol_test_given
#> 1            NJ        8232    1974-12-31  44   M                   
#> 2            NJ        8201    1959-04-07  59   M                   
#> 3            NJ        8205    1997-10-03  21   F                   
#> 4            NJ        8021    1977-01-27  42   M                   
#> 5            NJ        8087    1975-03-20  44   M                   
#> 6            NJ        8201    1959-04-07  60   M                   
#>   alcohol_test_type alcohol_test_results charge_1 summons_1 charge_2 summons_2
#> 1                                     NA                                      
#> 2                                     NA                                      
#> 3                                     NA                                      
#> 4                                     NA                                      
#> 5                                     NA                                      
#> 6                                     NA                                      
#>   charge_3 summons_3 charge_4 summons_4 multi_charge_flag traffic_controls
#> 1                                                      NA                3
#> 2                                                      NA                3
#> 3                                                      NA                3
#> 4                                                      NA                3
#> 5                                                      NA                3
#> 6                                                      NA                3
#>   contributing_circumstances_1 contributing_circumstances_2 direction_of_travel
#> 1                           73                           NA                   3
#> 2                           73                           74                   2
#> 3                           73                           NA                   3
#> 4                           71                           72                   1
#> 5                           29                           NA                   2
#> 6                           73                           NA                   2
#>   precrash_action location_of_most_severe_injury
#> 1              43                              1
#> 2              33                             11
#> 3              43                              8
#> 4              42                              1
#> 5               1                             NA
#> 6              43                             10
#>   type_of_most_severe_phys_injury refused_medical_attention
#> 1                               4                         2
#> 2                               8                         2
#> 3                               5                         2
#> 4                               4                        NA
#> 5                              NA                        NA
#> 6                               8                         2
#>   safety_equipment_used hospital_code physical_status_1 physical_status_2
#> 1                     1          5101                 1                NA
#> 2                    NA          5104                 1                NA
#> 3                     1          5104                 1                NA
#> 4                    NA            NA                 0                NA
#> 5                    NA            NA                 1                NA
#> 6                    NA          5104                 1                NA
#>   is_bycyclist is_other
#> 1                      
#> 2                      
#> 3                      
#> 4                      
#> 5            Y         
#> 6
```
