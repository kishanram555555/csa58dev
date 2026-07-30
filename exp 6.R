# Fibonacci series
n <- 10

a <- 0
b <- 1

cat("Fibonacci Series:\n")

for (i in 1:n) {
  cat(a, " ")
  nextTerm <- a + b
  a <- b
  b <- nextTerm
}