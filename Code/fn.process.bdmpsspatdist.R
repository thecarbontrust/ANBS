## ########################################################################################
##' @title Add SPA codes to BDMPS spatial distribution data
#' @param dat BDMPS spatial distribution data, as loaded by `read_bdmpsspatdist`
#' @inheritParams spacode.find ## for `spalist`
#' @param bdmpspopsizes BDMPS population data, as loaded by `read_bdmpspopsizes`
#' @return The object `dat` but with an addition column, `SPACODE`, added, that gives the SPA code, for UK SPA colonies (where available). For non-SPA colonies or non-UK populations this is a blank text string (`""`)
## ########################################################################################
##' @export

process_bdmpsspatdist <- function(dat, spalist, bdmpspopsizes){
  
  isspa <- (bdmpspopsizes$Poptype[match(dat$Population, bdmpspopsizes$Population)] == "UK SPA pop")
  
  dat$SPACODE <- spacode.find(
    dat$Population, spalist = spalist, isspa = isspa, spaaltname = "Altnames.BDMPS")
  
  dat
}