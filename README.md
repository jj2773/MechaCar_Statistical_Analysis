# MechaCar_Statistical_Analysis
# Statistical Analysis of Car Data using R
## Linear Regression to Predict MPG
The first step in the analysis is to load the data into an R data frame using 
the dplyr library and csv.read.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable1_datahead.png)


The summary statistics of the regression model show us that the design variables 
that provide a non-random amount of variance to the mpg values are vehicle_length
and ground_clearance as seen by the low Pr(<|t|) values.  


![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable1_summarystats.png)

The mpg multiple regression model thus can be represented by:
mpg = 6.08 * vehicle_length + 3.57 * ground_clearance - 91.6

where the slopes are positive for both vehicle_legnth and ground_clearance.

The adjusted R-squared value indicates that 66% of the variability in mpg is represented by the model which is reasonable.