# Google Data Analytics Capstone Project
# Cyclistic Bike Share Case Study
# Author : ARIJIT GHOSH
# Date : April 2023


# First Install Packages

install.packages("tidyverse")
install.packages("skimr")
install.packages("readx1")
install.packages("readr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("data.table")


# Load Libraries

library(tidyverse)
library(skimr)
library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(data.table)


# Now Importing Data Files

 jan_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 feb_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 mar_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 apr_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 may_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 jun_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 july_2022 <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 aug_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 sep_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 oct_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 nov_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 dec_2022  <- read_excel("E:/Dataset for case study-1/CSV/Workbook file")
 
 
 # Combining  data  files Into One Data Frame
 
 all_trips <- rbind(jan_2022, feb_2022, mar_2022, apr_2022, may_2022, jun_2022, july_2022, aug_2022, sep_2022, oct_2022, nov_2022, dec_2022)
 
 

 
  # Calculating ride length by end time - start time
 
   all_trips_v2 <- all_trips %>% 
     mutate(ride_length = difftime(ended_at, started_at, units = "mins"))
   

   
  # Checking for negative value of ride length (ride length < 0)
   
    
     nrow(subset(all_trips_v2,ride_length < 0))
     
  
     
     
  # drop ride length less than zero 
     
     all_trips_v3 <- all_trips_v2[!(all_trips_v2$ride_length < 0)]
     
     
  # Checking for All Test rides
     
     nrow(subset(all_trips_v3, start_station_name %like% "test"))
     nrow(subset(all_trips_v3, start_station_name %like% "Test"))
     nrow(subset(all_trips_v3, start_station_name %like% "TEST"))
  
     
  # Drop all test rides
     
     all_trips_v4 <- all_trips_v3[!((all_trips_v3&start_station_name %like% "Test"))]
     
     
  
  # Now final cleaned data is ready for analysis
     
  # Exporting as CSV file
     
     write.csv(all_trips_v4,'all_trips_v4.csv')
     
     
     
 