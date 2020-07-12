library(shiny)
library(googleVis)
library(data.table)

# loading dataset
get_data <- function() {
  #url <- "https://raw.githubusercontent.com/imdevskp/covid-19-india-data/master/state_level_latest.csv"
  #states <- fread(url, select = c(1:6))
  states <- read.csv("./state_level_latest.csv", header = T)[1:6]
  states <- states[-1, ]
}

# server logic
shinyServer(function(input, output) {

  output$map <- renderGvis({
    data <- get_data() 
    gvisGeoChart(data, "State", input$var, 
                  options=list(region="IN", displayMode="regions", 
                              resolution="provinces", width=950, height=550,
                              colorAxis="{colors:['grey', 'red']}",
                              backgroundColor="lightblue"))
    
    })
  
  output$date <- renderText({
    data <- get_data()
    data$Last_Updated_Time[1]
  })
  
})
