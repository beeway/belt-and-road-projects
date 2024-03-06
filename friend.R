
getwd()
setwd("C:/Users/Lenovo/Desktop/BRS project ch4/brs project/data")

library(readxl)
friend=read_excel("friend.xlsx", sheet = "Sheet2")

library(giscoR) # maps
library(ggplot2)
library(sf) # spatial function
library(dplyr)  # rename 


world = gisco_get_countries(year=2020) 
ggplot(world) + geom_sf()

# Countries centroids for bubble map

world2= world %>% rename('id'='CNTR_ID')

# emerge data 
friend2 = world2 %>% left_join(friend, by = "id") 


# https://ggplot2tutor.com/scales/scale_fill_gradientn

# 
ggplot() + geom_sf(data = world, fill = "grey90") + ylim(-50, 90) +
  geom_sf(data = friend2, pch = 21, aes(fill = friend), col = "grey80") +
  scale_size(range = c(1, 9), guide = guide_legend( direction = "horizontal", nrow = 1, label.position = "bottom")) +
  scale_fill_gradientn(colors=cm.colors(10), n.breaks=10, labels = c("2014", "2015","2016","2017","2018","2019","2020","2021","2022","2023")) +
  guides(fill = guide_legend(title = "")) + labs(title = "", sub = "", caption = , size = "") +
  theme_void() + theme(legend.position = "bottom" )

ggplot() + geom_sf(data = world, fill = "grey90") + ylim(-50, 90) +
  geom_sf(data = friend2, pch = 21, aes(fill = friend), col = "grey80") +
  scale_size(range = c(1, 9), guide = guide_legend( direction = "horizontal", nrow = 1, label.position = "bottom")) +
  scale_fill_gradientn(colors=hcl.colors(10), n.breaks=10, labels = c("2014", "2015","2016","2017","2018","2019","2020","2021","2022","2023")) +
  guides(fill = guide_legend(title = "")) + labs(title = "", sub = "", caption = , size = "") +
  theme_void() + theme(legend.position=c(.05,.27))

c(.05,.3)



# https://tidyverse.github.io/ggplot2-docs/reference/scale_gradient.html
scale_color_gradientn(colors = topo.colors(10), alpha = 1)
terrain.colors(10)
topo.colors(10)
hcl.colors(10)
cm.colors(10)


