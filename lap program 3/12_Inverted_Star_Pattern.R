# Program 12: Print an Inverted Star Pattern

n <- 5   # number of rows

for (i in n:1) {
  for (j in 1:i) {
    cat("* ")
  }
  cat("\n")
}
