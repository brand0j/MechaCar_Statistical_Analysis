# MechaCar_Statistical_Analysis

## Description
Our objective is to us R's tidyverse package to analyze MechaCar data in hopes that our analytical review may help provide some insight. The goal is to:
- Determine which variables can help predict the mpg for vehicle prototypes
- Perform t-tests regarding the PSI of suspension coils
- Investigate whether certain manufacturing lots are statistically different from one another
- Propose further research for the future to determine our performance against other vehicles

## Results

### Linear Regression to Predict MPG

![linear_regression](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/linear_regression.PNG)

Looking at the output we can see two variables which seem to have a non-random amount of variance to the mpg values of our dataset. These variables are **Vehicle_Length** & **Ground_Clearance** with respective p-values of 2.60e-12 and 5.21e-08. Another thing to note is that our (Intercept) is also significant. This means that there are likely other factors contributing to the effect on mpg that are not contained within our current dataset. The slope of our linear model cannot be considered zero when considering our p-value is 5.35e-11 (meaning that we must reject the null hypothesis). There is a relationship between our variables and mpg that can't be attributed to random chance. When it comes to the predictibility of our model with the dataset at our disposal, it isn't terrible, but leaves much to be desired. The Multiple R-squared value: 0.7149 (roughly 71.5% accurate) shows that the model is relatively accurate, but that for a truly predictive model we should continue tweaking our analysis to find the most determining factors on mpg. 

### Summary Statistics on Suspension Coils

The following code was used to obtain our analysis on the entire population dataset using ```summarize()``` in R and then similarly using ```group_by``` when comparing Manufacturing Lots:

```total_summary <- suspension_coil_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))```

```lot_summary <- suspension_coil_df %>% group_by(Manufacturing_Lot) %>% summarize(...)```

![total_summarry](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/total_summarry.PNG)

![lot_summary](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/lot_summary.PNG)

While our total summary is statistically sound, when looking at each of the respective manufacturing lots you can see drastic issues with Lot 3. The variance & standard deviation are well above an acceptable threshold compared to the overall population (variance is ~170.3). We can attribute whatever statistical variability in our population dataset to the erratic data from Lot 3. 

### T-Tests on Suspension Coils

Population T-Test:

![total_population_t_test](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/total_population_t_test.PNG)

Lot 1, 2 & 3 T-Test:

![lot1_t_test](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/lot1_t_test.PNG)
![lot2_t_test](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/lot2_t_test.PNG)
![lot3_t_test](https://github.com/brand0j/MechaCar_Statistical_Analysis/blob/main/Resources/lot3_t_test.PNG)

We can see the results for the T-test for suspension coils across all manufacturing lots shows that they are not drastically different from the population mean (the p-value is not low enough to reject the null hypothesis. As expected from our analyis above with summary statistics for suspension coils, our t-tests for Lot 1 & Lot 2 are not statistically different from tthe population mean and our p-values are not low enough to reject the null hypothesis. When looking at our Lot 3 t-test results we can see that it is slightly off from our population mean (our confidence interval doesn't contain our population mu value meaning it is skewed). Our p-value is low enough to reject the null hypothesis. Lot 3 seems to be our biggest source of statistical variance and should be looked into further what the cause might be.

## Study Design: Mechacar vs Competition

Out of all the factors that consumers take into consideration, some of the most important ones are cost to the consumer, carrying capicity (towing), horsepower, fuel efficiency, etc. If we can cut overhead costs with our developmen/production cycle we can offer an option that is comparible price wise while hopefully excelling in one or more of these categories. The way we could test this would be to assume our null hypothesis is that our vehicle performs on par with industry averages in these categories, while the alternative hypothesis would be that our vehicle performs well above in one or more of these metrics. After comparing data from our vehicles to samples from other manufacturers within the industry we can find where we begin to outpace the competition. For example: if our product excels in carrying capacity and fuel efficiency we immediately have a competitive advantage when it comes to other comparable SUV's and possibly trucks. Across all metrics it would still be beneficial to cut overhead costs to drive the cost to the consumer as low as it can possibly be so it is viewed as an accessible option for everyone. 


