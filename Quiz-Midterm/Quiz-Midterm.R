library (argparse)
library (imager)

augmented <- function(img,resize_x,resize_y,gray,rotate){
  if(gray==TRUE){
    imge <- load.image(img)
    gray <- grayscale(imge)
    gray1 <- save.image(im=gray,file=paste0("greyimage.jpg"))
  } 
  if(resize_x&&resize_y > 1){
    imge <- load.image(img)
    imgrsze <- resize(imge, size_x = resize_x, size_y = resize_y)
    save.image(im = imgrsze,file=paste0("resizedimage.jpg"))
  }
  if(rotate>1){
    imge <- load.image(img)
    invimg <- imrotate(im=imge,rotate)
    invimg1 <- save.image(im=invimg,file=paste0("invertedimage.jpg"))
  }
}

parser <- ArgumentParser()
parser$add_argument("--image", help = "Local File Directory of image to augment")
parser$add_argument("--resize_x",type="integer", help = "Height")
parser$add_argument("--resize_y",type="integer", help = "Width")
parser$add_argument("--grayscale" ,type="logical",help = "To grayscale an image")
parser$add_argument("--rotate",type="integer", help = "To rotate the image")

parser$print_help()     
args <- parser$parse_args() 

##input values in cmd
#print (args$image)
#print (args$resize_x)
#print (args$resize_y)
#print (args$grayscale)
#print (args$rotate)



print(augmented(args$image,args$resize_x,args$resize_y,args$grayscale,args$rotate))