# Program 19: Sort an Array in Ascending Order (Bubble Sort)

arr <- c(45, 12, 78, 3, 29, 61)
cat("Original array :", arr, "\n")

n <- length(arr)
for (i in 1:(n - 1)) {
  for (j in 1:(n - i)) {
    if (arr[j] > arr[j + 1]) {
      temp <- arr[j]
      arr[j] <- arr[j + 1]
      arr[j + 1] <- temp
    }
  }
}

cat("Sorted array   :", arr, "\n")
