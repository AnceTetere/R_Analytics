# Enter the values
SEd <- as.numeric(readline('What is the standard error of the contrast? '))
meand <- as.numeric(readline('What is the contrast mean? '))
nu <- as.numeric(readline('What are the degrees of freedom of the contrast? '))

likelihoodmax <- 0
theta <- numeric(1000)
theta[1] <- meand - 5 * SEd
inc <- SEd / 100
likelihood <- numeric(1000)

for (B in 1:1000) {
  theta[B] <- theta[1] + (B - 1) * inc
  likelihood[B] <- (1 + (meand - theta[B])^2 / (nu * SEd^2))^(-(nu + 1) / 2)
  if (likelihood[B] > likelihoodmax) {
    likelihoodmax <- likelihood[B]
  }
}

for (B in 1:1000) {
  likelihood[B] <- likelihood[B] / likelihoodmax
}

outofrange <- meand - 6 * SEd
begin8 <- outofrange
begin32 <- outofrange
end8 <- outofrange
end32 <- outofrange

for (B in 1:1000) {
  if (begin8 == outofrange && likelihood[B] > 1/8) {
    begin8 <- theta[B]
  }
  if (begin32 == outofrange && likelihood[B] > 1/32) {
    begin32 <- theta[B]
  }
  if (begin8 != outofrange && end8 == outofrange) {
    if (likelihood[B] < 1/8) {
      end8 <- theta[B]
    }
  }
  if (begin32 != outofrange && end32 == outofrange) {
    if (likelihood[B] < 1/32) {
      end32 <- theta[B]
    }
  }
}

theta1 <- as.numeric(readline('What is the population contrast mean assumed by the first hypothesis? '))
theta2 <- as.numeric(readline('What is the population contrast mean assumed by the second hypothesis? '))

B1 <- as.integer((theta1 - theta[1]) / inc + 1)
B2 <- as.integer((theta2 - theta[1]) / inc + 1)

likelihoodratio <- likelihood[B1] / likelihood[B2]

begin32
end32
begin8
end8

rm(end32, end8, inc, likelihood, likelihoodmax, likelihoodratio, meand)
rm(outofrange, SEd, theta, theta1, theta2, B1, B2, begin32, begin8, B, nu)
