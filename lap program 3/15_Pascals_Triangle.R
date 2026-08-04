# Program 15: Print Pascal's Triangle

n <- 5   # number of rows

for (i in 0:(n - 1)) {
  # leading spaces for pyramid shape
  for (s in 1:(n - i)) {
    cat(" ")
  }
  val <- 1
  for (j in 0:i) {
    cat(val, " ")
    val <- val * (i - j) / (j + 1)
  }
  cat("\n")
}
