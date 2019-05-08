# To run this app in RStudio, 
# copy the contents of app.R 
# into the console window 
# or click the "Run App" button

require(shiny)

# define UI for the application
ui <- fluidPage(
  # style tag to hide error text for when a photo hasn't been uploaded yet
  tags$style(
    type = "text/css",
    ".shiny-output-error { visibility: hidden; }",
    ".shiny-output-error:before { visibility: hidden; }"
  ),
  
  # application title
  titlePanel("Color Palette From Photo"),
  
  # sidebar with inputs
  sidebarLayout(
    sidebarPanel(
      # input: select a file
      fileInput(
        "photo", 
        "Upload a Photo (must be JPG)",
        multiple = FALSE,
        accept = c(".jpg")
      ),
      
      # input: number of colors
      numericInput("color.number", "Number of Colors", 5, min = 1, max = 20)
    ),
    
    # show colors and RBG values for calculated colors
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

