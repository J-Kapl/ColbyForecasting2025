
read_observations = function(scientificname = "Xiphias gladius",
                             minimum_year = 1970, maximum_year = 2013
                             ){
  
  #' Read raw OBIS data and then filter it
  #' 
  #' @param scientificname chr, the name of the species to read
  #' @param minimum_year num, the earliest year of observation to accept or 
  #'   set to NULL to skip
  #' @param maximum_year num, the latest year of observation to accept or 
  #'   set to NULL to skip
  #' @param ... other arguments passed to `read_obis()`
  #' @return a filtered table of observations
  
  # Happy coding!
  
  # read in the raw data
  # fetch_obis(scientificname)
  x = read_obis(scientificname)
  
  # filter out points missing eventDate
  x = x |>
    filter(!is.na(eventDate))
  
  # if the user provided a non-NULL filter by year
  if (!is.null(minimum_year)){
    x = x |>
      filter(year >= minimum_year, year <= maximum_year)
  }
  
  # filter out PreservedSpecimens
  x = x |>
    filter(basisOfRecord != "PreservedSpecimen")
  
  # filter out missing individualCounts
  x = x |>
    filter(!is.na(individualCount))
  
  return(x)
}
