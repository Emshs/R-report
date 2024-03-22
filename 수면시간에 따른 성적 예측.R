library(dplyr)
library(caret)

data <- read.csv("student_data.csv")
data <- data %>% select(study_hours, sleep hours, grade)
data <- na.omit(data) #결측치가 있는 행 제거

#성적 0부터 100 사이로 정규화 
data$grade <- scale(data$grade, center = min(data$grade), scale = max(data$grade) - min(data$grade)) *100

#다중회귀분석 사용
model <- lm(grade ~ study_hours +sleep_hours, data = data)

study_hours <- readline(prompt = "공부 시간을 입력하세요: ")
sleep_hours <- readline(prompt = "수면 시간을 입력하세요: ")

input_data <- data.frame(study_hours = as.numeric(study_hours), sleep_hours = as.numeric(sleep_hours))
prediction <- predict(model, newdata = input_data)

prediction <- (prediction - min(data$grade)) / (max(data$grade)-min(data$grade)) * 100

prediction <- ifelse(prediction >100, 100, prediction)

cat("예측된 성적: ", round(prediction, 2))