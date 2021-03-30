# Everything You Avo Wanted to Know About Avocados 🥑

Hailed in recent years as a trendy superfood, avocados have soared in popularity faster than you can say “holy guacamole!” They are as prized for their nutritious value as their delicious taste and versatility. Not to mention they come with possibly more health benefits than ways to prepare them! Loaded with a healthy monounsaturated fat called oleic acid—which has been shown to reduce inflammation, lower cholesterol, and protect against cancer—avocados are truly nature’s gift to humanity. 

Team Green Tea at UCLA DataRes dove deeper into the rich data behind avocado purchases in the Medium article ["Everything You Avo Wanted to Know About Avocados"](https://ucladatares.medium.com/everything-you-avo-wanted-to-know-about-avocados-510aa0450bb1). We sought to use data collected from the [Hass Avocado Board (HAB)](https://hassavocadoboard.com/) to explore and explain trends in avocado prices & consumption. We also attempted to draw links between avocado consumption and the health and demographics of a population by supplementing our analysis with data from the [U.S. Census Bureau](https://data.census.gov/cedsci/) and the [Kaiser Family Foundation (KFF)](https://www.kff.org/).  This repository contains all the code, analyses, and explanations for the visualizations and insights found in the above article.

Contributors: [Tara Jaigopal](https://github.com/tarajaigopal), [Aarushi Gupta](https://github.com/gupta-aarushi), [Emily Ng](https://github.com/heyyitsemyy), [Tiffany Feng](https://github.com/tfeng456), [Amy Tang](https://github.com/datares/team-green-tea)

# The Dataset

Before we could begin our analysis, we had to clean and collate our primary dataset, which was sourced from the Hass Avocado Board. Some of the key variables included in the dataset are:
* `Date` - the date of the observation
* `AveragePrice` - the average price of a single avocado
* `type` - conventional or organic
* `Region` - the city or region of the observation
* `Total Volume` - total number of avocados sold

We found a cleaned version of the dataset on [Kaggle](https://www.kaggle.com/neuromusic/avocado-prices); however, it only contained data from January 2015 through March 2018. Since we had more recent data through November 2020 on the HAB website, we combined the two datasets. This allowed us to draw insights about avocado prices and purchases over a larger time frame. 

A curious feature of the dataset was how different regions were grouped. While the dataset contained observations specific to certain U.S cities (e.g. Los Angeles, New York, Portland, etc.), it also provided data aggregated by regional divisions described below: 

* **California**
* **The West**, which includes Washington, Oregon, Idaho, Montana, Wyoming, Nevada, Utah, Colorado, Arizona, and New Mexico
* **The Plains**, which includes North Dakota, South Dakota, Nebraska, Kansas, Minnesota, Iowa, and Missouri
* **The Great Lakes**, which includes Wisconsin, Illinois, Michigan, Indiana, and Ohio
* **The South Central**, which includes Texas, Oklahoma, Arkansas, and Louisiana
* **The Southeast**, which includes Mississippi, Alabama, Georgia, Florida, and South Carolina
* **The Midsouth**, which includes Tennessee, Kentucky, North Carolina, Virginia, West Virginia, Delaware, Maryland, and Washington D.C., and finally 
* **The Northeast**, which includes Maine, New Hampshire, Vermont, Massachusetts, Rhode Island, Connecticut, New York, Pennsylvania, and New Jersey 

These divisions are presumably due to similarities in demographics and access to avocados. 

# Data Cleaning

Since the data sourced from the Census Bureau and Kaiser Family Foundation provided figures related to health and demographics for each U.S. state, rather than for each region, we transformed the data by using population-weighted aggregation to arrive at figures for each region. This enabled us to draw links between avocado consumption and the health and demographics of the population of each region. 

# Data Analysis and Code

Our data analysis and corresponding code can be found in our [analysis](https://github.com/datares/team-green-tea/tree/main/analysis) folder. While we were able to choose any language or platform for our analysis, we mainly utilized R and Tableau to clean our data and create our visualizations. Hence, our analyses include both R code and Markdown files and Tableau notebooks and scripts. For R, some of the specific packages we used include `tidyverse`, `ggplot2`, `rvest`, and `plot.ly` — to create interactive visualizations! 

## Research Questions 

### What are recent trends in avocado prices and consumption? 

First, to find out when and where we could get the best deals on avocados, we created an [interactive Tableau dashboard](http://tabsoft.co/3kwZmsD) that charted the price fluctuations from 2015 to 2020 across the US regions previously listed. We noticed that, on average, the South Central region seems to be the chepeast, while the Northeast and California seem to be the most expensive regions to buy avocados. Avocado prices also seemed to have risen sharply across the nation in 2017 but fell again and stabilized at a lower price by 2018, with overall prices consistently at their lowest in February. We also wanted to investigate the monthly fluctuations in avocado prices across the years, and thus included a [time series chart](https://github.com/datares/team-green-tea/blob/main/visualizations/dashboard%20bottom%20half.png) in the dashboard. Finally, we attempted to predict avocado prices in 2021 by using Tableau’s forecast feature — the visualization can be found [here](http://tabsoft.co/2OVZIND).

### Do these trends differ based on the type of avocado? 

Furthermore, we wanted to investigate if these trends differed based on the type of avocado: conventional or organic. We created donut charts to depict the total proportion of both types of avocado purchased between 2015 and 2020 in each region, and we discovered that the volume of conventional avocados purchased is far greater than that of organic avocados. To figure out why this was the case, we made a [line graph](https://chart-studio.plotly.com/~tarajaigopal/11.embed) that tracks the average unit price of organic and conventional avocados over the same time period. As expected, organic avocados are more expensive than conventional avocados — due to higher farming and distribution costs — which made conventional avocados the more appealing option to consumers in all regions. Regardless, organic avocados are still hugely popular and rapidly increasing in popularity as evidenced by this [bar chart](https://chart-studio.plotly.com/~tarajaigopal/13.embed).

### How do avocado prices affect volume? 

To further explore the link between avocado prices and consumer behavior, we created a [lollipop chart](https://chart-studio.plotly.com/~tarajaigopal/7.embed) using plot.ly in R. We noticed that while the volume of avocados purchased increased across all regions, only California and the West saw an increase in price — all other regions saw a reduction. We infer that this increase in price was probably why California and the West saw a relatively reduced jump in the volume of avocados purchased. Most interestingly, the region with the greatest increase in the volume of avocados purchased between 2015 and 2020 was the Southeast and the smallest was California - where avocados are almost as ubiquitous as palm trees.  

### Does avocado consumption correlate with overall health? 

We sought to uncover if increased avocado consumption correlates with a healthier population. We created a bar graph describing the distribution of the population of different regions based on BMI (body mass index) level and ordered it by income, and then overlaid a line graph depicting the average avocado consumption of that region. The visualization can be found [here](https://github.com/datares/team-green-tea/blob/main/visualizations/BMI%20vs%20Avo.png). We found little to no correlation between avocado consumption and health. While the Plains and Midsouth purchased comparatively fewer avocados, their BMI levels did not substantially differ from those of the South Central, California, and West, where avocado purchases were much higher.

### What are the links between avocado consumption and demographic data (age, wealth, etc.)? 

Finally, we wanted to verify the myth that increased avocado consumption correlates with younger populations (specifically millennials). We created this [scatterplot](https://chart-studio.plotly.com/~tarajaigopal/15.embed), which shows the per capita consumption of avocados in various cities across the US and residents’ median age in those cities. Clearly, there is no relationship between age and avocado consumption and avocados are not just a millennial fad! 
