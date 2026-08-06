# Install the package (run this once)
install.packages("vioplot")

# Load the library
library(vioplot)

# Create sample data
set.seed(123)
group_A <- rnorm(100, mean = 60, sd = 8)
group_B <- rnorm(100, mean = 70, sd = 10)
group_C <- rnorm(100, mean = 65, sd = 9)

# Draw the Violin Plot
vioplot(group_A, group_B, group_C,
        names = c("Group A", "Group B", "Group C"),
        col = "lightgreen",
        border = "red",
        main = "Violin Plot Example",
        xlab = "Groups",
        ylab = "Values")

# Optional: Add grid lines
grid()

