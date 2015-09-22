library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Carrier Mobility & Resistivity Calculator for Silicon"),
    sidebarPanel(
      radioButtons("Dopant", "Dopant",
                   list("Arsenic" = "Arsenic",
                     "Boron" = "Boron",
                     "Phosporus" = "Phosporus"), selected = NULL, inline = FALSE),
      numericInput('Concentration', 'Impurity Concentration', 1E15),
      submitButton('Submit')
    ),
    mainPanel(
      h4('Dopant type chosen:'),
      verbatimTextOutput("Dopant"),
      h4('Impurity concentration entered:'),
      verbatimTextOutput("inputValue"),
      h4('Calculated carrier mobility:'),
      verbatimTextOutput("mobility"),
      h4('Calculated resistivity:'),
      verbatimTextOutput("resistivity")
    )
  )
)
