# To run this app in RStudio, 
# copy the contents of this file 
# into the console window 
# or click the "Run App" button

# load the ui code
source("ui.R")
# load the server code
source("server.R")

# run the application 
shinyApp(ui = ui, server = server)
