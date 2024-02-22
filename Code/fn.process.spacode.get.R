## ###################################################################################################################
#' @title Find the SPA codes associated with a set of SPA names
#' @param spanames A vector of character values containing SPA names, in the correct format (i.e. as in the `SITE_NAME` column in `spalist`): non-SPA populations are shown by blank text strings (`""`)
#' @inheritParams spacode.find
#' @return A vector of character values of length `length(spanames)` containing the SPA codes for each of the populations in `spanames`. Non-SPA populations are shown as missing (`NA`) if `fixna = TRUE` and as blank text strings if `fixna = FALSE`

spacode.get <- function(spanames, spalist, fixna){
  
  w1 <- which(spanames != "")
  
  spathis <- spanames[w1]
  
  mm <- match(spathis, spalist$SITE_NAME)
  
  if(any(is.na(mm))){ warning(c("-----", paste("Not all apparent SPA names in data file match to an SPA code! SPA names that do not match are:",
                                               paste(unique(spathis[is.na(mm)]), collapse=" | "))), "-----") }
  
  w2 <- ! is.na(mm)
  
  mm <- mm[w2]
  
  out <- rep("", length(spanames))
  
  if(fixna){
    
    out[w1[! w2]] <- NA
  }
  else{
    
    out[w1[! w2]] <- ""
  }
  
  out[w1[w2]] <- spalist$SITE_CODE[mm]
  
  out
}