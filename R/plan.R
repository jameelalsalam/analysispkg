
#' Analysis plan
#'
#' Analysis is rebuilt using `drake::make(plan)`
#' @import drake
#'
plan <- drake::drake_plan(

  big_epa_cars = readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-15/big_epa_cars.csv"),

  data_export = target({
    usethis::use_data(big_epa_cars, overwrite = TRUE)
    "data/big_epa_cars.rda"
  }, format = "file")
)

