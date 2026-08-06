# ==========================================================
# Design and Simulation of Shift-Left Security Workflow
# ==========================================================

# Set random seed
set.seed(7)

# 1. Define pipeline stages
traditional_pipeline <- c(
  "Code", "Build", "Test",
  "Release", "Security Scan", "Deploy"
)

shift_left_pipeline <- c(
  "Code", "SAST Scan", "Build",
  "SCA Scan", "Test",
  "DAST Scan", "Deploy"
)

# 2. Remediation cost multipliers
cost_multiplier <- c(
  "Code" = 1,
  "SAST Scan" = 1,
  "Build" = 2,
  "SCA Scan" = 2,
  "Test" = 5,
  "DAST Scan" = 5,
  "Security Scan" = 10,
  "Release" = 15,
  "Deploy" = 30
)

# Number of defects
num_defects <- 10

# Function to simulate pipeline
simulate_pipeline <- function(stage_pool){
  
  log <- data.frame(
    Defect = character(),
    Stage = character(),
    Cost = numeric(),
    stringsAsFactors = FALSE
  )
  
  total_cost <- 0
  
  for(i in 1:num_defects){
    
    stage <- sample(stage_pool, 1)
    
    cost <- cost_multiplier[stage]
    
    total_cost <- total_cost + cost
    
    log <- rbind(
      log,
      data.frame(
        Defect = paste0("Defect-", i),
        Stage = stage,
        Cost = cost
      )
    )
  }
  
  return(list(log = log, total = total_cost))
}

# 3. Traditional Pipeline
traditional_pool <- c(
  rep("Security Scan", 6),
  rep("Release", 4)
)

trad <- simulate_pipeline(traditional_pool)

# 4. Shift-Left Pipeline
shift_pool <- c(
  rep("SAST Scan", 5),
  rep("SCA Scan", 3),
  rep("DAST Scan", 2)
)

shift <- simulate_pipeline(shift_pool)

# 5. Display Results

cat("----------------------------------\n")
cat("Traditional Pipeline (Security Checked Late)\n")

for(i in 1:nrow(trad$log)){
  cat(
    sprintf(
      "%-10s detected at %-15s | Cost Units: %d\n",
      trad$log$Defect[i],
      trad$log$Stage[i],
      trad$log$Cost[i]
    )
  )
}

cat("Total Remediation Cost:",
    trad$total,
    "units\n\n")

cat("Shift-Left Pipeline (Security Checked Early)\n")

for(i in 1:nrow(shift$log)){
  cat(
    sprintf(
      "%-10s detected at %-15s | Cost Units: %d\n",
      shift$log$Defect[i],
      shift$log$Stage[i],
      shift$log$Cost[i]
    )
  )
}

cat("Total Remediation Cost:",
    shift$total,
    "units\n")

cost_reduction <-
  ((trad$total - shift$total) / trad$total) * 100

cat("----------------------------------\n")
cat(
  "Cost Reduction with Shift-Left Approach:",
  round(cost_reduction,1),
  "%\n"
)
cat("----------------------------------\n")