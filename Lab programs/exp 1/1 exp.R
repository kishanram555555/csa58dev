# ==============================================
# DevSecOps Tools Installation Verification
# ==============================================

cat("Installation and Configuration of DevSecOps Tools\n")
cat("----------------------------------------------\n")

# R Version
cat("R Version:\n")
print(R.version.string)

# Check Git
git <- system("git --version", intern = TRUE)
cat("\nGit:\n")
print(git)

# Check Docker
docker <- tryCatch(
  system("docker --version", intern = TRUE),
  error = function(e) "Docker not found"
)
cat("\nDocker:\n")
print(docker)

# Check Sonar Scanner
sonar <- tryCatch(
  system("sonar-scanner --version", intern = TRUE),
  error = function(e) "Sonar Scanner not found"
)
cat("\nSonarQube Scanner:\n")
print(sonar)

# Display current Git user (if configured)
username <- tryCatch(
  system("git config --global user.name", intern = TRUE),
  error = function(e) "Not Configured"
)

email <- tryCatch(
  system("git config --global user.email", intern = TRUE),
  error = function(e) "Not Configured"
)

cat("\nGit Username :", username)
cat("\nGit Email    :", email)

cat("\n\nVerification Completed Successfully.\n")