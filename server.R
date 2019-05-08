require(shiny)
require(jpeg)
require(dplyr)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  cluster.points.color <- reactive({
    data.photo <- readJPEG(input$photo$datapath)
    
    data.photo.pixels <- data.frame(
      R = as.vector(data.photo[,,1]),
      G = as.vector(data.photo[,,2]),
      B = as.vector(data.photo[,,3])
    )
    
    as.data.frame(kmeans(data.photo.pixels, input$color.number)$centers) %>%
      mutate(R = round(R * 255), G = round(G * 255), B = round(B * 255))
  })
  
  lapply(1:20, function(row.number){
    
    output[[paste0("RGB.", row.number)]] <- renderText({
      if(row.number <= input$color.number) {
        paste0(
          "RGB: ", 
          paste(
            cluster.points.color()$R[row.number],
            cluster.points.color()$G[row.number],
            cluster.points.color()$B[row.number],
            sep = ", "
          )
        )
      }
      else {
        ""
      }
    })
    
    output[[paste0("color.panel.", row.number)]] <- renderUI({
      R <- cluster.points.color()$R[row.number]
      G <- cluster.points.color()$G[row.number]
      B <- cluster.points.color()$B[row.number]
      
      RGB <- paste(R, G, B, sep = ",")
      tags$div(style = paste0("height: 30px; weight: 100%; background-color:rgb(", RGB, ")"))
    })
    
  })
}
