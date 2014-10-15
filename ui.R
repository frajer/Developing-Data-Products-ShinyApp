
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Predicting Miles Per Gallon"),
        sidebarPanel(selectInput("select", label = h3("Select car"), choices = NULL, selected = 1)
        ),
        mainPanel(
            HTML('<h3>Tech specs for'),
            textOutput("inputValue", inline=TRUE),
            HTML('</h3>'),
            dataTableOutput('outputTable'),
            HTML('<h5>MPG value for'),
            textOutput("inputValue1", inline=TRUE),
            HTML('is</h5>'),
            verbatimTextOutput("outputValue"),
            h5('and predicted value of MPG value based on the  model'),
            HTML('<br><center><img src="model.png" width="500"></center><br>'),
            h5('is'),
            verbatimTextOutput("outputMPG"),
            HTML('<br><hr><b>Help:</b><br>Select the car from mtcars database in the select box on the left. Above will be shown the tech specs for the selected car and the actual and predicted value of Miles Per Gallon for selected car. The model for predicting the MPG value is based on my work for "Regression Models" course project.')   
        )
    )
)