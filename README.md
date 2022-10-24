# Prediction of Telco Customer Churn
In this project, we'll developed web application predictive models to prediction probability of customer churn 
by using using detailed account information of those customers.


https://newchakri.shinyapps.io/Prediction-of-Telco-Customer-Churn
 
![image](https://user-images.githubusercontent.com/99199609/197405080-d3194453-90dd-4c27-a2fb-f80298868618.png)

# Data

The data set includes information about :

- Customers who left within the last month – the column is called Churn.
- Services that each customer has signed up for – phone, multiple lines, internet, online security, online backup, device protection, tech support, and streaming TV and movies.
- Customer account information – how long they’ve been a customer, contract, payment method, paperless billing, monthly charges, and total charges.
- Demographic info about customers – gender, age range, and if they have partners and dependents.

Source data : https://www.kaggle.com/datasets/blastchar/telco-customer-churn

# Implementations

Exploratory Data Analysis :
- Visualization
- Statistical analysis

Preprocess :
- Repeated k-fold cross validation
- Synthetic Minority Oversampling Technique

Feature Selection :
- Chi-square test
- T-test
- Correlation

Algorithm :
- Random forest
- K-Nearest Neighbors
- Logistic regression
- Naive Bayes
- Support Vector Machine

Evaluation :
- The Area Under the Curve

Deployment :
- Shiny

The best model of telco customer churn prediction is Logistic Regression with the Area Under the Curve is 77.5 %
