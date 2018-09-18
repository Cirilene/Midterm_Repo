library (argparse)
library (imager)
library (stringr)
install.packages("argparse")
install.packages("stringr")

parser <- ArgumentParser()
parser$add_argument("-directory",required="True" ,help = "Local File Directory of images to augment :Reqd = TRUE")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-rotate",default=0,type="integer", help = "To change the angle of the image :Default = 0")
parser$add_argument("-grayscale" ,default=FALSE,help = "To grayscale an image :Default = FALSE")

print(parser$print_help(), "\n")

args <- parser$parse_args()

#splitting Height and Width 
num <- args$HxW
HxW <- str_split(num, "x", simplify = TRUE)
H1 <- as.numeric(HxW[1])
W1 <- as.numeric(HxW[2])
H1[is.na(H1)] <- 0
W1[is.na(W1)] <- 0

getimage<- function(x){
  y <- list.files(path=x,pattern = "\\.jpg$", ignore.case=TRUE, recursive = TRUE,full.names = TRUE) 
  lapply(y, load.image)
} 

#printing desired outputs in string
print("Working dir/images: ", args$directory, "\n")
print("Input Height: ", H1, "\n")
print("Input Width: ", W1, "\n")
print("Input for grayscale: ", args$grayscale, "\n")
print("Input angle: ", args$rotate, "\n")

#creating another file to store augmented images
dir.create(file.path("Augmented-Images"), showWarnings = FALSE)


#augmenting image function
augmented <- function(img,H,W,gry,rotate){
  if(gry==TRUE){
    imge <- getimage(img)
    num <- 1:length(imge)
    gray <- lapply(imge,grayscale)
    for (i in num){
      save.image(im = gray[[i]],file=paste0("Augmented-Images/Grayscaled_image_",i,".jpg"))
    }
  }
  if(H&&W > 1){
    imge <- getimage(img)
    num <- 1:length(imge)
    imgresze <- lapply(imge,resize,size_x = H, size_y = W)
    for (i in num){
      save.image(im = imgresze[[i]],file=paste0("Augmented-Images/Resized_image_",i,".jpg"))
    }
  }
  
  if(rotate>1){
    imge <- getimage(img)
    num <- 1:length(imge)
    invimg <- lapply(imge,imrotate,angle = rotate)
    for (i in num){
      save.image(im = invimg[[i]],file=paste0("Augmented-Images/Inverted_image_",i,".jpg"))
    }
  }
}
print(augmented(args$directory,H1,W1,args$grayscale,args$rotate))



