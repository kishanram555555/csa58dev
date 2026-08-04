# Program 14: Print Floyd's Triangle

n <- 5   # number of rows
num <- 1

for (i in 1:n) {
  for (j in 1:i) {
    cat(num, " ")
    num <- num + 1
  }
  cat("\n")
}
