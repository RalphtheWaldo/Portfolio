

install.packages("tidyverse")
library(tidyverse)
install.packages("janitor")
library(janitor)


#importing data sets and renaming for consistency 

library(readr)
stepsDay <- read_csv("~/Desktop/Google CaCert - BellaBeat/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv")

library(readr)
heartrateSeconds <- read_csv("~/Desktop/Google CaCert - BellaBeat/Fitabase Data 4.12.16-5.12.16/heartrate_seconds_merged.csv")

library(readr)
sleepDay <- read_csv("~/Desktop/Google CaCert - BellaBeat/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")

#Narrow form to be comparable with stepsDay
library(readr)
stepsMinute <- read_csv("~/Desktop/Google CaCert - BellaBeat/Fitabase Data 4.12.16-5.12.16/minuteStepsNarrow_merged.csv")

#CLEANING
#the following lines are eliminating duplicate or missing entries

stepsDay %>% 
  drop_na() %>% 
  distinct()

heartrateSeconds %>% 
  drop_na() %>% 
  distinct()

sleepDay %>%
  drop_na() %>% 
  distinct()

stepsMinute %>% 
  drop_na() %>% 
  distinct()

#removing entries recorded for zero steps in stepsMinute

stepsMinute <- filter(stepsMinute, Steps != 0)


#creating plots with the cleaned data

plot_sleepDay <- ggplot(data = sleepDay) + 
  geom_count(mapping = aes(x = Id/1000000000, y = TotalTimeInBed), show.legend = FALSE) + 
  xlim(1503960366/1000000000, 8877689391/1000000000) +
  labs(x ="Individuals", y = "Total Time in Bed", title = "Sleep Tracking") + 
  labs(caption = "This chart aims to visualize the general usage of tracking sleep patterns") 

plot_stepsDay <- ggplot(data = stepsDay) + 
  geom_count(mapping = aes(x = Id/1000000000, y = StepTotal), show.legend = FALSE) +
  xlim(1503960366/1000000000, 8877689391/1000000000) + 
  labs(x = "Individuals", y = "Total Steps", title = "Step Tracking") + 
  labs(caption = "This chart aims to visualize the gerneral usage of traking steps per day")

#heart rate data is ultimately inefficient to analyze since the tracking should 
#happen automatically and does not inherintly increase user interaction nor 
#is there an appropriate amount of room to advance technology without 
#considerable cost to the consumer.


