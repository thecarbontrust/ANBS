## ########################################################################################
#' Transform coordinates from one project to another
#'
#' @description 
#'  
#' @param fromcrs The projection that the data are currently in. 
#' Will accept any input that follows `crs()` convention, eg. "espg:25831" or "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84".
#' @param tocrs The projection that you would like the data transformed to. 
#' Will accept any input that follows `crs()` convention, eg. "espg:25831" or "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84".
#' @param coord1 A vector of longitude coordinates in the projection the data are currently in, e.g. c(3413466, 3298466)
#' @param coord2 A vector of latitude coordinates in the projection the data are currently in, e.g. c(4103659, 4035659)
#'
#' @return dataframe with 2 variables: t.coordx <num>, t.coordy <num>, with length(coord1)
#' 
#' @examples process_transform.coords(fromcrs="epsg:3035", tocrs="epsg:6391", coord1=c(3413466, 3298466), coord2=c(4103659, 4035659))
#' 
#'  
#' @export
 

process_transform.coords <- function(fromcrs, tocrs, coord1, coord2){
  
  result <- tryCatch({
    
  
 # f <- as.data.frame(sf_project(from=crs(fromcrs), to=crs(tocrs), cbind(coord1, coord2)))
   f <- as.data.frame(sf_project(from=fromcrs, to=tocrs, cbind(coord1, coord2)))
    
  
  }, warning = function(w) {w$message <- paste0("projection transform warning: ",w$message, " (process_transform.coords)")
  }, error = function(e) {e$message <- paste0("projection transform error: ",e$message, " (process_transform.coords)")})
  
  
  colnames(result)[1] <- "t.coordx"
  colnames(result)[2] <- "t.coordy"
  

  return(result)
}