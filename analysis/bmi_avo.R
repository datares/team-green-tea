#GOAL: Stacked bar graphs of BMIs with avocado consumption overlay
library("data.table")
library("ggplot2")
library("rvest")
library("dplyr")
library("tidyr")

#read in avocado data
avo <- fread("avo_combined.csv", select = c(2,6))
regions <- c("California", "West", "Plains", "South Central", "Great Lakes",
             "Northeast", "Midsouth", "Southeast")

#extract rows corresponding to regions
avo <- avo[avo$Region %in% regions,]
avo <- avo[order(avo$Region),]

#take average of all avocado consumption per region
avg_region <- tapply(avo$`Total Volume`, avo$Region, mean, na.rm = TRUE)
avg_region <- data.frame("Region" = names(avg_region), "Average Volume" = avg_region)
avg_region <- setorder(avg_region, Average.Volume)

#read in state population data
state_pop <- fread("2019_State_Population.csv", select = c(1,2))
state_pop <- na.omit(state_pop)

#per-capita avo volume
avg_region$Average.Volume <- avg_region$Average.Volume/state_pop$Population

#read in BMI data
BMI <- fread("bmi_region.csv", data.table = FALSE)
BMI <- pivot_longer(BMI, cols = 2:5)
colnames(BMI)[2] <- 'BMI Level'
BMInonUS <- BMI[BMI$Region != "Total U.S.", ]

#adjust category names
BMInonUS$`BMI Level`[BMInonUS$`BMI Level` == "PctNormal"] <- 'Normal'
BMInonUS$`BMI Level`[BMInonUS$`BMI Level` == "PctObese"] <- 'Obese'
BMInonUS$`BMI Level`[BMInonUS$`BMI Level` == "PctOver"] <- 'Overweight'
BMInonUS$`BMI Level`[BMInonUS$`BMI Level` == "PctUnder"] <- 'Underweight'

#manually read in median income in each state and take average
Plains <- mean(c(59533, 64577, 62087, 63229, 74593, 57603, 57409))
West <- 65908.3
California <- 80440
SouthCentral <- mean(c(64034, 54449, 48952, 51073 ))
Northeast <- mean(c(58924, 77933, 63001, 72108, 85843, 71169, 78833, 63463, 85751))
Midsouth <- mean(c(70176, 86738, 76456, 48850, 92266, 52295, 56071, 57341))
Southeast <- mean(c(56227, 61980, 59227, 51734, 45792))
GreatLakes <- mean(c(64168, 69187, 59584, 57603, 58642))

income_order <- as.data.frame(
  cbind(avg_region$Region, 
        c(Plains, Midsouth, GreatLakes, Southeast,
          Northeast, California, SouthCentral, West)))

income_order <- income_order[order(income_order$V2),]

#order by increasing income 
BMInonUS$Region <- factor(BMInonUS$Region, levels = unique(income_order$V1), ordered = TRUE)

p <- with(BMI, {
  ggplot() + geom_bar(aes(y = value, x = Region, fill = `BMI Level`), data = BMInonUS, stat = "identity") +   
    theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +
    scale_fill_manual(values = c("#8FD17F", "#4B9750", "#195B19", "#698474")) +
    geom_line(data = avg_region, aes(y = Average.Volume*1e3, x = Region, group = 1), color ="white") +
    geom_point(data = avg_region, aes(x = Region, y = Average.Volume*1e3), color = "white") +
    scale_y_continuous(sec.axis = sec_axis(~.*1, name = "Average Avocado Consumption per capita (1e-3)")) +
    ggtitle("BMI vs. Avocado Consumption by Increasing Median Income") + xlab("Regions") + ylab("Percentages")
  })
p 



