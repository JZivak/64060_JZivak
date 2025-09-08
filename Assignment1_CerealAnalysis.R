library(readxl)
cereals <- read_excel("C:/Users/jovan/Downloads/Cereals.xlsx")
View(Cereals)

#minimum calories for a cereal brand
min_cal <- cereals[which.min(cereals$calories), c("name", "calories")]

#maximum calories for a cereal brand
max_cal <- cereals[which.max(cereals$calories), c("name", "calories")]

#average calories of all cereal brands
avg_cal <- mean(cereals$calories, na.rm = TRUE)

#median calories of all cereal brands
med_cal <- median(cereals$calories)

#choosing 5 out of like, 80 cereal brands
selected_cereals <- cereals[cereals$name %in% c("100%_Bran", "Apple_Jacks", "Cheerios", "Cinnamon_Toast_Crunch", "Cocoa_Puffs"), ]

#plotting calories of selected cereal brands
barplot(selected_cereals$calories,
       names.arg = selected_cereals$name,
       las = 2,           # rotate labels
       col = "red",
       main = "Calories of Selected Cereal Brands",
       ylab = "Calories")

#transform variable: calories to calories per cup
cereals$calories_per_cup <- cereals$calories / cereals$cups

#scatterplot of calories per cup vs sugar
plot(cereals$sugars, cereals$calories_per_cup,
     xlab = "Sugars (g)",
     ylab = "Calories per Cup",
     main = "Scatterplot of Calories per Cup vs Sugars",
     pch = 19,       # solid circles
     col = "blue")   # color of points

#print data for easy viewing
print(max_cal)
print(min_cal)
print(avg_cal)
print(med_cal)