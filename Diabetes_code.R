library(lars)#load the package "lars"
library(glmnet)#load the package "glmnet"
attach(diabetes)#attach dataset "diabetes"
View(diabetes)#show dataset "diabetes"


summary(x)#Check how many variables are in x
par(mfrow = c(2, 5))#There are 10 parameters in x, so 10 pictures need to be generated. 
#Generate a combination chart with two rows and five columns.
for(i in 1:10)#use for loop to generate 1 to 10 graphs
  {plot(x[,i], y)
  abline(lm(y~x[,i]))}#generate lines for each plot to show the relationship between x and y


#applying OLS linear regression
reg_OLS <- lm(y~x)#Name the regression with y as the dependent variable and x as the variable
summary(reg_OLS)#summarize "reg_OLS",and use this parameter as a benchmark for comparison

#Define the function and use lasso regression
reg_lasso <- glmnet(x,y)
plot(reg_lasso, xvar = "norm", label = TRUE)
#Generate a variable coefficient path, and display the relationship between the coefficient value and the L1 norm
#When label = T, the label of the variable can be displayed for easy observation

#Function to define the cross-validation curve
cv_fit <- cv.glmnet(x,y, alpha = 1, nlambda = 1000) 
plot(cv_fit)   #Obtain the cross-validation curve, will indicate the variables to be included and select the coefficients from the best model

#find the minimum value of lambda
cv_fit$lambda.min

# Fit the lasso regression by using the minimum value of lambda and save it as "fit"
fit <- glmnet(x, y, alpha = 1, lambda=cv_fit$lambda.min)
fit$beta #output the beta matrix to see which variables have been set to zero

cv_fit$lambda.1se#this value is a standard error distance of the smallest lambda
fit <- glmnet(x, y, alpha = 1, lambda=cv_fit$lambda.1se)#adjust the Lasso regression with the 1se lambda value
fit$beta#output the beta matrix to see which variables have been set to zero


#applying OLS linear regression for x2
reg_OLS2 <- lm(y ~ x2)#Name the regression with y as the dependent variable and x2 as the variable
summary(reg_OLS2)#summarize "reg_OLS"


#applying OLS linear regression for x2
reg_lasso2 <- glmnet(x2, y)#do a Lasso regression for y on x2
plot(reg_lasso2, xvar = "norm", label = TRUE)
# Generate a cross-validation curve, and display the relationship between the coefficient value and the L1 norm, and mark each line


#do the cross-validation curve for x2 and y; select 1000 values of the lambda 
cv_fit2 <- cv.glmnet(x=x2, y=y, alpha = 1, nlambda = 1000)
plot(cv_fit2)#generate the cross-validation curve

cv_fit2$lambda.min #find the minimum value of lambda

fit2 <- glmnet(x=x2, y=y, alpha = 1, lambda=cv_fit2$lambda.min)
#using the optimal value of lambda(lambda.min) to do the lasso regression for x2 and y
fit2$beta#output the beta matrix to see which variables have been set to zero


