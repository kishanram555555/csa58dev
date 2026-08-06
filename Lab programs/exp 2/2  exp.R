# ==============================================
# Visualization of the DevSecOps Lifecycle
# ==============================================

# Install package (only first time)
# install.packages("DiagrammeR")

library(DiagrammeR)

grViz("
digraph DevSecOps {

graph [layout = dot, rankdir = LR]

node [shape = box, style = filled, fillcolor = lightblue]

Plan     [label='Plan\nThreat Modelling']
Code     [label='Code\nSAST (Static Analysis)']
Build    [label='Build\nSCA (Dependency Scan)']
Test     [label='Test\nDAST (Dynamic Analysis)']
Release  [label='Release\nContainer Image Scan']
Deploy   [label='Deploy\nIaC / Config Scan']
Operate  [label='Operate\nRuntime Protection']
Monitor  [label='Monitor\nContinuous Auditing / SIEM']

Plan -> Code
Code -> Build
Build -> Test
Test -> Release
Release -> Deploy
Deploy -> Operate
Operate -> Monitor
Monitor -> Plan [style=dashed, label='Feedback Loop']

}
")

cat("----------------------------------\n")
cat("DevSecOps Lifecycle Stages Generated\n")
cat("Plan      -> Threat Modelling\n")
cat("Code      -> SAST (Static Analysis)\n")
cat("Build     -> SCA (Dependency Scan)\n")
cat("Test      -> DAST (Dynamic Analysis)\n")
cat("Release   -> Container Image Scan\n")
cat("Deploy    -> IaC / Config Scan\n")
cat("Operate   -> Runtime Protection\n")
cat("Monitor   -> Continuous Auditing / SIEM\n")
cat("----------------------------------\n")
cat("Diagram generated successfully.\n")