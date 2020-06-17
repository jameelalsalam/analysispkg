
library(tidyverse)

glimpse(big_epa_cars)

distinct(big_epa_cars, fuelType)

ev <- filter(big_epa_cars, fuelType == "Electricity")

distinct(ev, make, model) %>% arrange(make, model) %>% View()

model_grp <- function(make, model) {

  # look to group models that are listed as slight variations in the data
  grps <- tribble(
    ~make, ~model_rgx, ~model_grp,
    "BMW", "^i3\\s", "i3",
    "Nissan", "^Leaf\\s", "Leaf",
    "Tesla", "^Model 3\\s", "Model 3",
    "Tesla", "^Model S\\s", "Model S",
    "Tesla", "^Model X\\s", "Model X"
  )

  case_expr_fun <- function(i) {
    rlang::new_formula(
      lhs = expr(make == grps$make[!!i] & str_detect(model, grps$model_rgx[!!i])),
      rhs = expr(grps$model_grp[!!i]))
  }

  case_exprs <- map(1:5, case_expr_fun)

  res <- case_when(
    !!!case_exprs,
    TRUE ~ model
  )

  res
}

ev %>%
  mutate(model_grp = model_grp(make, model))
