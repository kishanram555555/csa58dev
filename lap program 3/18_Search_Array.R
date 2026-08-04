# Program 18: Search for an Element in an Array (Linear Search)

arr <- c(15, 8, 42, 27, 3, 56)
key <- 27

cat("Array elements :", arr, "\n")
cat("Element to search:", key, "\n")

found <- FALSE
for (i in 1:length(arr)) {
  if (arr[i] == key) {
    cat("Element", key, "found at position", i, "\n")
    found <- TRUE
    break
  }
}

if (!found) {
  cat("Element", key, "not found in the array\n")
}
