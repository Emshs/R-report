library("ggplot2")
library("ggmap")
seoul_map <- get_map("Seoul", zoom = 11, maptype = "roadmap")
ggmap(seoul_map)

bus_stops <- read.csv("busstop.csv")
head(bus_stops)
seoul_plot <- ggmap(seoul_map) +
  geom_point(data = bus_stops, aes(x=longitutde, y =latitude, size = 버정수), color = "green", alpha = 0.7) +
  scale_size(range = c(1,10))+
  labs(title = "서울 구별 버스 정류장 수") +
  
  theme_void()

print(seoul_plot)