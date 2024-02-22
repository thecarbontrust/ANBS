## ###################################################################################################################
#' @title Fix SPA names to have a standard format: that used in the `SITE_NAME` column in `spalist`
#' @inheritParams spacode.find
#' @return A vector of character values of length `length(pops)` containing the SPA names for each of the populations in `pops`. Non-SPA populations are shown as blank text strings.

spanames.fix <- function(pops, spalist, isspa = NULL, spaaltname = NULL){
  
  ## Step 1. Standardize punctuation
  out <- fix.punctuation(pops)
  
  ## Step 2: Standardize format - remove "SPA" and change commas to semi-colons
  out <- spanames.fixformat(out)
  
  ## Step 3. Set names for non-SPA populations to be empty ("")
  if(! is.null(isspa)){ out[! isspa] <- "" }
  
  ## Step 4. Adjust names using the "spaaltname" column of "spalist"
  if(! is.null(spaaltname)){ out <- spanames.adjname(out, spalist = spalist, spaaltname = spaaltname) }
  
  ## Step 5. Adjust names using the "Altnames.sufficient" column of "spalist"
  out <- spanames.adjname(out, spalist = spalist, spaaltname = "Altnames.sufficient")
  
  out
}
