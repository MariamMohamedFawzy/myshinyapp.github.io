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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  used_data = reactive({
    species <- c()
    
    if(input$showSetosa){
      species <- c(species, "setosa")
    }
    if(input$showVersicolor){
      species <- c(species, "versicolor")
    }
    if(input$showVirginica){
      species <- c(species, "virginica")
    }
    if(length(species) == 0) {
      species <- c("setosa", "versicolor", "virginica")
    }
    iris[iris$Species %in% species, ]
  })


  output$sepalPlot <- renderPlot({
    qplot(used_data()$Sepal.Length, used_data()$Sepal.Width, xlab = "Sepal.Length", ylab = "Sepal.Width", colour=used_data()$Species)
  })
  
  output$petalPlot <- renderPlot({
    qplot(used_data()$Petal.Length, used_data()$Petal.Width, xlab = "Petal.Length", ylab = "Petal.Width", colour=used_data()$Species)
  })

  
  
})


