library(shiny)

arsenicumin <- 52.2
arsenicumax <- 1417
arsenicnr <- 9.68E16
arsenicalpha <- 0.68

boronumin <- 44.9
boronumax <- 470.5
boronnr <- 2.23E17
boronalpha <- 0.719

phosporusumin <- 68.5
phosporusumax <- 1414
phosporusnr <- 9.20E16
phosporusalpha <- 0.711

q <- 1.602E-19

shinyServer(
  function(input, output) {
  
    output$Dopant <- renderText(input$Dopant)
    output$inputValue <- renderText({input$Concentration})
    output$mobility <- renderText({
      if (input$Dopant == "Arsenic") arsenicumin + ((arsenicumax - arsenicumin)/(1+(input$Concentration/arsenicnr)^arsenicalpha))
      else if(input$Dopant == "Boron") boronumin + ((boronumax - boronumin)/(1+(input$Concentration/boronnr)^boronalpha))
      else if(input$Dopant == "Phosporus") phosporusumin + ((phosporusumax - phosporusumin)/(1+(input$Concentration/phosporusnr)^phosporusalpha))
      })
    output$resistivity <- renderText({
      if (input$Dopant == "Arsenic") 1/(q*input$Concentration*(arsenicumin + ((arsenicumax - arsenicumin)/(1+(input$Concentration/arsenicnr)^arsenicalpha))))
      else if(input$Dopant == "Boron") 1/(q*input$Concentration*(boronumin + ((boronumax - boronumin)/(1+(input$Concentration/boronnr)^boronalpha))))
      else if(input$Dopant == "Phosporus") 1/(q*input$Concentration*(phosporusumin + ((phosporusumax - phosporusumin)/(1+(input$Concentration/phosporusnr)^phosporusalpha))))
    })
}
)