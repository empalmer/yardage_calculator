#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

  
    output$yards <- renderPrint({
      
      # LACE                 550 - 800 YARDS PER 100G
      # FINGERING            380 - 460 YARDS PER 100G
      # SPORT                300 - 360 YARDS PER 100G
      # DK                   240 - 280 YARDS PER 100G
      # WORSTED              200 - 240 YARDS PER 100G
      # ARAN                 120 -180 YARDS PER 100G
      # BULKY                100 - 120 YARDS PER 100G
      # SUPER BULKY          <100 YARDS PER 100G
      yards.min <- 0
      yards.max <- 0
      
      if(input$weight == "fingering"){
        yards.min = (380/100)*input$grams
        yards.max = (480/100)*input$grams
      }
         
      if(input$weight == "worsted"){
        yards.min = (200/100)*input$grams
        yards.max = (240/100)*input$grams
      }
      
      print(paste0("Between ", yards.min, " - ", yards.max, " yards. "))
      #print(input$weight)
      })
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')

    })

}
