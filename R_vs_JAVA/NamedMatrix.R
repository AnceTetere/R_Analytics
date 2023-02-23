#Naming Matrix Dimensions 1
temp.vec <- rep(c("a", "B", "zZ"), each = 3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "are", "you?")
Bravo

colnames(Bravo)<- c("X", "Y", "Z")
Bravo

Bravo["are", "Y"] <- 0
Bravo
rownames(Bravo)<- NULL
Bravo