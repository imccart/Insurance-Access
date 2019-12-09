# Insurance Access and Medicaid Expansion
This repository provides the necessary code and links to download and organize selected insurance data from the ACS and Medicaid expansion data from the Kaiser Family Foundation.

## Raw Data
The raw data is available from two sources:

1. Insurance Data:<br>
You can download insurance data directly from the ACS. Here is the link for specific tables, [Health Insurance Tables](https://www.census.gov/data/tables/time-series/demo/health-insurance/historical-series/hic.html), and here is the more general data source, [US Census Data](https://data.census.gov/cedsci/). If you choose to download the data directly, it is probably easiest to go to the census data link and search for the table number, *B27010*. This table will provide "Types of Health Insurance Coverage by Age" and includes a breakdown of insurance by employer-provided insurance, direct purchase, Medicare, Medicaid, and other sources. 

A much easier approach (albeit with less data available as of this writing) is to access the Census data via an API. For more info, see the Census developers page [here](https://www.census.gov/developers/). This approach spares you and your computer the need to store all of the raw data, which can become a bit much if you want lots of different variables. This is the approach I take in this repo.

To start accessing Census data via API in *R*, first install the `acs` package. Then go to [API request](https://api.census.gov/data/key_signup.html) to request an API key. Once you've installed the package and you have your API key, type `api.key.install(key='your key')` in the *RStudio* command line. This will store your key for future use so that you don't have to keep track of it. But still save your key somewhere just in case you have to re-install *RStudio* at some point. From here, you can work with the code file below to get the relevant data.

2. Medicaid expansion:<br>
The best source of Medicaid expansion data that I've found is from the *Kaiser Family Foundation*. They provide an interactive map of Medicaid expansion status [here](https://www.kff.org/medicaid/issue-brief/status-of-state-medicaid-expansion-decisions-interactive-map/). From that link, there is a *Download Data* link that will give you the raw .csv file. When I downloaded these data, the csv file is formatted oddly, so I removed all formatting before saving a version on my own computer.


## Code
The master code file, [_BuildFinalData.R](data-code/_BuildFinalData.R), will call two individual code files when compiling the final dataset. 

1. The script to collect and tidy the ACS data, [ACS.R](data-code/ACS.R). Note that you must have the `acs` package loaded and your api key saved for this to run.

2. The script to clean the KFF Medicaid expansion data, [Medicaid.R](data-code/Medicaid.R). This assumes that you've already downloaded the KFF .csv file at [KFF Medicaid Expansion](https://www.kff.org/medicaid/issue-brief/status-of-state-medicaid-expansion-decisions-interactive-map/).

