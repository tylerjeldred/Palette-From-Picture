## Color Palette From Photo Shiny Application ##

### Running The Application ####
  * RStudio is required/recommended for running the application.
  * All the required R packages should be installed, including `shiny`, `jpeg`, and `dplyr`.
  * To run this app in RStudio, copy the contents of `app.R` into the console window or click the "Run App" button.

### What The Application Does ###
  * The application creates a web application which will allow you to see and calculate a color palette from an uploaded photo.
  * The color palette is calculated by using clustering on the RBG values of the uploaded photo.
  * Each calculated color is displayed along with the RGB values for that color underneath.

### How To Use The Application ###
  * Choose how many colors you would like to calculate for your color palette by selected from the `Number of Colors` input. The minimum is 1 and the maximum is 20.
  * Upload a photo from your file system by clicking the `Browse` button. The file must be a jpeg.
  * After a file is uploaded the colors will start to be calculated. This may take a minute or so as this calculation takes place.
  * When loaded, you will see a color panel and a set of RGB values for each color it calculated from your photo.
  * If you are viewing the application from RStudio and you do not see the color panels with the RGB values, try viewing the application from a browser.
