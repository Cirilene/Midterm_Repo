install.packages("imager")
install.packages("magick")

library(imager)
file <- system.file("extdata/parrots.png" , package='imager')
parrot <- load.image(file)
print(parrot)
#URL
library(magick)
cat <- image_read("https://wallpaperbrowse.com/media/images/cat-1285634_960_720.png")
print(cat)