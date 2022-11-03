
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aranet4r

<!-- badges: start -->
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
# install.packages("devtools")
devtools::install_github("samherniman/aranet4r")
```

## Reccommended workflow

The following is the workflow that I use, feel free to use whatever
method you would like.

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
df
#>       recorded_date_time carbon_dioxide_ppm relative_humidity_percent
#>   1: 2022-10-20 20:21:24               1459                        63
#>   2: 2022-10-20 20:23:24                507                        40
#>   3: 2022-10-20 20:25:24                483                        45
#>   4: 2022-10-20 20:27:23               1073                        54
#>   5: 2022-10-20 20:29:23               1150                        54
#>  ---                                                                 
#> 495: 2022-10-22 00:44:25                635                        51
#> 496: 2022-10-22 00:49:25                634                        51
#> 497: 2022-10-22 00:54:25                609                        51
#> 498: 2022-10-22 00:59:25                639                        51
#> 499: 2022-10-22 01:04:25                619                        51
#>      atmospheric_pressure_hpa temperature_celcius sensor_display_name
#>   1:                     1015                22.5             device1
#>   2:                     1014                22.7             device1
#>   3:                     1015                20.7             device1
#>   4:                     1014                20.8             device1
#>   5:                     1015                21.3             device1
#>  ---                                                                 
#> 495:                     1004                18.4             device1
#> 496:                     1004                18.4             device1
#> 497:                     1004                18.4             device1
#> 498:                     1004                18.4             device1
#> 499:                     1004                18.4             device1
#>         export_date_time
#>   1: 2022-10-22 01:55:22
#>   2: 2022-10-22 01:55:22
#>   3: 2022-10-22 01:55:22
#>   4: 2022-10-22 01:55:22
#>   5: 2022-10-22 01:55:22
#>  ---                    
#> 495: 2022-10-22 08:08:55
#> 496: 2022-10-22 08:08:55
#> 497: 2022-10-22 08:08:55
#> 498: 2022-10-22 08:08:55
#> 499: 2022-10-22 08:08:55
```
