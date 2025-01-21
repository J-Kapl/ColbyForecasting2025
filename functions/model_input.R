#' Reads a model input file given species, month, approach and path
#' 
#' @param scientificname chr, the species name
#' @param mon chr month abbreviation
#' @param approach chr, one of "greedy" or "conservative"
#' @param path chr the path to the data directory
read_model_input = function(scientificname = "Xiphias gladius",
                            mon = "Aug",
                            approach = "greedy",
                            path = data_path("model_input")){
  # your part goes in here
  
  # save the data
  filename = sprintf("%s-%s-%s_input.gpkg", 
                     gsub(" ", "_", scientificname),
                     mon, approach)
  read_sf(file.path(path, filename))
}
