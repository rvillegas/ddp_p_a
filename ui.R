##setwd('D:\\rvillegas\\Mio\\coursera\\ddp\\wd\\ddp_p_a')

library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Cooper test to measure VO2Max"),

    sidebarPanel(
      h6("Cooper test is an easy way to calculate VO2 Max."),
      h6("VO2 max is the maximal oxygen uptake or the maximum volume of oxygen 
         that can be utilized in one minute during maximal or exhaustive exercise. 
         It is measured as milliliters of oxygen used in one minute per kilogram of body weight"),
      h6("Cooper test only need the distance when running 12 minutes, the result show the category of aerobic condition."),
      
      radioButtons("sex", label = h3("Sex"),
                   choices = list("Male" = "Male", "Female" = "Female"),selected = "Male"),
      numericInput('age', 'Age', 30, min = 10, max = 100, step = 1),
      numericInput('dist', 'Distance(m)', 1200, min = 1200, max = 4000, step = 1),

      submitButton('Submit')
    ),
    mainPanel(
      h3('Aerobic category and VO2Max'),
      h4('Aerobic category:'),
      verbatimTextOutput("oCat"),
      h4('VO2Max'),
      verbatimTextOutput("oVo")
    )
  )
)