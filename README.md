# Everything You Avo Wanted to Know About Avocados 🥑

Hailed in recent years as a trendy superfood, avocados have soared in popularity faster than you can say “holy guacamole!” They are as prized for their nutritious value as their delicious taste and versatility. Not to mention they come with possibly more health benefits than ways to prepare them! Loaded with a healthy monounsaturated fat called oleic acid—which has been shown to reduce inflammation, lower cholesterol, and protect against cancer—avocados are truly nature’s gift to humanity. 

Team Green Tea at UCLA DataRes dove deeper into the rich data behind avocado purchases in the article "Everything You Avo Wanted to Know About Avocados". We sought to use data collected from the [Hass Avocado Board (HAB)](https://hassavocadoboard.com/) to explore and explain trends in avocado prices & consumption. We also attempted to draw links between avocado consumption and the health and demographics of a population by supplementing our analysis with data from the [U.S. Census Bureau](https://data.census.gov/cedsci/) and the [Kaiser Family Foundation (KFF)](https://www.kff.org/).  This repository contains all the code, analyses, and explanations for the visualizations and discoveries found in the aforementioned article.

Contributors: [Tara Jaigopal](https://github.com/tarajaigopal), [Aarushi Gupta](https://github.com/gupta-aarushi), [Emily Ng](https://github.com/heyyitsemyy), [Tiffany Feng](https://github.com/tfeng456), [Amy Tang](https://github.com/datares/team-green-tea).

# Data 

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

# Data Processing 

Since the data sourced from the Census Bureau and Kaiser Family Foundation provided figures related to health and demographics for each U.S. state, rather than for each region, we transformed the data by using population-weighted aggregation to arrive at figures for each region. This enabled us to draw links between avocado consumption and the health and demographics of the population of each region. 

# Analysis and Code

Our data analysis and corresponding code can be found in our analysis folder. While we were able to choose any language or platform for our analysis, we mainly utilized R and Tableau to clean our data and create our visualizations. Hence, our analyses include both R code and Markdown files and Tableau notebooks and scripts. For R, some of the specific packages we used include plot.ly — to create interactive visualizations! 

## Research Questions 

### What are recent trends in avocado prices and consumption? 
[here](https://github.com/datares/happy-pineapples/blob/main/visualization/PCARegion.png)

### How do avocado prices affect volume? 


### Does avocado consumption correlate with overall health? 

### What are the links between avocado consumption and demographic data such as age, socioeconomic status, etc.? 


