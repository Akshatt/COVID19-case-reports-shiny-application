library(shiny)
library(googleVis)
library(data.table)

# loading dataset
get_data <- function() {
  states <- read.csv("https://api.covid19india.org/csv/latest/state_wise.csv", 
                     na.strings = "", fileEncoding = "UTF-8-BOM", header = T)[1:6]
}

# server logic
shinyServer(function(input, output) {
  data <- get_data()
  
  output$date <- renderText({
    data$Last_Updated_Time[1]
  })
    
  output$map <- renderGvis({
    data <- data[-1, ] 
    gvisGeoChart(data, "State", input$var, 
                  options=list(region="IN", displayMode="regions", 
                              resolution="provinces", width=950, height=550,
                              colorAxis="{colors:['grey', 'red']}",
                              backgroundColor="lightblue"))
    
    })
})
