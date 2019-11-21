
library(shiny)

shinyUI(fluidPage(
    titlePanel("Demonstration of a linear model of the dependence (mtcars database) of
    car fuel consumption on its weight,
    acceleration (1/4 mile time), and type of transmission in comparison with simple linear models."),
    sidebarLayout(
        sidebarPanel(
            sliderInput("weight",
                        "Weight(1000 ibs)",
                        min = 1.5,
                        max = 5.5,
                        value = 3,
                        step = 0.1),
            sliderInput("qs",
                        "1/4 mile time",
                        min = 14,
                        max = 23,
                        value = 18,
                        step = 0.1),
            selectInput("am",
                        "Transmission(0 = automatic, 1 = manual)",
                        sort(unique(mtcars$am))),
            submitButton("Submit")
        ),
        
        mainPanel(
            h3("Miles/(US)gallon"),
            textOutput("text"),
            h3("Weight(1000 ibs) vs Miles/(US)gallon"),
            plotOutput("mpgWtPlot"),
            h3("1/4 mile time vs Miles/(US)gallon"),
            plotOutput("mpgQsecPlot")
        )
    )
))
