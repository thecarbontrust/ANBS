## ########################################################################################
#' @title Process SPA list data to standardize site (SPA) names, enabling comparison against names from other datasets
#' @description This fixes punctuation, removes the word "SPA", changes commas to semi-colons, and removes a semi-colon/comma if it is present at the end of a name (and hence redundant)
#' @inheritParams spacode.find ## for `spalist`
#' @return An object of the same format and size as `spalist`, but with columns modified to adjust the site names
## ########################################################################################
#' @export 


process_spalist <- function(spalist){
  
  remove_final_semicolon <- function(x){
    
    for(k in 1:length(x)){
      
      w <- substr(x[k], nchar(x[k]), nchar(x[k]))
      
      if(w == ";"){ x[k] <- substr(x[k], 1, nchar(x[k])-1)}
    }
    
    x
  }
  
  spalist$SITE_NAME <- spanames.fix(spalist$SITE_NAME, spalist = spalist, 
                                    isspa = NULL, spaaltname = NULL)
  
  altnames <- colnames(spalist)[grep("Altnames", colnames(spalist))]
  
  for(i in 1:nrow(spalist)){
    
    for(j in 1:length(altnames)){ 
      
      mm <- which(colnames(spalist) == altnames[j])
      
      spalist[i,mm] <- remove_final_semicolon(spalist[i,mm])
    }
  }
  
  spalist
}