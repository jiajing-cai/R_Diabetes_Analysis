## R_Diabetes_Analysis
# Related Factors between Diabetes and Patients | R
 
### Summary:
This project used the glmnet package in R to implement LASSO regression on the data set "diabetes" to be a regularization. Analyze the generated pictures and conclusions to obtain the best λ value and obtain a more simplified model.
 
### Data Set: 
 For the data set, I use "diabetes" in the lars package, and load the glmnet package to implement LASSO regression. "Diabetes" contains 3 variables x, x2, y, where x is a 10-dimensional matrix and x2 is a 64-dimensional matrix obtained from x.
 
### Introduction: 
 This assignment needs to use the LASSO regression model. The idea is to reduce or regularize the coefficients to improve the prediction accuracy, reduce the variance, and improve the interpretability of the model. Perform the selection of variables in the "diabetes" data set through LASSO, and select and adjust the parameter lambda through cross-validation. As the lambda increases, shrinkage occurs, at this time the zero variable can be discarded and an optimized model can be obtained. The above is an explanation of the data, objectives, and methods of this assignment.
 
### Interpretation & Conclusions
The conclusion shows that there are a total of 15 factors affecting diabetic patients, and the magnitude of the correlation coefficient can reflect the degree of influence of each variable. Among them, BMI and LTG are the most serious variables affecting diabetes.
