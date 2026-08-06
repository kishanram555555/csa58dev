# ==========================================================
# Threat Propagation Simulation and Attack Surface Analysis
# ==========================================================

# Install package (Run only once)
# install.packages("igraph")

library(igraph)

# Set random seed
set.seed(1)

# Create a synthetic network
g <- sample_gnp(15, 0.2)

# Host names
V(g)$name <- paste0("Host-", 0:(vcount(g)-1))

# Degree centrality
degree_centrality <- degree(g, normalized = TRUE)

# Most exposed host
most_exposed <- which.max(degree_centrality)

cat("----------------------------------\n")
cat("Attack Surface Analysis\n")
cat("Total Hosts:", vcount(g), "\n")
cat("Total Connections:", ecount(g), "\n")
cat("Most Exposed Host:",
    V(g)$name[most_exposed],
    "(Degree Centrality:",
    round(degree_centrality[most_exposed],2),")\n")

# Threat Propagation
infected <- c(most_exposed)
infection_prob <- 0.4

for(round in 1:5){
  
  new_infected <- c()
  
  for(node in infected){
    
    neighbors <- neighbors(g, node)
    
    for(nb in neighbors){
      
      nb_id <- as.numeric(nb)
      
      if(!(nb_id %in% infected)){
        if(runif(1) < infection_prob){
          new_infected <- c(new_infected, nb_id)
        }
      }
    }
  }
  
  infected <- unique(c(infected, new_infected))
  
  cat("Round", round,
      ": Infected Hosts =", length(infected), "\n")
}

cat("----------------------------------\n")

# Node colors
colors <- rep("lightgreen", vcount(g))
colors[infected] <- "red"

# Save graph
png("threat_propagation.png",
    width = 700,
    height = 600)

plot(
  g,
  vertex.color = colors,
  vertex.size = 30,
  vertex.label = V(g)$name,
  main = "Threat Propagation Result\n(Red = Infected)"
)

dev.off()

cat("Propagation graph saved as threat_propagation.png\n")