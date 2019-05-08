# To run this app in RStudio, 
# copy the contents of app.R 
# into the console window 
# or click the "Run App" button

require(shiny)
require(jpeg)
require(dplyr)

# server logic for calculating and displaying colors
server <- function(input, output) {
  
  # read the RGB values from the JPEG as a data frame,
  # calculate a cluster for the those RGB values,
  # and get centers of each cluster as a data frame
  cluster.points.color <- reactive({
    # read in the uploaded file as a jpeg
    data.photo <- readJPEG(input$photo$datapath)
    
    # create a dataframe from the jpeg
    data.photo.pixels <- data.frame(
      R = as.vector(data.photo[,,1]),
      G = as.vector(data.photo[,,2]),
      B = as.vector(data.photo[,,3])
    )
    
    # use kmeans to calculate a clustering and set the centers as a dataframe
    as.data.frame(kmeans(data.photo.pixels, input$color.number)$centers) %>%
      mutate(R = round(R * 255), G = round(G * 255), B = round(B * 255))
  })
  
  # for up to 20 clusters, output the color panel and the RGB values
  lapply(1:20, function(row.number){
    
    # output to RGB.1, RGB.2 etc the RBG values for each cluster center
    output[[paste0("RGB.", row.number)]] <- renderText({
      # if we haven't gone through each cluster center, output the values for this cluster center
      if(row.number <= input$color.number) {
        # output RBG: and then each RBG value separated by commas
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
        # if we haven't gone through each cluster center, output blank
        ""
      }
    })
    
    #output to color.panel.1, color.panel.2, etc a color panel with color of each cluster center
    output[[paste0("color.panel.", row.number)]] <- renderUI({
      # get the RBG values for this row
      R <- cluster.points.color()$R[row.number]
      G <- cluster.points.color()$G[row.number]
      B <- cluster.points.color()$B[row.number]
      
      # get the RGB value we will need to set in the style attribute
      RGB <- paste(R, G, B, sep = ",")
      #output a div with the same RBG value as the cluster center
      tags$div(style = paste0("height: 30px; weight: 100%; background-color:rgb(", RGB, ")"))
    })
    
  })
}
