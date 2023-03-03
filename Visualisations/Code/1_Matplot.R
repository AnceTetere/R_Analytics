myplot <- function(data, rows = 1:10){
  Data <- Games[rows, , drop = F]
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4, 6), pch = 15:18)
}
myplot(MinutesPlayed/Games, 3)


Data <- MinutesPlayed[1, , drop = FALSE]

matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players[1], 
                            col = c(1:4, 6), pch = 15:18)


matplot(t(FieldGoals / Games),
        type = "b",
        pch = 15:18,
        col = c(1:4, 6))

legend("bottomleft", 
       inset = 0.01, 
       legend = Players, 
       col = c(1:4, 6),
       pch = 15:18,
       horiz = F)

##############

matplot(t(FieldGoals / FieldGoalAttempts),
        type = "b",
        pch = 15:18,
        col = c(1:4, 6))

legend("bottomleft", 
       inset = 0.01, 
       legend = Players, 
       col = c(1:4, 6),
       pch = 15:18,
       horiz = F)