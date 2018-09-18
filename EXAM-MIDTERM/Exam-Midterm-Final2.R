library (argparse)
library (imager)
library (stringr)


parser <- ArgumentParser()
parser$add_argument("-folder",required="True" ,help = "Local File Directory of images to augment :Reqd = TRUE")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image :Default = 0")
parser$add_argument("-grayscale" ,default=FALSE,help = "To grayscale an image :Default = FALSE")

cat(parser$print_help(), "\n")

args <- parser$parse_args()

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

cat("Current working dir/images: ", args$folder, "\n")
cat("Current input Height: ", H1, "\n")
cat("Current input Width: ", W1, "\n")
cat("Current input for grayscale: ", args$grayscale, "\n")
cat("Current input angle: ", args$angle, "\n")

dir.create(file.path("Augmented-Images"), showWarnings = FALSE)


augmented <- function(img,H,W,gry,angle){
  if(gry==TRUE){
    imge <- getimage(img)
    num <- 1:length(imge)
    gray <- lapply(imge,grayscale)
    for (i in num){
      save.image(im = gray[[i]],file=paste0("Augmented-Images/Grayscaled-Image",i,".jpg"))
    }
  }
  if(H&&W > 1){
    imge <- getimage(img)
    num <- 1:length(imge)
    imgresze <- lapply(imge,resize,size_x = H, size_y = W)
    for (i in num){
      save.image(im = imgresze[[i]],file=paste0("Augmented-Images/Resized-Image",i,".jpg"))
    }
  }
  if(angle>1){
    imge <- getimage(img)
    num <- 1:length(imge)
    invimg <- lapply(imge,imrotate,angle = angle)
    for (i in num){
      save.image(im = invimg[[i]],file=paste0("Augmented-Images/Rotate-Image",i,".jpg"))
    }
  }
}
print(augmented(args$folder,H1,W1,args$grayscale,args$angle))



