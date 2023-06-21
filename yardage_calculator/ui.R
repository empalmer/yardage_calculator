#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("weight", "Select yarn weight",
                        choices = c("fingering", "sport","worsted")
                        ), 
            numericInput("grams", "Enter grams of yarn", value = 0, 
                         min = 0)
        ),

        mainPanel(
          verbatimTextOutput("yards"))
    )
)
