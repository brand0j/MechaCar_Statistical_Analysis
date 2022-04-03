library(dplyr) #initialize dplyr tidyverse
library(tidyverse)
#--------------------------------------------------------------------------

mechacar_df <- read.csv('Mechacar_mpg.csv',stringsAsFactors = F) #read in csv file

#generate multiple line linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=df)

#determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=df))

#from our ouput there are a few things worth noting concerning mpg
#vehicle_weight, spoiler_angle & AWD seem to have significant impact on mpg

#---------------------------------------------------------------------------


#get the mean, median, variance and standard deviation after reading in suspension coil csv
suspension_coil_df <- read.csv('Suspension_Coil.csv', stringsAsFactors = F) #import csv file into table
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#lot summary
lot_summary <- suspension_coil_df %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#---------------------------------------------------------------------------

#using t.test() on suspension_coil data
t.test((suspension_coil_df$PSI), mu=1500)
t.test(subset(suspension_coil_df, Manufacturing_Lot=='Lot1')$PSI,mu=1500)
t.test(subset(suspension_coil_df, Manufacturing_Lot=='Lot2')$PSI,mu=1500)
t.test(subset(suspension_coil_df, Manufacturing_Lot=='Lot3')$PSI,mu=1500)
