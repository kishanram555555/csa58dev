# Program 20: Reverse an Array

arr <- c(10, 20, 30, 40, 50)
cat("Original array :", arr, "\n")

n <- length(arr)
reversed <- vector(mode = "numeric", length = n)

for (i in 1:n) {
  reversed[i] <- arr[n - i + 1]
}

cat("Reversed array :", reversed, "\n")

# Alternative built-in method:
cat("Using rev()    :", rev(arr), "\n")
