#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    

    output$text <- renderText(9.62 - 3.92*input$weight + 1.23*input$qs + 
                                  2.94*as.numeric(input$am))
    mtcars1 <- mtcars
    mtcars1$am <- as.character(mtcars1$am)
    output$mpgWtPlot <- renderPlot(ggplot(data = mtcars1, aes(x = wt, y = mpg, color = am)) +
                        geom_point()  +             
                        geom_point(x = input$weight, y = 9.62 - 3.92*input$weight + 1.23*input$qs + 
                        2.94*as.numeric(input$am), shape = 21, size = 4, stroke = 2, fill= "blue", color ="red") +
                        geom_smooth(method = "lm") + xlab("Weight 1000 lbc") + ylab("Miles/(US) gallon"))
                            
    output$mpgQsecPlot <- renderPlot(ggplot(data = mtcars1, aes(x = qsec, y = mpg, color = am)) +
                                         geom_point() +
                                         geom_point(x = input$qs, y = 9.62 - 3.92*input$weight + 1.23*input$qs + 
                                         2.94*as.numeric(input$am), shape = 21, size = 4, stroke = 2, fill= "blue", color ="red") + 
                                         geom_smooth(method = "lm") + xlab("1/4 mile time") + ylab("Miles/(US) gallon"))

})
