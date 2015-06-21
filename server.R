library(shiny)


vo2max <-function(distance) distance*22.351/1000-11.288
aerobic <-function(distance,sex,age) {
          cond<-read.csv(file='aerobic_condition.csv',stringsAsFactors =FALSE)
          cond<-cond[cond$sex==sex,]
          col=6
          if (age<30) col=3
          if (age<40 & age>=30) col=4
          if (age<50 & age>=40) col=5
          ac<-'Excelent'
          for (i in 1:4){
            if (distance<cond[i,col]) {
              ac<-cond$cat[i]
              break
            }
          }
          ac
}
  
shinyServer(
  function(input, output) {
    output$oCat<-renderPrint({aerobic(input$dist,input$sex, input$age)})
    output$oVo<-renderPrint(paste0({vo2max(input$dist)},' ml/m/Kg'))
  }
)