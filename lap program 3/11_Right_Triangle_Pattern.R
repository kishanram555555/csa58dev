# Program 11: Print a Right Triangle Star Pattern

n <- 5   # number of rows

for (i in 1:n) {
  for (j in 1:i) {
    cat("* ")
  }
  cat("\n")
}
