## ########################################################################################
#' Function to scale a matrix to a population esimate then take the overall mean and sd of 
#' the scaled matrix
#'
#' @description <description>
#' 
#' Required package description 
#'
#' @param colony a colony code or name
#' @param populationest Folder name for the required version
#' @param udmatrix a matrix (of utilisation distributions).  
#' The mean and standard deviation will be taken over the udmatrix 
#'
#' @return dataframe with mean and sd column names 
#'  
#' @export


process_meansd <- function(colony, populationest, udmatrix){
  
   result <- tryCatch({
    
    for (i in 1:length(colony)){
      col <- colony[i]
      pop <- populationest[i]
      udmatrix <- udmatrix[[i]]
      
      pop.matrix <- pop * udmatrix
      mean <- mean(pop.matrix)
      sd <- sd(pop.matrix)
      
      df <- data.frame(SPACODE=colony[i], mean=mean, sd=sd)
      }
     
     
     do.call(rbind, df)
     
     
    }, warning = function(w) {w$message <- paste0("warning: ",w$message, " (process_meansd)")
  }, error = function(e) {e$message <- paste0("error: ",e$message, " (process_meansd)")})
  
  return(result)
}
