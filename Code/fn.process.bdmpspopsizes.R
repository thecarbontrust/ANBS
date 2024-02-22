## ########################################################################################
#' @title Add a leading zero to numbers that have a single digit, so that there are always (at least) two digits
#' @description This function is used to convert months into the format needed for the sCRM
#' @param x A vector of integer values, usually between 0 and 99
#' @return A vector of character values of length `length(x)`, containing the values of `x` converted to character strings and with a leading zero added to numbers that were a single digit
## ########################################################################################
#' @export

process_bdmpspopsizes <- function(dat, spalist){
  
  dat$SPACODE <- spacode.find(
    dat$Population, spalist = spalist, isspa = (dat$Poptype == "UK SPA pop"), spaaltname = "Altnames.BDMPS")
  
  dat
}