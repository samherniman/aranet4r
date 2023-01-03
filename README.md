
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aranet4r

<!-- badges: start -->

[![R-CMD-check](https://github.com/samherniman/aranet4r/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/samherniman/aranet4r/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/samherniman/aranet4r/branch/main/graph/badge.svg)](https://app.codecov.io/gh/samherniman/aranet4r?branch=main)

<!-- badges: end -->

The [Aranet4](https://aranet.com/products/aranet4/) is a portable indoor
air quality sensor for measuring CO<sup>2</sup>, temperature,
atmospheric pressure and relative humidity. These devices are accurate
and fun to use, however they are unable to store historic measurements
for longer than a fortnight. This package is designed to combine
exported Aranet files (in CSV format) into a single dataframe.

Currently, this package has a single function which combines all your
Aranet files into one and removes duplicate entries. Eventually this
package will include functions to plot these results, add them to a
database, and potentially connect directly to one’s device.

## Installation

You can install the development version of aranet4r from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pkg_install("samherniman/aranet4r")
```

## Recommended workflow

The following is the workflow that I use, feel free to use whatever
method you would like. The main takeaway is to save all of your aranet4
CSVs to a single folder and then run `read_aranet` on that folder. This
will then return a dataframe with all of them combined.

1.  Connect to your Aranet4 through Bluetooth on your phone 📱 using the
    Aranet4 app (available on the App Store and Google Play Store)
2.  Export Aranet data to a cloud drive that syncs with your computer,
    like iCloud. Share menu \>\> save to files \>\> new folder (name it
    *Aranet4* or something) \>\> save
3.  Use `read_aranet("path/to/your/aranet/files")` to read in the files

``` r
library(aranet4r)

df <- read_aranet(system.file("extdata", package = "aranet4r"))
```

``` r
dplyr::glimpse(df)
#> Rows: 499
#> Columns: 7
#> $ recorded_date_time        <dttm> 2022-10-20 20:21:24, 2022-10-20 20:23:24, 2…
#> $ carbon_dioxide_ppm        <int> 1459, 507, 483, 1073, 1150, 1088, 1057, 1019…
#> $ relative_humidity_percent <int> 63, 40, 45, 54, 54, 53, 52, 52, 51, 51, 50, …
#> $ atmospheric_pressure_hpa  <int> 1015, 1014, 1015, 1014, 1015, 1014, 1014, 10…
#> $ temperature_celcius       <dbl> 22.5, 22.7, 20.7, 20.8, 21.3, 21.7, 22.1, 22…
#> $ sensor_display_name       <fct> device1, device1, device1, device1, device1,…
#> $ export_date_time          <dttm> 2022-10-22 01:55:22, 2022-10-22 01:55:22, 2…
```

![Saving an Aranet4 CSV from an iOS
device](man/figures/README-savecsv.GIF)
