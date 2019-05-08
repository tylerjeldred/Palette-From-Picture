require(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$style(
    type = "text/css",
    ".shiny-output-error { visibility: hidden; }",
    ".shiny-output-error:before { visibility: hidden; }"
  ),
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
      ),
      numericInput("color.number", "Number of Colors", 5, max = 20)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      uiOutput("color.panel"),
      lapply(1:20, function(index){
        list(
          uiOutput(paste0("color.panel.", index)),
          textOutput(paste0("RGB.", index))
        )
      })
    )
  )
)

