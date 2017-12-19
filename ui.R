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
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       p("Select the species"),
       checkboxInput("showSetosa", "setosa", value = TRUE),
       checkboxInput("showVersicolor", "versicolor", value = TRUE),
       checkboxInput("showVirginica", "virginica", value = TRUE),
       submitButton("Calculate the model")
    ),

    # Show a plot of the generated distribution
    mainPanel(
       h3("Iris species"),
       plotOutput("sepalPlot"),
       plotOutput("petalPlot")
    )
    
  )
))
