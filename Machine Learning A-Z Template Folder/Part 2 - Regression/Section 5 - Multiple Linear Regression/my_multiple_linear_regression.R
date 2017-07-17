# Importing the dataset
dataset = read.csv('50_startups.csv')

# Handling categorical data
dataset$State = factor(dataset$State,
                                 levels = c('New York', 'California', 'Florida'),
                                 labels = c(1, 2, 3))

# Splitting the training and test sets
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)

# Fitting Multiple Linear Regression to the training set
regressor = lm(formula = Profit ~ ., data = training_set)
summary(regressor)

# Predicting the test set results
pred = predict(regressor, newdata = test_set)
pred
test_set[,5]
