N <- 1000000
a <- rnorm(N)
b <- rnorm(N)

# Vectorized approach (r)
c <- a * b

#De-vectorized approach (JAVA)
d <- rep(NA, N)
for(i in 1:N){
  d[i] <- a[i] * b[i]
}