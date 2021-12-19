# MechaCar_Statistical_Analysis
# Statistical Analysis of Car Data using R
## Linear Regression to Predict MPG
The first step in the analysis is to load the data into an R data frame using 
the dplyr library and csv.read() function.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable1_datahead.png)


The summary statistics of the regression model show us that the design variables 
that provide a non-random amount of variance to the mpg values are vehicle_length
and ground_clearance as seen by the low Pr(<|t|) values.  


![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable1_summarystats.png)

The mpg multiple regression model thus can be represented by:
mpg = 6.08 * vehicle_length + 3.57 * ground_clearance - 91.6

where the slopes are positive for both vehicle_legnth and ground_clearance.

The adjusted R-squared value indicates that 66% of the variability in mpg is represented by the model which is reasonable.

## Suspension Coil Spring Analysis
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. It is desired to check the current manufacturing data to see if this design specification for all manufacturing lots in total and each lot individually are met.

Data from the manufacturing of suspension coil springs was compiled into the Suspension_Coil.csv.  This file was read into R using the csv.read() function and head() displays the following.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable2_datahead.png)

With R the spring PSI data was extracted and piped into the statistical summarize function to yield the following total summary statistics.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable2_total_summary.png)

To get a further understanding of the statistics by the three different lots made a groupby was added to yield.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable2_lot_summary.png)

The total summary statistics shows that the coil springs have a variance less than the required 100 psi^2.  However, 
the lot summary indicates that lot 3 has a variance greater than 100 psi^2. The variance measures how far the data set is spread out and is calculated as the average of the squared differences from the mean.  From plotting the distribution for each lot this is also observed.  Currently the manufacturing data meets the desired variance as a whole, but if lot 3 is coming from a particular machine and the volume is shifted coil springs could then shift as a whole to not be meeting specifications.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable2_densityplot.png)


## T-Tests on Suspension Coils
It is desired to perform t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

Using the t.test function in R with a population mean of 1500 we can see from the image below that only lot 3 is statistically different with a p-value less than 0.05 while the overall and lots 1 and 2 pass the t-test.

![alt text](https://github.com/jj2773/MechaCar_Statistical_Analysis/blob/main/deliverable3_ttest_summary.png)


