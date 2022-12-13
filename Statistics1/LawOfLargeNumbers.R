N <- 10000000   # input
counter <- 0

for (i in rnorm(N)){
  if (i > -1 & i < 1){
    counter <- counter + 1
  }
}

counter / N
# compare to 68.2% or 0.682



###############

# Specify the sample size
N <- 1000

# Reset the counter
counter <- 0

# Iterate over the vector of numbers

for (i in rnorm(N)) {
  if (i > -1 & i < 1) {
    # Check where iterated variable falls
    counter <- counter + 1        # increase counter if condition is met
  }
}

# Calculate the hit-ratio
answer <- counter / N
answer   # Print the answer in console
