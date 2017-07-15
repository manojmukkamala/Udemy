# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into training set and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)

# Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicting the test set results
pred = predict(regressor, newdata = test_set)

# Visualising the training set results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Salary vs YearsExperience (Training Set)')+
  xlab('Years Experience')+
  ylab('Salary')

# Visualising the test set results
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            colour = 'blue') +
  ggtitle('Salary vs YearsExperience (Test Set)')+
  xlab('Years Experience')+
  ylab('Salary')
