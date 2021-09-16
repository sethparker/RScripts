###################################
# NPP NEGATIVE MORTALITY ANALYSIS #
###################################
# Model parameters
num_tree <- 38 # Enter the number of tree species modeled
num_liana <- 9 # Enter the number of liana species modeled
num_sp <- num_tree + num_liana
num_steps <- 120 # Enter the number of months modeled
num_ens <- 500 # Enter the number of realizations in each ensemble
# Load in species data from modified TROLL input file (species table only, comma separated)
species_info <- read.csv("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/CR_46_df.txt", header = TRUE)

# we have previously confirmed that trees won't die without liana with background mortality off

###################
# ALAM / MITE
###################
# Read in tree
ALAM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ALAM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    ALAM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ALAM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                              header = FALSE)
    # creating add columns
    colnames(ALAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    ALAM[[j]]$month <- seq.int(nrow(ALAM[[j]]))
    ALAM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {ALAM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(ALAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ALAM[[j]]$month <- seq.int(nrow(ALAM[[j]]))
  ALAM[[j]]$run <- j
  }
}

# And it's liana
MITE_ALAM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ALAM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_ALAM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ALAM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_ALAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_ALAM[[j]]$month <- seq.int(nrow(MITE_ALAM[[j]]))
    MITE_ALAM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_ALAM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_ALAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_ALAM[[j]]$month <- seq.int(nrow(MITE_ALAM[[j]]))
  MITE_ALAM[[j]]$run <- j
  }
}

###################
# ANRE / MITE
###################
# Read in tree
ANRE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ANRE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    ANRE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ANRE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(ANRE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    ANRE[[j]]$month <- seq.int(nrow(ANRE[[j]]))
    ANRE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {ANRE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(ANRE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ANRE[[j]]$month <- seq.int(nrow(ANRE[[j]]))
  ANRE[[j]]$run <- j
  }
}

# And it's liana
MITE_ANRE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ANRE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_ANRE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/ANRE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_ANRE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_ANRE[[j]]$month <- seq.int(nrow(MITE_ANRE[[j]]))
    MITE_ANRE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_ANRE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_ANRE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_ANRE[[j]]$month <- seq.int(nrow(MITE_ANRE[[j]]))
  MITE_ANRE[[j]]$run <- j
  }
}

###################
# BRAL / MITE
###################
# Read in tree
BRAL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BRAL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    BRAL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BRAL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(BRAL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    BRAL[[j]]$month <- seq.int(nrow(BRAL[[j]]))
    BRAL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {BRAL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(BRAL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  BRAL[[j]]$month <- seq.int(nrow(BRAL[[j]]))
  BRAL[[j]]$run <- j
  }
}

# And it's liana
MITE_BRAL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BRAL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_BRAL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BRAL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_BRAL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_BRAL[[j]]$month <- seq.int(nrow(MITE_BRAL[[j]]))
    MITE_BRAL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_BRAL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_BRAL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_BRAL[[j]]$month <- seq.int(nrow(MITE_BRAL[[j]]))
  MITE_BRAL[[j]]$run <- j
  }
}

###################
# BUSI / MITE
###################
# Read in tree
BUSI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BUSI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    BUSI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BUSI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(BUSI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    BUSI[[j]]$month <- seq.int(nrow(BUSI[[j]]))
    BUSI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {BUSI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(BUSI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  BUSI[[j]]$month <- seq.int(nrow(BUSI[[j]]))
  BUSI[[j]]$run <- j
  }
}

# And it's liana
MITE_BUSI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BUSI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_BUSI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BUSI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_BUSI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_BUSI[[j]]$month <- seq.int(nrow(MITE_BUSI[[j]]))
    MITE_BUSI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_BUSI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_BUSI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_BUSI[[j]]$month <- seq.int(nrow(MITE_BUSI[[j]]))
  MITE_BUSI[[j]]$run <- j
  }
}

###################
# BYCR / MITE
###################
# Read in tree
BYCR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BYCR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    BYCR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BYCR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(BYCR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    BYCR[[j]]$month <- seq.int(nrow(BYCR[[j]]))
    BYCR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {BYCR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(BYCR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  BYCR[[j]]$month <- seq.int(nrow(BYCR[[j]]))
  BYCR[[j]]$run <- j
  }
}

# And it's liana
MITE_BYCR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BYCR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_BYCR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/BYCR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_BYCR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_BYCR[[j]]$month <- seq.int(nrow(MITE_BYCR[[j]]))
    MITE_BYCR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_BYCR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_BYCR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_BYCR[[j]]$month <- seq.int(nrow(MITE_BYCR[[j]]))
  MITE_BYCR[[j]]$run <- j
  }
}

###################
# CAER / MITE
###################
# Read in tree
CAER <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CAER:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    CAER[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CAER:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(CAER[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    CAER[[j]]$month <- seq.int(nrow(CAER[[j]]))
    CAER[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {CAER[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(CAER[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  CAER[[j]]$month <- seq.int(nrow(CAER[[j]]))
  CAER[[j]]$run <- j
  }
}

# And it's liana
MITE_CAER <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CAER:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_CAER[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CAER:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_CAER[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_CAER[[j]]$month <- seq.int(nrow(MITE_CAER[[j]]))
    MITE_CAER[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_CAER[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_CAER[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_CAER[[j]]$month <- seq.int(nrow(MITE_CAER[[j]]))
  MITE_CAER[[j]]$run <- j
  }
}

###################
# CACA / MITE
###################
# Read in tree
CACA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CACA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    CACA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CACA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(CACA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    CACA[[j]]$month <- seq.int(nrow(CACA[[j]]))
    CACA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {CACA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(CACA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  CACA[[j]]$month <- seq.int(nrow(CACA[[j]]))
  CACA[[j]]$run <- j
  }
}

# And it's liana
MITE_CACA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CACA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_CACA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CACA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_CACA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_CACA[[j]]$month <- seq.int(nrow(MITE_CACA[[j]]))
    MITE_CACA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_CACA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_CACA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_CACA[[j]]$month <- seq.int(nrow(MITE_CACA[[j]]))
  MITE_CACA[[j]]$run <- j
  }
}

###################
# CEPE / MITE
###################
# Read in tree
CEPE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CEPE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    CEPE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CEPE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(CEPE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    CEPE[[j]]$month <- seq.int(nrow(CEPE[[j]]))
    CEPE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {CEPE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(CEPE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  CEPE[[j]]$month <- seq.int(nrow(CEPE[[j]]))
  CEPE[[j]]$run <- j
  }
}

# And it's liana
MITE_CEPE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CEPE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_CEPE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CEPE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_CEPE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_CEPE[[j]]$month <- seq.int(nrow(MITE_CEPE[[j]]))
    MITE_CEPE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_CEPE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_CEPE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_CEPE[[j]]$month <- seq.int(nrow(MITE_CEPE[[j]]))
  MITE_CEPE[[j]]$run <- j
  }
}

###################
# CHSP / MITE
###################
# Read in tree
CHSP <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CHSP:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    CHSP[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CHSP:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(CHSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    CHSP[[j]]$month <- seq.int(nrow(CHSP[[j]]))
    CHSP[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {CHSP[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(CHSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  CHSP[[j]]$month <- seq.int(nrow(CHSP[[j]]))
  CHSP[[j]]$run <- j
  }
}

# And it's liana
MITE_CHSP <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CHSP:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_CHSP[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/CHSP:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_CHSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_CHSP[[j]]$month <- seq.int(nrow(MITE_CHSP[[j]]))
    MITE_CHSP[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_CHSP[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_CHSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_CHSP[[j]]$month <- seq.int(nrow(MITE_CHSP[[j]]))
  MITE_CHSP[[j]]$run <- j
  }
}

###################
# COVI / MITE
###################
# Read in tree
COVI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COVI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    COVI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COVI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(COVI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    COVI[[j]]$month <- seq.int(nrow(COVI[[j]]))
    COVI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {COVI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(COVI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  COVI[[j]]$month <- seq.int(nrow(COVI[[j]]))
  COVI[[j]]$run <- j
  }
}

# And it's liana
MITE_COVI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COVI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_COVI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COVI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_COVI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_COVI[[j]]$month <- seq.int(nrow(MITE_COVI[[j]]))
    MITE_COVI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_COVI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_COVI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_COVI[[j]]$month <- seq.int(nrow(MITE_COVI[[j]]))
  MITE_COVI[[j]]$run <- j
  }
}

###################
# COCO / MITE
###################
# Read in tree
COCO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COCO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    COCO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COCO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(COCO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    COCO[[j]]$month <- seq.int(nrow(COCO[[j]]))
    COCO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {COCO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(COCO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  COCO[[j]]$month <- seq.int(nrow(COCO[[j]]))
  COCO[[j]]$run <- j
  }
}

# And it's liana
MITE_COCO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COCO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_COCO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/COCO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_COCO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_COCO[[j]]$month <- seq.int(nrow(MITE_COCO[[j]]))
    MITE_COCO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_COCO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_COCO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_COCO[[j]]$month <- seq.int(nrow(MITE_COCO[[j]]))
  MITE_COCO[[j]]$run <- j
  }
}

###################
# DARE / MITE
###################
# Read in tree
DARE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DARE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    DARE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DARE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(DARE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    DARE[[j]]$month <- seq.int(nrow(DARE[[j]]))
    DARE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {DARE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(DARE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  DARE[[j]]$month <- seq.int(nrow(DARE[[j]]))
  DARE[[j]]$run <- j
  }
}

# And it's liana
MITE_DARE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DARE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_DARE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DARE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_DARE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_DARE[[j]]$month <- seq.int(nrow(MITE_DARE[[j]]))
    MITE_DARE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_DARE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_DARE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_DARE[[j]]$month <- seq.int(nrow(MITE_DARE[[j]]))
  MITE_DARE[[j]]$run <- j
  }
}

###################
# DINI / MITE
###################
# Read in tree
DINI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DINI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    DINI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DINI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(DINI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    DINI[[j]]$month <- seq.int(nrow(DINI[[j]]))
    DINI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {DINI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(DINI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  DINI[[j]]$month <- seq.int(nrow(DINI[[j]]))
  DINI[[j]]$run <- j
  }
}

# And it's liana
MITE_DINI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DINI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_DINI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/DINI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_DINI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_DINI[[j]]$month <- seq.int(nrow(MITE_DINI[[j]]))
    MITE_DINI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_DINI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_DINI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_DINI[[j]]$month <- seq.int(nrow(MITE_DINI[[j]]))
  MITE_DINI[[j]]$run <- j
  }
}

###################
# GEAM / MITE
###################
# Read in tree
GEAM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GEAM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    GEAM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GEAM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(GEAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    GEAM[[j]]$month <- seq.int(nrow(GEAM[[j]]))
    GEAM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {GEAM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(GEAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  GEAM[[j]]$month <- seq.int(nrow(GEAM[[j]]))
  GEAM[[j]]$run <- j
  }
}

# And it's liana
MITE_GEAM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GEAM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_GEAM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GEAM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_GEAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_GEAM[[j]]$month <- seq.int(nrow(MITE_GEAM[[j]]))
    MITE_GEAM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_GEAM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_GEAM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_GEAM[[j]]$month <- seq.int(nrow(MITE_GEAM[[j]]))
  MITE_GEAM[[j]]$run <- j
  }
}

###################
# GLSE / MITE
###################
# Read in tree
GLSE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GLSE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    GLSE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GLSE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(GLSE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    GLSE[[j]]$month <- seq.int(nrow(GLSE[[j]]))
    GLSE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {GLSE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(GLSE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  GLSE[[j]]$month <- seq.int(nrow(GLSE[[j]]))
  GLSE[[j]]$run <- j
  }
}

# And it's liana
MITE_GLSE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GLSE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_GLSE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GLSE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_GLSE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_GLSE[[j]]$month <- seq.int(nrow(MITE_GLSE[[j]]))
    MITE_GLSE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_GLSE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_GLSE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_GLSE[[j]]$month <- seq.int(nrow(MITE_GLSE[[j]]))
  MITE_GLSE[[j]]$run <- j
  }
}

###################
# GOAE / MITE
###################
# Read in tree
GOAE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GOAE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    GOAE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GOAE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(GOAE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    GOAE[[j]]$month <- seq.int(nrow(GOAE[[j]]))
    GOAE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {GOAE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(GOAE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  GOAE[[j]]$month <- seq.int(nrow(GOAE[[j]]))
  GOAE[[j]]$run <- j
  }
}

# And it's liana
MITE_GOAE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GOAE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_GOAE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GOAE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_GOAE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_GOAE[[j]]$month <- seq.int(nrow(MITE_GOAE[[j]]))
    MITE_GOAE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_GOAE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_GOAE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_GOAE[[j]]$month <- seq.int(nrow(MITE_GOAE[[j]]))
  MITE_GOAE[[j]]$run <- j
  }
}

###################
# GUUL / MITE
###################
# Read in tree
GUUL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUUL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    GUUL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUUL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(GUUL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    GUUL[[j]]$month <- seq.int(nrow(GUUL[[j]]))
    GUUL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {GUUL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(GUUL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  GUUL[[j]]$month <- seq.int(nrow(GUUL[[j]]))
  GUUL[[j]]$run <- j
  }
}

# And it's liana
MITE_GUUL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUUL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_GUUL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUUL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_GUUL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_GUUL[[j]]$month <- seq.int(nrow(MITE_GUUL[[j]]))
    MITE_GUUL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_GUUL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_GUUL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_GUUL[[j]]$month <- seq.int(nrow(MITE_GUUL[[j]]))
  MITE_GUUL[[j]]$run <- j
  }
}

###################
# GUMA / MITE
###################
# Read in tree
GUMA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUMA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    GUMA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUMA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(GUMA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    GUMA[[j]]$month <- seq.int(nrow(GUMA[[j]]))
    GUMA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {GUMA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(GUMA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  GUMA[[j]]$month <- seq.int(nrow(GUMA[[j]]))
  GUMA[[j]]$run <- j
  }
}

# And it's liana
MITE_GUMA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUMA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_GUMA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/GUMA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_GUMA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_GUMA[[j]]$month <- seq.int(nrow(MITE_GUMA[[j]]))
    MITE_GUMA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_GUMA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_GUMA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_GUMA[[j]]$month <- seq.int(nrow(MITE_GUMA[[j]]))
  MITE_GUMA[[j]]$run <- j
  }
}

###################
# HEEX / MITE
###################
# Read in tree
HEEX <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/HEEX:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    HEEX[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/HEEX:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(HEEX[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    HEEX[[j]]$month <- seq.int(nrow(HEEX[[j]]))
    HEEX[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {HEEX[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(HEEX[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  HEEX[[j]]$month <- seq.int(nrow(HEEX[[j]]))
  HEEX[[j]]$run <- j
  }
}

# And it's liana
MITE_HEEX <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/HEEX:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_HEEX[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/HEEX:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_HEEX[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_HEEX[[j]]$month <- seq.int(nrow(MITE_HEEX[[j]]))
    MITE_HEEX[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_HEEX[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_HEEX[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_HEEX[[j]]$month <- seq.int(nrow(MITE_HEEX[[j]]))
  MITE_HEEX[[j]]$run <- j
  }
}

###################
# LIAR / MITE
###################
# Read in tree
LIAR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LIAR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    LIAR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LIAR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(LIAR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    LIAR[[j]]$month <- seq.int(nrow(LIAR[[j]]))
    LIAR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {LIAR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(LIAR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  LIAR[[j]]$month <- seq.int(nrow(LIAR[[j]]))
  LIAR[[j]]$run <- j
  }
}

# And it's liana
MITE_LIAR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LIAR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_LIAR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LIAR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_LIAR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_LIAR[[j]]$month <- seq.int(nrow(MITE_LIAR[[j]]))
    MITE_LIAR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_LIAR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_LIAR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_LIAR[[j]]$month <- seq.int(nrow(MITE_LIAR[[j]]))
  MITE_LIAR[[j]]$run <- j
  }
}

###################
# LOFE / MITE
###################
# Read in tree
LOFE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LOFE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    LOFE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LOFE:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(LOFE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    LOFE[[j]]$month <- seq.int(nrow(LOFE[[j]]))
    LOFE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {LOFE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(LOFE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  LOFE[[j]]$month <- seq.int(nrow(LOFE[[j]]))
  LOFE[[j]]$run <- j
  }
}

# And it's liana
MITE_LOFE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LOFE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_LOFE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LOFE:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_LOFE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_LOFE[[j]]$month <- seq.int(nrow(MITE_LOFE[[j]]))
    MITE_LOFE[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_LOFE[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_LOFE[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_LOFE[[j]]$month <- seq.int(nrow(MITE_LOFE[[j]]))
  MITE_LOFE[[j]]$run <- j
  }
}

###################
# LUCA / MITE
###################
# Read in tree
LUCA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUCA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    LUCA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUCA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(LUCA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    LUCA[[j]]$month <- seq.int(nrow(LUCA[[j]]))
    LUCA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {LUCA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(LUCA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  LUCA[[j]]$month <- seq.int(nrow(LUCA[[j]]))
  LUCA[[j]]$run <- j
  }
}

# And it's liana
MITE_LUCA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUCA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_LUCA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUCA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_LUCA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_LUCA[[j]]$month <- seq.int(nrow(MITE_LUCA[[j]]))
    MITE_LUCA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_LUCA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_LUCA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_LUCA[[j]]$month <- seq.int(nrow(MITE_LUCA[[j]]))
  MITE_LUCA[[j]]$run <- j
  }
}

###################
# LUSP / MITE
###################
# Read in tree
LUSP <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUSP:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    LUSP[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUSP:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(LUSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    LUSP[[j]]$month <- seq.int(nrow(LUSP[[j]]))
    LUSP[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {LUSP[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(LUSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  LUSP[[j]]$month <- seq.int(nrow(LUSP[[j]]))
  LUSP[[j]]$run <- j
  }
}

# And it's liana
MITE_LUSP <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUSP:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_LUSP[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LUSP:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_LUSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_LUSP[[j]]$month <- seq.int(nrow(MITE_LUSP[[j]]))
    MITE_LUSP[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_LUSP[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_LUSP[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_LUSP[[j]]$month <- seq.int(nrow(MITE_LUSP[[j]]))
  MITE_LUSP[[j]]$run <- j
  }
}

###################
# LYDI / MITE
###################
# Read in tree
LYDI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LYDI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    LYDI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LYDI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(LYDI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    LYDI[[j]]$month <- seq.int(nrow(LYDI[[j]]))
    LYDI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {LYDI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(LYDI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  LYDI[[j]]$month <- seq.int(nrow(LYDI[[j]]))
  LYDI[[j]]$run <- j
  }
}

# And it's liana
MITE_LYDI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LYDI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_LYDI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/LYDI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_LYDI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_LYDI[[j]]$month <- seq.int(nrow(MITE_LYDI[[j]]))
    MITE_LYDI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_LYDI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_LYDI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_LYDI[[j]]$month <- seq.int(nrow(MITE_LYDI[[j]]))
  MITE_LYDI[[j]]$run <- j
  }
}

###################
# MATI / MITE
###################
# Read in tree
MATI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MATI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    MATI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MATI:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(MATI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MATI[[j]]$month <- seq.int(nrow(MATI[[j]]))
    MATI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MATI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MATI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MATI[[j]]$month <- seq.int(nrow(MATI[[j]]))
  MATI[[j]]$run <- j
  }
}

# And it's liana
MITE_MATI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MATI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_MATI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MATI:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_MATI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_MATI[[j]]$month <- seq.int(nrow(MITE_MATI[[j]]))
    MITE_MATI[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_MATI[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_MATI[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_MATI[[j]]$month <- seq.int(nrow(MITE_MATI[[j]]))
  MITE_MATI[[j]]$run <- j
  }
}

###################
# MACH / MITE
###################
# Read in tree
MACH <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MACH:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    MACH[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MACH:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(MACH[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MACH[[j]]$month <- seq.int(nrow(MACH[[j]]))
    MACH[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MACH[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MACH[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MACH[[j]]$month <- seq.int(nrow(MACH[[j]]))
  MACH[[j]]$run <- j
  }
}

# And it's liana
MITE_MACH <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MACH:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_MACH[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/MACH:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_MACH[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_MACH[[j]]$month <- seq.int(nrow(MITE_MACH[[j]]))
    MITE_MACH[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_MACH[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_MACH[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_MACH[[j]]$month <- seq.int(nrow(MITE_MACH[[j]]))
  MITE_MACH[[j]]$run <- j
  }
}

###################
# PICA / MITE
###################
# Read in tree
PICA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PICA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    PICA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PICA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(PICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    PICA[[j]]$month <- seq.int(nrow(PICA[[j]]))
    PICA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {PICA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(PICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  PICA[[j]]$month <- seq.int(nrow(PICA[[j]]))
  PICA[[j]]$run <- j
  }
}

# And it's liana
MITE_PICA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PICA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_PICA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PICA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_PICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_PICA[[j]]$month <- seq.int(nrow(MITE_PICA[[j]]))
    MITE_PICA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_PICA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_PICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_PICA[[j]]$month <- seq.int(nrow(MITE_PICA[[j]]))
  MITE_PICA[[j]]$run <- j
  }
}

###################
# PIDU / MITE
###################
# Read in tree
PIDU <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PIDU:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    PIDU[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PIDU:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(PIDU[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    PIDU[[j]]$month <- seq.int(nrow(PIDU[[j]]))
    PIDU[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {PIDU[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(PIDU[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  PIDU[[j]]$month <- seq.int(nrow(PIDU[[j]]))
  PIDU[[j]]$run <- j
  }
}

# And it's liana
MITE_PIDU <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PIDU:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_PIDU[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/PIDU:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_PIDU[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_PIDU[[j]]$month <- seq.int(nrow(MITE_PIDU[[j]]))
    MITE_PIDU[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_PIDU[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_PIDU[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_PIDU[[j]]$month <- seq.int(nrow(MITE_PIDU[[j]]))
  MITE_PIDU[[j]]$run <- j
  }
}

###################
# RHTR / MITE
###################
# Read in tree
RHTR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/RHTR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    RHTR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/RHTR:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(RHTR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    RHTR[[j]]$month <- seq.int(nrow(RHTR[[j]]))
    RHTR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {RHTR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(RHTR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  RHTR[[j]]$month <- seq.int(nrow(RHTR[[j]]))
  RHTR[[j]]$run <- j
  }
}

# And it's liana
MITE_RHTR <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/RHTR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_RHTR[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/RHTR:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_RHTR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_RHTR[[j]]$month <- seq.int(nrow(MITE_RHTR[[j]]))
    MITE_RHTR[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_RHTR[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_RHTR[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_RHTR[[j]]$month <- seq.int(nrow(MITE_RHTR[[j]]))
  MITE_RHTR[[j]]$run <- j
  }
}

###################
# SAPA / MITE
###################
# Read in tree
SAPA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SAPA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    SAPA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SAPA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(SAPA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    SAPA[[j]]$month <- seq.int(nrow(SAPA[[j]]))
    SAPA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {SAPA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(SAPA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  SAPA[[j]]$month <- seq.int(nrow(SAPA[[j]]))
  SAPA[[j]]$run <- j
  }
}

# And it's liana
MITE_SAPA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SAPA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_SAPA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SAPA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_SAPA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_SAPA[[j]]$month <- seq.int(nrow(MITE_SAPA[[j]]))
    MITE_SAPA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_SAPA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_SAPA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_SAPA[[j]]$month <- seq.int(nrow(MITE_SAPA[[j]]))
  MITE_SAPA[[j]]$run <- j
  }
}

###################
# SICA / MITE
###################
# Read in tree
SICA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SICA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    SICA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SICA:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(SICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    SICA[[j]]$month <- seq.int(nrow(SICA[[j]]))
    SICA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {SICA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(SICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  SICA[[j]]$month <- seq.int(nrow(SICA[[j]]))
  SICA[[j]]$run <- j
  }
}

# And it's liana
MITE_SICA <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SICA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_SICA[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SICA:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_SICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_SICA[[j]]$month <- seq.int(nrow(MITE_SICA[[j]]))
    MITE_SICA[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_SICA[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_SICA[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_SICA[[j]]$month <- seq.int(nrow(MITE_SICA[[j]]))
  MITE_SICA[[j]]$run <- j
  }
}

###################
# SIGL / MITE
###################
# Read in tree
SIGL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SIGL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    SIGL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SIGL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(SIGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    SIGL[[j]]$month <- seq.int(nrow(SIGL[[j]]))
    SIGL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {SIGL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(SIGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  SIGL[[j]]$month <- seq.int(nrow(SIGL[[j]]))
  SIGL[[j]]$run <- j
  }
}

# And it's liana
MITE_SIGL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SIGL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_SIGL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SIGL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_SIGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_SIGL[[j]]$month <- seq.int(nrow(MITE_SIGL[[j]]))
    MITE_SIGL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_SIGL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_SIGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_SIGL[[j]]$month <- seq.int(nrow(MITE_SIGL[[j]]))
  MITE_SIGL[[j]]$run <- j
  }
}

###################
# SPMO / MITE
###################
# Read in tree
SPMO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SPMO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    SPMO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SPMO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(SPMO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    SPMO[[j]]$month <- seq.int(nrow(SPMO[[j]]))
    SPMO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {SPMO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(SPMO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  SPMO[[j]]$month <- seq.int(nrow(SPMO[[j]]))
  SPMO[[j]]$run <- j
  }
}

# And it's liana
MITE_SPMO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SPMO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_SPMO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/SPMO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_SPMO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_SPMO[[j]]$month <- seq.int(nrow(MITE_SPMO[[j]]))
    MITE_SPMO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_SPMO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_SPMO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_SPMO[[j]]$month <- seq.int(nrow(MITE_SPMO[[j]]))
  MITE_SPMO[[j]]$run <- j
  }
}

###################
# TAIM / MITE
###################
# Read in tree
TAIM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAIM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    TAIM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAIM:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(TAIM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    TAIM[[j]]$month <- seq.int(nrow(TAIM[[j]]))
    TAIM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {TAIM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(TAIM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  TAIM[[j]]$month <- seq.int(nrow(TAIM[[j]]))
  TAIM[[j]]$run <- j
  }
}

# And it's liana
MITE_TAIM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAIM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_TAIM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAIM:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_TAIM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_TAIM[[j]]$month <- seq.int(nrow(MITE_TAIM[[j]]))
    MITE_TAIM[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_TAIM[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_TAIM[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_TAIM[[j]]$month <- seq.int(nrow(MITE_TAIM[[j]]))
  MITE_TAIM[[j]]$run <- j
  }
}

###################
# TAOC / MITE
###################
# Read in tree
TAOC <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAOC:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    TAOC[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAOC:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(TAOC[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    TAOC[[j]]$month <- seq.int(nrow(TAOC[[j]]))
    TAOC[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {TAOC[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(TAOC[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  TAOC[[j]]$month <- seq.int(nrow(TAOC[[j]]))
  TAOC[[j]]$run <- j
  }
}

# And it's liana
MITE_TAOC <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAOC:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_TAOC[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TAOC:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_TAOC[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_TAOC[[j]]$month <- seq.int(nrow(MITE_TAOC[[j]]))
    MITE_TAOC[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_TAOC[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_TAOC[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_TAOC[[j]]$month <- seq.int(nrow(MITE_TAOC[[j]]))
  MITE_TAOC[[j]]$run <- j
  }
}

###################
# TARO / MITE
###################
# Read in tree
TARO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TARO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    TARO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TARO:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(TARO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    TARO[[j]]$month <- seq.int(nrow(TARO[[j]]))
    TARO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {TARO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(TARO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  TARO[[j]]$month <- seq.int(nrow(TARO[[j]]))
  TARO[[j]]$run <- j
  }
}

# And it's liana
MITE_TARO <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TARO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_TARO[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TARO:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_TARO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_TARO[[j]]$month <- seq.int(nrow(MITE_TARO[[j]]))
    MITE_TARO[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_TARO[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_TARO[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_TARO[[j]]$month <- seq.int(nrow(MITE_TARO[[j]]))
  MITE_TARO[[j]]$run <- j
  }
}

###################
# THOV / MITE
###################
# Read in tree
THOV <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/THOV:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    THOV[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/THOV:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(THOV[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    THOV[[j]]$month <- seq.int(nrow(THOV[[j]]))
    THOV[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {THOV[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(THOV[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  THOV[[j]]$month <- seq.int(nrow(THOV[[j]]))
  THOV[[j]]$run <- j
  }
}

# And it's liana
MITE_THOV <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/THOV:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_THOV[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/THOV:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_THOV[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_THOV[[j]]$month <- seq.int(nrow(MITE_THOV[[j]]))
    MITE_THOV[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_THOV[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_THOV[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_THOV[[j]]$month <- seq.int(nrow(MITE_THOV[[j]]))
  MITE_THOV[[j]]$run <- j
  }
}

###################
# TRGL / MITE
###################
# Read in tree
TRGL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TRGL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    TRGL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TRGL:MITE_npp_neg_on//ens_",j,"_0_tree_from_data.txt"), 
                          header = FALSE)
    # creating add columns
    colnames(TRGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    TRGL[[j]]$month <- seq.int(nrow(TRGL[[j]]))
    TRGL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {TRGL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(TRGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  TRGL[[j]]$month <- seq.int(nrow(TRGL[[j]]))
  TRGL[[j]]$run <- j
  }
}

# And it's liana
MITE_TRGL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TRGL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"))>0)
  {
    # import each run
    MITE_TRGL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/NoMort/TRGL:MITE_npp_neg_on//ens_",j,"_0_liana_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(MITE_TRGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    MITE_TRGL[[j]]$month <- seq.int(nrow(MITE_TRGL[[j]]))
    MITE_TRGL[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {MITE_TRGL[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(MITE_TRGL[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  MITE_TRGL[[j]]$month <- seq.int(nrow(MITE_TRGL[[j]]))
  MITE_TRGL[[j]]$run <- j
  }
}

###########################################
# Create df of months survived by species #
###########################################

df <- matrix(ncol = 38, nrow = num_ens)

for (k in 1:num_ens) {
  df[k,1] <- length(ALAM[[k]]$month)
  df[k,2] <- length(ANRE[[k]]$month)
  df[k,3] <- length(BRAL[[k]]$month)
  df[k,4] <- length(BUSI[[k]]$month)
  df[k,5] <- length(BYCR[[k]]$month)
  df[k,6] <- length(CAER[[k]]$month)
  df[k,7] <- length(CACA[[k]]$month)
  df[k,8] <- length(CEPE[[k]]$month)
  df[k,9] <- length(CHSP[[k]]$month)
  df[k,10] <- length(COVI[[k]]$month)
  df[k,11] <- length(COCO[[k]]$month)
  df[k,12] <- length(DARE[[k]]$month)
  df[k,13] <- length(DINI[[k]]$month)
  df[k,14] <- length(GEAM[[k]]$month)
  df[k,15] <- length(GLSE[[k]]$month)
  df[k,16] <- length(GOAE[[k]]$month)
  df[k,17] <- length(GUUL[[k]]$month)
  df[k,18] <- length(GUMA[[k]]$month)
  df[k,19] <- length(HEEX[[k]]$month)
  df[k,20] <- length(LIAR[[k]]$month)
  df[k,21] <- length(LOFE[[k]]$month)
  df[k,22] <- length(LUCA[[k]]$month)
  df[k,23] <- length(LUSP[[k]]$month)
  df[k,24] <- length(LYDI[[k]]$month)
  df[k,25] <- length(MATI[[k]]$month)
  df[k,26] <- length(MACH[[k]]$month)
  df[k,27] <- length(PICA[[k]]$month)
  df[k,28] <- length(PIDU[[k]]$month)
  df[k,29] <- length(RHTR[[k]]$month)
  df[k,30] <- length(SAPA[[k]]$month)
  df[k,31] <- length(SICA[[k]]$month)
  df[k,32] <- length(SIGL[[k]]$month)
  df[k,33] <- length(SPMO[[k]]$month)
  df[k,34] <- length(TAIM[[k]]$month)
  df[k,35] <- length(TAOC[[k]]$month)
  df[k,36] <- length(TARO[[k]]$month)
  df[k,37] <- length(THOV[[k]]$month)
  df[k,38] <- length(TRGL[[k]]$month)
}
df <- data.frame(df)
names(df) <- species_info[1:38,1]

death_rate <- c()
for (k in 1:38) {
  death_rate[k] <- (500-tail(table(df[,k]),1))/5
}

fg <- species_info[c(1:38),]
fg <- subset(fg, select = -c(dmax,tmax,Fregdistgr,g1,s_liana))
fg$death_rate <- death_rate
fg <- data.frame(fg)

###########
# PLOT IT #
###########
# nls model
df2 <- data.frame(x = fg$death_rate, y = fg$LMA)
m <- nls(y ~ I(a*exp(-b*x)+c), data = df2, start = list(a=max(df2$y), b=1, c=0))

ggplot(data = fg)+
  geom_point(aes(x = death_rate, y = LMA, color = sp), size = 4)+
  geom_line(aes(x = death_rate, y = fitted(m)))+
  theme_classic()+ xlab("% dead in < 10 years")






