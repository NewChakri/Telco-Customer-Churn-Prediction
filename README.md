# Prediction of Telco Customer Churn

The Prediction of Telco Customer Churn project focuses on developing a web application using R Studio and deploying it with R Shiny. It's dedicated to predicting customer churn probability based on detailed account data using classification machine learning algorithms and statistical analysis.

Web App : https://newchakri.shinyapps.io/Customer-Churn-Prediction 

![image](https://github.com/NewChakri/Telco-Customer-Churn-Prediction/assets/99199609/c146e4d9-799f-4b31-93fa-eff51c56ef25)


- SeniorCitizen : Whether the customer is a senior citizen or not (1, 0)
- Partner : Whether the customer has a partner or not (Yes, No)
- Dependents : Whether the customer has dependents or not (Yes, No)
- tenure : Number of months the customer has stayed with the company
- MultipleLines : Whether the customer has multiple lines or not (Yes, No, No phone service)
- InternetService : Customer’s internet service provider (DSL, Fiber optic, No)
- OnlineSecurity : Whether the customer has online security or not (Yes, No, No internet service)
- OnlineBackup : Whether the customer has online backup or not (Yes, No, No internet service)
- DeviceProtection : Whether the customer has device protection or not (Yes, No, No internet service)
- TechSupport : Whether the customer has tech support or not (Yes, No, No internet service)
- StreamingTV : Whether the customer has streaming TV or not (Yes, No, No internet service)
- StreamingMovies : Whether the customer has streaming movies or not (Yes, No, No internet service)
- Contract : The contract term of the customer (Month-to-month, One year, Two year)
- PaperlessBilling : Whether the customer has paperless billing or not (Yes, No)
- PaymentMethod : The customer’s payment method (Electronic check, Mailed check, Bank transfer (automatic), Credit card (automatic))
- MonthlyCharges : The amount charged to the customer monthly

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
