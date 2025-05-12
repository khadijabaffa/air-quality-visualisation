#question1

# Extracting the PM10 values from subset_data to a new table
pm10_values <- subset_data$PM10

# Create a new data frame with dates and PM10 values
subset_data_PM10 <- data.frame(Date = subset_data$Date, Time = subset_data$time, PM10 = pm10_values)
#view(subset_data_PM10)


#cleaning the table by removing the null values
subset_PM10 <- drop_na(subset_data_PM10, PM10)
#view(subset_PM10)


library(plotly)
library(ggplot2)

#creating a ggplot object
p <- ggplot(subset_PM10, aes(Time, PM10)) +
  geom_point(aes(colour = factor(Date)))

ggplotly(p)
