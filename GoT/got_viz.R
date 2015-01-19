#data source: https://bretterblog.wordpress.com/2014/04/25/data-feature-game-of-thrones-edition/
load('//home//russell//Documents//R_graphics//GoT//gotdf.RData')
head(gotdf)

library(ggplot2)

main_families <- c('Lannister', 'Stark', 'Baelish', 'Baratheon', 'Targaryen')

gotdf['main_families'] = ifelse((gotdf[,'family'] %in% main_families), 
                                gotdf[(gotdf[,'family'] %in% main_families), 'family'], 
                                ifelse((gotdf[, 'name'] == 'Jon Snow'), 
                                       'Jon Snow', 'Other'))

screentime <- ggplot(gotdf, aes(x=episode_count, y=screentime_seconds, color=name)) + 
  geom_point(shape=1) + 
  theme(legend.position = 'none') + 
  labs(title = 'Total Screentime in Seconds for Game of Thrones Characters, Seasons 1 - 3', 
       x = 'Number of episodes a character appears', 
       y = 'Total amount of screentime (seconds)')
  
library(plotly)
py <- plotly()
r <- py$ggplotly(screentime)
