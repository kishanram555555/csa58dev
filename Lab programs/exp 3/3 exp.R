# ==========================================================
# Security Risk Assessment and Risk Matrix Simulation
# ==========================================================

# Define identified risks
risks <- data.frame(
  Risk = c(
    "SQL Injection",
    "Weak Password Policy",
    "Unpatched Server OS",
    "Misconfigured S3 Bucket",
    "Phishing Attack",
    "Insecure API Endpoint"
  ),
  Likelihood = c(4, 5, 3, 2, 4, 3),
  Impact = c(5, 3, 5, 4, 4, 3)
)

# Calculate Risk Score
risks$Risk_Score <- risks$Likelihood * risks$Impact

# Classify Risk
risks$Category <- ifelse(
  risks$Risk_Score >= 20, "Critical",
  ifelse(
    risks$Risk_Score >= 12, "High",
    ifelse(risks$Risk_Score >= 6, "Medium", "Low")
  )
)

# Sort by Risk Score
risks <- risks[order(-risks$Risk_Score), ]

# Display Risk Register
cat("----------------------------------\n")
cat("Security Risk Register\n")
print(risks)
cat("----------------------------------\n")

# Create 5 x 5 Risk Matrix
risk_matrix <- matrix(0, nrow = 5, ncol = 5)

for(i in 1:nrow(risks)){
  impact <- risks$Impact[i]
  likelihood <- risks$Likelihood[i]
  risk_matrix[impact, likelihood] <- risk_matrix[impact, likelihood] + 1
}

# Save Heatmap
png("risk_matrix_heatmap.png", width = 600, height = 500)

image(
  1:5,
  1:5,
  t(risk_matrix),
  col = heat.colors(20),
  xlab = "Likelihood",
  ylab = "Impact",
  main = "Risk Matrix Heatmap",
  axes = FALSE
)

axis(1, at = 1:5, labels = 1:5)
axis(2, at = 1:5, labels = 1:5)

dev.off()

cat("Risk matrix heatmap saved as risk_matrix_heatmap.png\n")