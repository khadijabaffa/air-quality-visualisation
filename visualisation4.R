#question4 # monthly averages for each month for 2020.
library(tidyverse)
library(dplyr)


#filter dates
data_2020 <- filter(cw_dataset,Date >= "2020-01-01" & Date <= "2020-12-31")
view(data_2020)
# Check for null values
nulls <- colSums(is.na(data_2020))

# Print the number of null values in each column
print(nulls)

#filter
data_2020_filtered <- data_2020 %>% 
  filter(!is.na(PM10) & !is.na('Nitric oxide') & !is.na('Nitrogen oxides as nitrogen dioxide') ) 
#check for null values again
null_values<- colSums(is.na(data_2020_filtered))
view(null_values)

# find the monthly averages by calculating the mean of each month 
monthly_data <- data_2020_filtered %>% 
  group_by(month(Date)) %>% 
  summarise(avg_PM10 = mean(PM10, na.rm = TRUE),
            avg_Nitric_oxide = mean(`Nitric oxide`, na.rm = TRUE),
            avg_Nitrogen_oxides_as_nitrogen_dioxide = mean(`Nitrogen oxides as nitrogen dioxide`, na.rm = TRUE))
view(monthly_data)
#rm(monthly_data)
#rm(data)




monthly_average <- data.frame(
  month = c("January", "February","March","April","May","June","July","August","September","October","November","December"),
  avg_PM10 = c(20.71716, 22.60940, 20.33067, 28.00645, 20.30709, 16.64310, 12.14819, 15.00929, 15.29146, 13.15261, 19.03746, 15.67677),
  avg_Nitric_oxide = c(18.037172, 11.174024, 8.172796, 2.978218, 2.999534, 4.751876, 7.597893, 8.047526, 10.001087, 11.567390, 9.170258, 11.422680),
  avg_Nitrogen_oxides_as_nitrogen_dioxide = c(59.36659, 39.23083, 32.55536, 23.17428, 18.50343, 22.28231, 27.69652, 35.27375, 38.31526, 41.10404, 37.74967, 42.16146)

)
View(monthly_average)


figure <- plot_ly(monthly_average, x = ~month, y = ~avg_Nitrogen_oxides_as_nitrogen_dioxide, type = 'bar', name = 'Nitroges oxide as nitrogen dioxide')
figure <- figure %>% add_trace(y = ~ avg_PM10, name = 'PM10')
figure <- figure %>% add_trace(y = ~avg_Nitric_oxide, name = 'Nitric oxide')
figure <- figure %>% layout(yaxis = list(title = 'Concentrartion'), barmode = 'group')

figure







