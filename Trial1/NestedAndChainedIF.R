

# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----

# Chained if // chaining statements
rm(answer2)
x <- rnorm(1)

if (x > 1) {
  answer2 <- "Greater than 1"
  answer2
} else if (x >= -1) {
  answer2 <- "Between -1 and 1"
  answer2
} else {
  answer2 <- "Less than -1"
  answer2
}


# Nested if // nesting statements
rm(answer1)
x <- rnorm(1)

if (x > 1) {
  answer1 <- "Greater than 1"
  answer1
} else {
  if (x >= -1) {
    answer1 <- "Between -1 and 1"
    answer1
  } else {
    answer1 <- "Less than -1"
    answer1
  }
}

rm(answer)
x <- rnorm(1)

if (x > 1) {
  answer <- "Greater than 1"
  answer
} else {
  answer <- "Less than or equal to 1"
  answer
}
