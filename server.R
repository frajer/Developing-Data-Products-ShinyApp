
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
techs <- function(car) mtcars[car,]
shinyServer(
    function(input, output,session) {
        updateSelectInput(session, "select", choices = rownames(mtcars))
        output$inputValue <- renderPrint({cat(input$select)})
        output$inputValue1 <- renderPrint({cat(input$select)})
        output$outputTable <- renderDataTable({techs(input$select)},options = list(paging = FALSE,
                                info=FALSE, ordering=FALSE, searching=FALSE))
        output$outputValue <-  renderPrint({techs(input$select)$mpg})
        output$outputMPG <-  renderPrint({round(9.618-3.917*techs(input$select)$wt+1.226*techs(input$select)$qsec+2.936*techs(input$select)$am,digits=2)})
    }
)