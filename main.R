library(tidyverse)
library(lubridate)
setwd("..") 
file_paths <- c(
  "iDAV CW Datasets/POAR_2018.csv",
  "iDAV CW Datasets/POAR_2019.csv",
  "iDAV CW Datasets/POAR_2020.csv",
  "iDAV CW Datasets/POAR_2021.csv",
  "iDAV CW Datasets/POAR_2022.csv",
  "iDAV CW Datasets/POAR_2023.csv"
)

# Read and merge all datasets
cw_dataset <- map_dfr(file_paths, read_csv)

# Remove the "dataset" column
cw_dataset$dataset <- NULL

# Convert the Date column to "dmy" format
cw_dataset$Date <- dmy(cw_dataset$Date)

#renaming
cw_dataset <- rename(cw_dataset, PM10 = `PM<sub>10</sub> particulate matter (Hourly measured)`)


# Filtering the dates from the dataset
subset_data <- filter(cw_dataset,
                      Date == "2018-12-20" |
                        Date == "2019-01-03" |
                        Date == "2020-03-19"|
                        Date == "2020-03-26" |
                        Date == "2020-06-29"|
                        Date == "2020-11-10"|
                        Date == "2020-12-20" |
                        Date == "2021-01-03"|
                        Date == "2021-11-29"|
                        Date == "2022-07-25" |
                        Date == "2023-07-24")


#View(subset_data)
View(cw_dataset)