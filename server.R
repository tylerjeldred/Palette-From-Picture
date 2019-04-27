require(shiny)
require(jpeg)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  data.photo <- reactive({
    readJPEG(input$photo$datapath)
  })
  
  data.photo.pixels <- reactive({
    data.frame(
      R = as.vector(data.photo()[,,1]),
      G = as.vector(data.photo()[,,2]),
      B = as.vector(data.photo()[,,3])
    )
  })
  
  output$red.average <- renderText({
    mean(data.photo.pixels()$R)
  })
  
  output$green.average <- renderText({
    mean(data.photo.pixels()$G)
  })
  
  output$blue.average <- renderText({
    mean(data.photo.pixels()$B)
  })
}
