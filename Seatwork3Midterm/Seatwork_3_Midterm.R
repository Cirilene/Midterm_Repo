data <- read.csv("C:/Users/RM A-225/Documents/Midterm_Repo/midetrmseatwork_data.csv")

#Task 1 using Function
# What is the value of <Wind> in the <82nd> row?

Task1 <- function(dataset,row_num,col_name){
  dataset[row_num,col_name]
  
}

Task1(data,82,"Wind")
#Task 2 using Function
#How many total missing values are in the <Wind Column> of this data frame?

Task2 <- function(dataset,col_name){
  table(is.na(dataset[,col_name]))
}
#Task 3 using Function
#What is the mean for the <20th> row - <70th> row in <Ozone column> in this dataset?
#Exclude missing values (coded as NA) from this calculation?

#Task3

Task3 <- function(dotosot=data,col_name,min_value=1,max_value=nrow(dotosot)){
  mean(na.omit(dotosot[min_value,col_name]),na.omit(dotosot[max_value,col_name]))
} 
Task3(data,"Ozone",20,70)
  

