#question 3 “nitrogen oxides as nitrogen dioxide” 
library(tidyverse)
library(lubridate)


nitrogen_oxide_values <- subset_data$`Nitrogen oxides as nitrogen dioxide`


subset_data_nitrogen_oxide <- data.frame(Date = subset_data$Date,Time = subset_data$time ,`Nitrogen oxides as nitrogen dioxide` = nitrogen_oxide_values )


view(subset_data_nitrogen_oxide)


library(plotly)
q3 <- plot_ly(subset_data_nitrogen_oxide , x = ~Time, y = ~Nitrogen.oxides.as.nitrogen.dioxide, type = 'scatter', mode = 'markers',text = ~Date, color = ~Nitrogen.oxides.as.nitrogen.dioxide, colors = 'Reds',
               marker = list(size = ~Nitrogen.oxides.as.nitrogen.dioxide, opacity = 0.5))
q3 <- q3 %>% layout(title = 'nitrogen oxides as nitrogen dioxide')
q3
