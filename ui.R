library(shiny)
library(markdown)

shinyUI(navbarPage("Case Reports",
  tabPanel("App",
  
          titlePanel("Visualization of COVID19 cases in INDIA"),
          
          sidebarPanel(
               selectInput("var", 
                         label = "Choose the type of cases you want to see:",
                         choices = c("Confirmed", "Recovered","Deaths", "Active"),
                         multiple=FALSE),
               h4("Detailed Instructions\n"),
               h5("This app will let you see the updated COVID19 cases per state in India.\n\n"),
               h4("This information was last updated at:",textOutput("date"))
            ),
             
           mainPanel(htmlOutput("map")) 
        
          ),
  
  tabPanel("Documentation",                          
           mainPanel(
             includeMarkdown("doc.Rmd"))
          )
      )
)
