library(dplyr)

####################################################
## Deliverable 1 MechaCar MPG Analysis
####################################################

# The MechaCar_mpg.csv dataset contains mpg test results for 50 prototype 
# MechaCars. 

# Multiple factors such as vehicle length, vehicle weight, spoiler angle, 
# drivetrain, and ground clearance, were noted for each vehicle.

# Using R, design a linear model that predicts the mpg 
# of MechaCar prototypes using several variables from the MechaCar_mpg.csv file. 

# first import csv file for car data
MechaCar_df <- read.csv('MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

# examine the data
head(MechaCar_df)

#output for ref
#vehicle_length vehicle_weight spoiler_angle ground_clearance AWD      mpg
#1       14.69710       6407.946      48.78998         14.64098   1 49.04918
#2       12.53421       5182.081      90.00000         14.36668   1 36.76606
#3       20.00000       8337.981      78.63232         12.25371   0 80.00000
#4       13.42849       9419.671      55.93903         12.98936   1 18.94149
#5       15.44998       3772.667      26.12816         15.10396   1 63.82457
#6       14.45357       7286.595      30.58568         13.10695   0 48.54268

# setup the multiple linear regression model
lm(mpg ~ vehicle_length + 
     vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)

# get summary stats of model

summary(lm(mpg ~ vehicle_length + 
     vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df))

#output for reference...
#Coefficients:
#                   Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
#vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
#vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
#spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
#ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
#AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
#Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
#Residual standard error: 8.774 on 44 degrees of freedom
#Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
#F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

# p values in the summary stats indicate only y intercept, vehicle_length 
# and ground_clearance are statistically significant for our model

#update the model with only those parameters
# multiple linear regression model updated
model <- lm(mpg ~ vehicle_length + ground_clearance,data=MechaCar_df)

# get summary stats of updated model
summary(lm(mpg ~ vehicle_length + ground_clearance,data=MechaCar_df))

# get y intercept
yval <- model$coefficients['(Intercept)']

#returns -91.6

# get slope coefficients
slope_veh_len <- model$coefficients['vehicle_length']
# returns 6.08
slope_grd_clear <- model$coefficients['ground_clearance']
# returns 3.57

# multiple linear regression model formula becomes
# mpg=-91.6+6.08*vehicle_length+3.57*ground_clearance

####################################################
## Deliverable 2 Suspension Coil Analysis
####################################################
# first import csv file for the suspension coils
coils_df <- read.csv('Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

# examine the data
head(coils_df)

total_summary <- coils_df %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),
            Variance=var(PSI),SD=sd(PSI),.groups='keep')

lot_summary <- coils_df %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),
            Variance=var(PSI),SD=sd(PSI),.groups='keep')

library(tidyverse)

#check data to see distribution overall
ggplot(coils_df,aes(PSI,color=Manufacturing_Lot))+geom_density()


# create a scatter plot of the data just for fun
plot.new()
plt <- ggplot(coils_df,aes(x=Manufacturing_Lot,y=PSI))
plt+geom_boxplot()
geom_point()

####################################################
## Deliverable 3  T-Tests on Suspension Coils
####################################################
# 
t.test(coils_df$PSI,mu=1500) #t test the entire dataset

lot1_df <- coils_df[coils_df$Manufacturing_Lot=='Lot1',]
lot2_df <- coils_df[coils_df$Manufacturing_Lot=='Lot2',]
lot3_df <- coils_df[coils_df$Manufacturing_Lot=='Lot3',]

t.test(lot1_df$PSI,mu=1500) #t test the lot 1
t.test(lot2_df$PSI,mu=1500) #t test the lot 2
t.test(lot3_df$PSI,mu=1500) #t test the lot 3
