shinyServer(function(input, output) {
  myData <- reactive({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    data <- read.csv(inFile$datapath, header = TRUE)
    data
  })
  output$contents <- renderTable({
    summary(myData())
  })
  output$plot1 <- renderPlot({
    plot(myData(), main="XX")
  })
}
)