install.packages("tidyverse")

vec <- c(1, 2, 3)
map(vec, ~.x^2)

sq <- function(.x){
  .x^2
}
map(vec, sq)
