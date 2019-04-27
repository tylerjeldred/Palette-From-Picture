require(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Color Palette From Photo"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Input: Select a file ----
      fileInput(
        "photo", 
        "Upload a Photo (must be JPG)",
        multiple = FALSE,
        accept = c(".jpg")
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("red.average"),
      textOutput("green.average"),
      textOutput("blue.average")
    )
  )
)

