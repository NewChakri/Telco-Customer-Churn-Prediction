library(rlang)
library(themis)
library(ggplot2)
library(RCurl)
library(lattice)
library(vctrs)
library(glmnet)
library(caret)
library(shiny)
library(shinythemes)

####################################
# Create  model                    #
####################################
telco_df <- read.csv("https://raw.githubusercontent.com/NewChakri/Telco-Customer-Churn-Prediction/main/Data/Telco_Customer_Churn.csv")

telco_df <- as.data.frame(unclass(telco_df),stringsAsFactors=TRUE)
telco_df$SeniorCitizen = as.factor(telco_df$SeniorCitizen)
telco_df = na.omit(telco_df)


set.seed(99)
id <- sample(nrow(telco_df) , 0.8*nrow(telco_df))
train_df <- telco_df[id , ]
test_df <- telco_df[-id , ]


control <- trainControl(method="repeatedcv", number=10, repeats=3, sampling = "smote")
logistic_model <- train(Churn ~ SeniorCitizen + Partner + Dependents + tenure  + 
                          MultipleLines + InternetService + OnlineSecurity + 
                          OnlineBackup + DeviceProtection + TechSupport + 
                          StreamingTV + StreamingMovies +
                          Contract + PaperlessBilling + PaymentMethod + MonthlyCharges, 
                        data=train_df, 
                        method='glmnet', 
                        preProcess = c("center", "scale"),  
                        trControl=control)

####################################
# User interface                   #
####################################
ui <- fluidPage(theme = shinytheme("superhero"),
                headerPanel('Customer Churn Prediction'),
                sidebarPanel(
                  HTML("<h3>Input parameters</h3>"),
                 fluidRow
                 (column(width = 3,
                  selectInput("SeniorCitizen", "SeniorCitizen", 
                             choices = list("0" = "0", "1" = "1") 
                              )),
                  column(width = 3,
                  selectInput("Partner", "Partner",
                              choices = list("No" = "No" , "Yes" = "Yes")
                              )),
                  column(width = 3,
                  selectInput("Dependents", "Dependents",
                              choices = list("No" = "No", "Yes" = "Yes")
                              )),
                  column(width = 3,
                  numericInput("tenure", "Tenure(months)",
                              value = 0 , min = 0
                              ))),
                  fluidRow
                  (column(width = 3,
                  selectInput("MultipleLines", "MultipleLines",
                              choices = list("No" = "No", "No phone service" = "No phone service", "Yes" = "Yes"),
                              )),
                  column(width = 3,
                  selectInput("InternetService", "InternetService",
                              choices = list("DSL" = "DSL", "Fiber optic" = "Fiber optic","No" = "No"),
                              )),
                  column(width = 3,
                  selectInput("OnlineSecurity", "OnlineSecurity",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              )), 
                  column(width = 3,
                  selectInput("OnlineBackup", "OnlineBackup",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              ))),
                  fluidRow
                  (column(width = 3,
                  selectInput("DeviceProtection", "DeviceProtection",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              )),
                  column(width = 3,
                  selectInput("TechSupport", "TechSupport",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              )),
                  column(width = 3,
                  selectInput("StreamingTV", "StreamingTV",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              )),
                  column(width = 3,
                  selectInput("StreamingMovies", "StreamingMovies",
                              choices = list("No" = "No", "No internet service" = "No internet service", "Yes" = "Yes"),
                              ))),
                  fluidRow
                  (column(width = 3,
                  selectInput("Contract", "Contract",
                              choices = list("Month-to-month" = "Month-to-month", "One year" = "One year", "Two year" = "Two year"),
                              )),
                  column(width = 3,
                  selectInput("PaperlessBilling", "PaperlessBilling",
                              choices = list("No" = "No", "Yes" = "Yes"),
                              )),
                  column(width = 3,
                  selectInput("PaymentMethod", "PaymentMethod",
                              choices = list("Bank transfer (automatic)" = "Bank transfer (automatic)", "Mailed check" = "Mailed check", "Credit card (automatic)" = "Credit card (automatic)", "Electronic check" = "Electronic check"),
                              )),
                   
                  column(width = 3,
                  numericInput("MonthlyCharges", "MonthlyCharges",
                              value = 0 , min = 0
                              ))),
                  
                  actionButton("submitbutton", "Submit", class = "btn btn-primary"),
                 width = 12),
                mainPanel(
                  tags$label(h3("Output")),
                  verbatimTextOutput("contents"),
                  width  = 12
                )
)

####################################
# Server                           #
####################################
server <- function(input, output) {
  datasetInput <- reactive({  
    input <- data.frame(SeniorCitizen = input$SeniorCitizen, 
                           Partner = input$Partner, 
                           Dependents = input$Dependents, 
                           tenure = input$tenure, 
                           MultipleLines = input$MultipleLines, 
                           InternetService = input$InternetService, 
                           OnlineSecurity = input$OnlineSecurity, 
                           OnlineBackup = input$OnlineBackup, 
                           DeviceProtection = input$DeviceProtection, 
                           TechSupport = input$TechSupport, 
                           StreamingTV = input$StreamingTV, 
                           StreamingMovies = input$StreamingMovies, 
                           Contract = input$Contract, 
                           PaperlessBilling = input$PaperlessBilling, 
                           PaymentMethod = input$PaymentMethod, 
                           MonthlyCharges = input$MonthlyCharges
                           )
    
    input$Contract <- factor(input$Contract , levels = c("Month-to-month" , "One year" , "Two year"))
    
    Output <- data.frame(Prediction=predict(logistic_model,input), round(predict(logistic_model,input,type="prob"), 3))
    print(Output)
    
  })
  
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate(datasetInput())
    } else {
      return("Server is ready for calculation.")
    }
  })
  

}

####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)

