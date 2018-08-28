install.packages("imager")
install.packages("magick")


#LOCAL
library(imager)
file <- system.file("extdata/parrots.png" , package='imager')
parrot <- load.image(file)
print(parrot)
#URL
library(magick)
cat <- image_read("https://wallpaperbrowse.com/media/images/cat-1285634_960_720.png")
print(cat)

#RESIZE IMAGE
#LOCAL
library(imager)
file <- system.file("extdata/parrots.png" , package='imager')
parrot <- load.image(file)
sub <- function(data,w,h){
  resize(data,w,h)
}
x<- sub(parrot, 200, 100)
plot(x, main="Resized")
save.image(x,"C:/Users/RM A-225/Documents/CIRILENE/Midterm_Repo/Augmented Images/ResizedParrot.jpg")

#INVERTING IMAGE
library(imager)
file <- system.file("extdata/parrots.png" , package='imager')
parrot <- load.image(file)
subset <- function(data,x){
  imrotate(data,x) %>% plot(main="Inverting")
}
y<- subset(parrot,180)
plot(y)
save.image(y,"C:/Users/RM A-225/Documents/CIRILENE/Midterm_Repo/Augmented Images/InvertedParrot.jpg")

#GRAYSCALE IMAGE
library(imager)
file <- system.file("extdata/parrots.png" , package='imager')
parrot <- load.image(file)
subset <- function(data,x){
  grayscale(data,method = "Luma", drop = x)
}
y<-subset(parrot,TRUE)
plot(y)
save.image(y,"C:/Users/RM A-225/Documents/CIRILENE/Midterm_Repo/Augmented Images/GrayscaleParrot.jpg")