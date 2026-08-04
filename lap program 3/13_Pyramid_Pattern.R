# Program 13: Print a Pyramid Pattern

n <- 5   # number of rows

for (i in 1:n) {
  # print leading spaces
  if (n - i > 0) {
    for (s in 1:(n - i)) {
      cat(" ")
    }
  }
  # print stars
  for (j in 1:(2 * i - 1)) {
    cat("*")
  }
  cat("\n")
}
