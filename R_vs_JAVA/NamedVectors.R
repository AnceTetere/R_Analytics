#Named Vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie)<- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie)<- NULL
Charlie