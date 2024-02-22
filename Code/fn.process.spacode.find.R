## ###################################################################################################################
## >> Find the SPA codes associated with a set of populations, that may be using an alternative format for SPA naming and may include non-SPAs
#' @param pops A vector of character values containing the population names, using the format for SPA naming specified by the `SITE_NAME`, `Altnames.sufficient`, `Altnames.spaaltname` columns in `spalist`: SPAs are assumed to be named as in `spalist$Altnames.spaaltname` when that column contains a non-missing entry (i.e. not `NA`), otherwise as in `Altnames.sufficient`, and otherwise as in `SITE_NAME`. 
#' @param spalist A look-up table that species that codes and names, under different naming conventions, for each SPA: this is a dataset in the CEF Data Store. Contains one row per SPA, and columns for "SITE_CODE" (9 character standard SPA code), "SITE_NAME" (the SPA name used in the JNCC SPA datasets), "CEF.include" (is this SPA included in the CEF? - SPAs that are not relevant for any seabird species are not included), "Marine.only" (is this a marine SPAs), "Altnames.sufficient" (minimum text string to look for in any alternative name that ensures it will match to this SITE_CODE), and various columns of the form "Altnames.DATASET" that specify the SPA name used in different datasets. Note that the entries in "Altnames.DATASET" are only specified if they differ from that in "SITE_NAME", otherwise these columns are set to be missing (`NA`).
#' @param isspa A vector of logical values of length `length(pops)` that indicates whether each of the entries in `pops` is an SPA or not
#' @param spaaltname A character string that contains the column name within `spalist` to use for providing the alternative SPA names for this dataset (when they differ from the standard versions in `SITE_NAME`)
#' @param fixna A logical value indicating whether missing values should be set to be missing (`NA`) (if `TRUE`) or blank text strings (if `FALSE`)
#' @return A vector of character values of length `length(pops)` containing the SPA codes for each of the populations in `pops`. Non-SPA populations are shown as missing (`NA`) if `fixna = TRUE` and as blank text strings if `fixna = FALSE`
#' @export 

spacode.find <- function(pops, spalist, isspa = NULL, spaaltname = NULL, fixna = FALSE){
  
  spanames <- spanames.fix(pops = pops, spalist = spalist, isspa = isspa, spaaltname = spaaltname)
  
  out <- spacode.get(spanames, spalist = spalist, fixna = fixna)
  
  out
}