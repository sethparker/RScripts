###############
## FROM_DATA ##
###############

# Load Packages
library('splines')
library('ggplot2')
library('fitdistrplus')
library('cowplot')
library('tidyr')
library('dplyr')
library('reshape2')

# Model parameters
num_sp <- 46  # Enter the number of species modeled
num_steps <- 120 # Enter the number of months modeled
num_ens <- 50 # Enter the number of runs in the ensemble

# Sensitivity analysis values
vox_LA_max <- c(0.8,1.17,1.53,1.9,2.27,2.63,3)
shed_median <- c(0.007,0.014,0.021,0.028,0.035,0.042,0.05)
knock_median <- c(0.007,0.014,0.021,0.028,0.035,0.042,0.05)

# Ensemble analysis values
multipliers <- runif(500, min = 0.8, max = 3) # Vox_LA_max
multipliers <- cbind(multipliers,runif(500, min = 0.007, max = 0.05)) # shed_median
multipliers <- cbind(multipliers,runif(500, min = 0.007, max = 0.05)) # knock_median
write.csv(multipliers,"multipliers.csv")

sd <- c("sd1","sd2","sd3","sd4","sd5","sd6","sd7")

# # # # # # # # # # # # # # # # #
#   ########################    #
#   # Sensitivity Analysis #    #
#   ########################    #
# # # # # # # # # # # # # # # # #
##################
### VOX LA MAX ###
##################
# Read in tree for sensitivity analysis
tree <- list()
for (j in 1:7) {
  tree[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/vox_LA_max/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/vox_LA_max/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  tree[[j]] <- bind_rows(tree[[j]])
  tree[[j]] <- tree[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  tree[[j]]$scenario <- LETTERS[j]
}

# Read in liana for sensitivity analysis
liana <- list()
for (j in 1:7) {
  liana[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/vox_LA_max/top_down_sum_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/vox_LA_max/top_down_sum_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  liana[[j]] <- bind_rows(liana[[j]])
  liana[[j]] <- liana[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  liana[[j]]$scenario <- LETTERS[j]
}

# Timeseries of LA
A_tree <- as.data.frame(tree[[1]])
A_liana <- as.data.frame(liana[[1]])
SD1 <- ggplot()+
  geom_line(data = A_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = A_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = A_tree$LA+A_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 0.8m^2")+
  theme_classic()+ ylim(0,85)
B_tree <- as.data.frame(tree[[2]])
B_liana <- as.data.frame(liana[[2]])
SD2 <- ggplot()+
  geom_line(data = B_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = B_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = B_tree$LA+B_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 1.17m^2")+
  theme_classic()+ ylim(0,85)
C_tree <- as.data.frame(tree[[3]])
C_liana <- as.data.frame(liana[[3]])
SD3 <- ggplot()+
  geom_line(data = C_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = C_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = C_tree$LA+C_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 1.53m^2")+
  theme_classic()+ ylim(0,85)
D_tree <- as.data.frame(tree[[4]])
D_liana <- as.data.frame(liana[[4]])
SD4 <- ggplot()+
  geom_line(data = D_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = D_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = D_tree$LA+D_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 1.9m^2")+
  theme_classic()+ ylim(0,85)
E_tree <- as.data.frame(tree[[5]])
E_liana <- as.data.frame(liana[[5]])
SD5 <- ggplot()+
  geom_line(data = E_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = E_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = E_tree$LA+E_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 2.27m^2")+
  theme_classic()+ ylim(0,85)
F_tree <- as.data.frame(tree[[6]])
F_liana <- as.data.frame(liana[[6]])
SD6 <- ggplot()+
  geom_line(data = F_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = F_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = F_tree$LA+F_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 2.63m^2")+
  theme_classic()+ ylim(0,85)
G_tree <- as.data.frame(tree[[7]])
G_liana <- as.data.frame(liana[[7]])
SD7 <- ggplot()+
  geom_line(data = G_tree, aes(x = month, y = LA, color = "tree LA"), size = 1)+
  geom_line(data = G_liana, aes(x = month, y = LA, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = G_tree$LA+G_liana$LA, color = "total LA"), size = 1)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+
  ggtitle("Maximum voxel LAD 3m^2")+
  theme_classic()+ ylim(0,85)


Fig1 <- plot_grid(SD1,SD2,SD3,SD4,SD5,SD6,SD7,
          labels = c("A","B","C","D","E","F","G","H"),
          ncol = 4, nrow = 2)
title <- ggdraw() + 
  draw_label(
    "Top-down growth strategy, Individual max LA scheme",
    fontface = 'bold',
    x = 0,
    hjust = 0)
Fig1 <- plot_grid(title, Fig1, ncol = 1, rel_heights = c(0.1, 1))
rm(A_tree,A_liana,B_tree,B_liana,C_tree,C_liana,D_tree,D_liana,E_tree,E_liana,F_tree,F_liana,G_tree,G_liana)

############
## Leaf Area vox_la_max spline
# Tree
LA_t_final <- c(tail(tree[[1]]$LA_mu,1),tail(tree[[2]]$LA_mu,1),tail(tree[[3]]$LA_mu,1),
                tail(tree[[4]]$LA_mu,1),tail(tree[[5]]$LA_mu,1),tail(tree[[6]]$LA_mu,1),
                tail(tree[[7]]$LA_mu,1))
LA_t_spline <- data.frame(spline(x = vox_LA_max, y = LA_t_final, method = "natural"))
LA_t_vox_LA <- data.frame(LA_t_final,vox_LA_max)

VLA_tree <- ggplot(data = LA_t_vox_LA) + 
  geom_point(mapping = aes(x = vox_LA_max, y = LA_t_final)) + 
  geom_line(data = LA_t_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Maximum voxel LAD [m^2/m^3]") + ylab("Tree LA [m^2]")

# Liana
LA_l_final <- c(tail(liana[[1]]$LA_mu,1),tail(liana[[2]]$LA_mu,1),tail(liana[[3]]$LA_mu,1),
                tail(liana[[4]]$LA_mu,1),tail(liana[[5]]$LA_mu,1),tail(liana[[6]]$LA_mu,1),
                tail(liana[[7]]$LA_mu,1))
LA_l_spline <- data.frame(spline(x = vox_LA_max, y = LA_l_final, method = "natural"))
LA_l_vox_LA <- data.frame(LA_l_final,vox_LA_max)

VLA_liana <- ggplot(data = LA_l_vox_LA) + 
  geom_point(mapping = aes(x = vox_LA_max, y = LA_l_final)) + 
  geom_line(data = LA_l_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Maximum voxel LAD [m^2/m^3]") + ylab("Liana LA [m^2]")

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), vox_LA_max = vox_LA_max)
LA_spline <- data.frame(spline(x = vox_LA_max, y = LA_final$LA_final, method = "natural"))

VLA_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = vox_LA_max, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Maximum voxel LAD [m^2/m^3]") + ylab("Total LA [m^2]")

# Compile figures
VLA <- plot_grid(VLA_tree + theme(axis.title.x = element_blank(),
                                  axis.text.x = element_blank()),
                 VLA_liana + theme(axis.title.x = element_blank(),
                                   axis.text.x = element_blank()),
                 VLA_total, ncol = 1, nrow = 3)

### Save variables for lollipop
cv_vox_la_max <- sd(LA_final$LA_final)/mean(LA_final$LA_final)
f <- splinefun(x = vox_LA_max, y = LA_final$LA_final, method = "natural")
elasticity_vox_la_max <- f(vox_LA_max, deriv = 1)[4]*(vox_LA_max[4]/LA_final$LA_final[4])
#sd_exp_vox_la_max <- 

################################
## Examine statistic Strength ##
################################
# Tree
plot(x = tree[[1]]$month, y = tree[[1]]$GPP_n, type = "l", col = "red", 
     xlab = "Month", ylab = "# of Surviving Realizations", ylim = c(0,50),
     main = "Strength of Statistics: Tree\nTop-Down, Sum LA Scheme", lwd = 2)
lines(x = tree[[2]]$month, y = tree[[2]]$GPP_n, pch = 1 , col = "blue", lwd = 2)
lines(x = tree[[3]]$month, y = tree[[3]]$GPP_n, pch = 2 , col = "green", lwd = 2)
lines(x = tree[[4]]$month, y = tree[[4]]$GPP_n, pch = 3 , col = "black", lwd = 2)
lines(x = tree[[5]]$month, y = tree[[5]]$GPP_n, pch = 4 , col = "purple", lwd = 2)
lines(x = tree[[6]]$month, y = tree[[6]]$GPP_n, pch = 5 , col = "coral", lwd = 2)
lines(x = tree[[7]]$month, y = tree[[7]]$GPP_n, pch = 6 , col = "goldenrod", lwd = 2)
legend(legend = c("-3 SD", "-2 SD", "-1 SD", "Vox_LA_max median", "+1 SD", "+2 SD", "+3 SD"),
       col = c("red","blue","green","black","purple","coral","goldenrod"), "bottomleft",
       lty = 1, lwd = 2)

# Liana
plot(x = liana[[1]]$month, y = liana[[1]]$GPP_len, type = "l", col = "red", 
     xlab = "Month", ylab = "# of Surviving Realizations", ylim = c(0,50),
     main = "Strength of Statistics: Liana\nTop-Down, Sum LA Scheme", lwd = 2)
lines(x = liana[[2]]$month, y = liana[[2]]$GPP_n, pch = 1 , col = "blue", lwd = 2)
lines(x = liana[[3]]$month, y = liana[[3]]$GPP_n, pch = 2 , col = "green", lwd = 2)
lines(x = liana[[4]]$month, y = liana[[4]]$GPP_n, pch = 3 , col = "black", lwd = 2)
lines(x = liana[[5]]$month, y = liana[[5]]$GPP_n, pch = 4 , col = "purple", lwd = 2)
lines(x = liana[[6]]$month, y = liana[[6]]$GPP_n, pch = 5 , col = "coral", lwd = 2)
lines(x = liana[[7]]$month, y = liana[[7]]$GPP_n, pch = 6 , col = "goldenrod", lwd = 2)
legend(legend = c("-3 SD", "-2 SD", "-1 SD", "Vox_LA_max median", "+1 SD", "+2 SD", "+3 SD"),
       col = c("red","blue","green","black","purple","coral","goldenrod"), "bottomleft",
       lty = 1, lwd = 2)


###################
### SHED_MEDIAN ###
###################
tree <- list()
for (j in 1:7) {
  tree[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/shed_median/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/shed_median/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  tree[[j]] <- bind_rows(tree[[j]])
  tree[[j]] <- tree[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  tree[[j]]$scenario <- LETTERS[j]
}

# Read in liana for sensitivity analysis
liana <- list()
for (j in 1:7) {
  liana[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/shed_median/top_down_sum_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/shed_median/top_down_sum_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  liana[[j]] <- bind_rows(liana[[j]])
  liana[[j]] <- liana[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  liana[[j]]$scenario <- LETTERS[j]
}

############
## Leaf Area shed_median spline
# Tree
LA_t_final <- c(tail(tree[[1]]$LA,1),tail(tree[[2]]$LA,1),tail(tree[[3]]$LA,1),
                tail(tree[[4]]$LA,1),tail(tree[[5]]$LA,1),tail(tree[[6]]$LA,1),
                tail(tree[[7]]$LA,1))
LA_t_spline <- data.frame(spline(x = shed_median, y = LA_t_final, method = "natural"))
LA_t_shed_LA <- data.frame(LA_t_final,shed_median)

Sh_tree <- ggplot(data = LA_t_shed_LA) + 
  geom_point(mapping = aes(x = shed_median, y = LA_t_final)) + 
  geom_line(data = LA_t_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution shed median") + ylab("Tree LA [m^2]")

# Liana
LA_l_final <- c(tail(liana[[1]]$LA,1),tail(liana[[2]]$LA,1),tail(liana[[3]]$LA,1),
                tail(liana[[4]]$LA,1),tail(liana[[5]]$LA,1),tail(liana[[6]]$LA,1),
                tail(liana[[7]]$LA,1))
LA_l_spline <- data.frame(spline(x = shed_median, y = LA_l_final, method = "natural"))
LA_l_shed_LA <- data.frame(LA_l_final,shed_median)

Sh_liana <- ggplot(data = LA_l_shed_LA) + 
  geom_point(mapping = aes(x = shed_median, y = LA_l_final)) + 
  geom_line(data = LA_l_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution shed median") + ylab("Liana LA [m^2]")

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), shed_median = shed_median)
LA_spline <- data.frame(spline(x = shed_median, y = LA_final$LA_final, method = "natural"))

Sh_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = shed_median, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution shed median") + ylab("Total LA [m^2]")

# Compile figures
Sh <- plot_grid(Sh_tree + theme(axis.title.y = element_blank(),
                                axis.title.x = element_blank(),
                                axis.text.x = element_blank()),
                 Sh_liana + theme(axis.title.y = element_blank(),
                                  axis.title.x = element_blank(),
                                  axis.text.x = element_blank()),
                 Sh_total + theme(axis.title.y = element_blank()),
                 ncol = 1, nrow = 3)

### Save variables for lollipop
cv_shed_median <- sd(LA_final$LA_final)/mean(LA_final$LA_final)
f <- splinefun(x = shed_median, y = LA_final$LA_final, method = "natural")
elasticity_shed_median <- f(shed_median, deriv = 1)[4]*(shed_median[4]/LA_final$LA_final[4])
#sd_exp_vox_la_max <- 

####################
### KNOCK_MEDIAN ###
####################
tree <- list()
for (j in 1:7) {
  tree[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/knock_median/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/knock_median/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  tree[[j]] <- bind_rows(tree[[j]])
  tree[[j]] <- tree[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  tree[[j]]$scenario <- LETTERS[j]
}

# Read in liana for sensitivity analysis
liana <- list()
for (j in 1:7) {
  liana[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/knock_median/top_down_sum_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/knock_median/top_down_sum_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
                    header = FALSE)
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
    # generate matrix of 0s for blank files
    else
    {
      r <- data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
  liana[[j]] <- bind_rows(liana[[j]])
  liana[[j]] <- liana[[j]] %>% group_by(month) %>% summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), list(mu = ~ mean(.), sigma = ~ sd(.), n = ~ length(.))))
  liana[[j]]$scenario <- LETTERS[j]
}

############
## Leaf Area knock_median spline
# Tree
LA_t_final <- c(tail(tree[[1]]$LA,1),tail(tree[[2]]$LA,1),tail(tree[[3]]$LA,1),
                tail(tree[[4]]$LA,1),tail(tree[[5]]$LA,1),tail(tree[[6]]$LA,1),
                tail(tree[[7]]$LA,1))
LA_t_spline <- data.frame(spline(x = knock_median, y = LA_t_final, method = "natural"))
LA_t_knock_LA <- data.frame(LA_t_final,knock_median)

K_tree <- ggplot(data = LA_t_knock_LA) + 
  geom_point(mapping = aes(x = knock_median, y = LA_t_final)) + 
  geom_line(data = LA_t_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution knock median") + ylab("Tree LA [m^2]")

# Liana
LA_l_final <- c(tail(liana[[1]]$LA,1),tail(liana[[2]]$LA,1),tail(liana[[3]]$LA,1),
                tail(liana[[4]]$LA,1),tail(liana[[5]]$LA,1),tail(liana[[6]]$LA,1),
                tail(liana[[7]]$LA,1))
LA_l_spline <- data.frame(spline(x = knock_median, y = LA_l_final, method = "natural"))
LA_l_knock_LA <- data.frame(LA_l_final,knock_median)

K_liana <- ggplot(data = LA_l_knock_LA) + 
  geom_point(mapping = aes(x = knock_median, y = LA_l_final)) + 
  geom_line(data = LA_l_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution knock median") + ylab("Liana LA [m^2]")

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), knock_median = knock_median)
LA_spline <- data.frame(spline(x = knock_median, y = LA_final$LA_final, method = "natural"))

K_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = knock_median, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic()+ xlab("Kumaraswamy distribution knock median") + ylab("Total LA [m^2]")

# Compile figures
K <- plot_grid(K_tree + theme(axis.title.y = element_blank(),
                              axis.title.x = element_blank(),
                              axis.text.x = element_blank()),
                 K_liana + theme(axis.title.y = element_blank(),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_blank()),
                 K_total + theme(axis.title.y = element_blank()),
                 ncol = 1, nrow = 3)

### Save variables for lollipop
cv_knock_median <- sd(LA_final$LA_final)/mean(LA_final$LA_final)
f <- splinefun(x = knock_median, y = LA_final$LA_final, method = "natural")
elasticity_knock_median <- f(knock_median, deriv = 1)[4]*(knock_median[4]/LA_final$LA_final[4])
#sd_exp_vox_la_max <- 

# # # # # # # # # # # # # #
# SENSITIVITY SPLINE GRID #
# # # # # # # # # # # # # #
Fig6 <- plot_grid(ncol = 3, nrow = 1, VLA, Sh, K,
                  labels = c("Maximum Voxel LAD", "Shed Median", "Knock Median"))

# # # # # # # # # # # # #
# SENSITIVITY LOLLIPOP  #
# # # # # # # # # # # # #
# Lollipop chart
lollipop_cv <- data.frame(x = c("Maximum Voxel LAD", "Shed Median", "Knock Median"), 
                          y = c(cv_vox_la_max*100, cv_shed_median*100, cv_knock_median*100))
lollipop_elasticity <- data.frame(x = c("Maximum Voxel LAD", "Shed Median", "Knock Median"), 
                          y = c(elasticity_vox_la_max, elasticity_shed_median, 
                                elasticity_knock_median))
#lollipop_sd_exp <- 

CV <- ggplot(data = lollipop_cv, aes(x=x, y=y)) +
      geom_segment( aes(x=x, xend=x, y=0, yend=y), color="black", size = 2) +
      geom_point( color="black", size=4) +
      geom_hline(yintercept = 0)+
      theme_light() +
      coord_flip() +
      ylab("CV (%)")+
      xlab("Parameter")+
      background_grid(major = 'none', minor = "none")+
      theme(
        panel.grid.major.y = element_blank(),
        panel.border = element_blank(),
        axis.line.x = element_line(),
        panel.grid.minor.x = element_blank()
      )
Elasticity <- ggplot(data = lollipop_elasticity, aes(x=x, y=y)) +
  geom_segment( aes(x=x, xend=x, y=0, yend=y), color="black", size = 2) +
  geom_point( color="black", size=4) +
  geom_hline(yintercept = 0)+
  theme_light() +
  coord_flip() +
  ylab("Elasticity")+
  xlab("")+
  background_grid(major = 'none', minor = "none")+
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.line.x = element_line(),
    panel.grid.minor.x = element_blank()
  )

Fig5 <- plot_grid(CV,Elasticity + theme(axis.text.y = element_blank(),
                                        axis.ticks.y = element_blank(),
                                        axis.title.y = element_blank()),
                  labels = c("a","b"),
                  ncol = 2, nrow = 1)
title <- ggdraw() + 
  draw_label(
    "Partitioning of variance by parameter",
    fontface = 'bold',
    x = 0,
    hjust = 0)
Fig5 <- plot_grid(title, Fig5, ncol = 1, rel_heights = c(0.1, 1))



# # # # # # # # # # # # # # #
#   #####################   #
#   # Ensemble Analysis #   #
#   #####################   #
# # # # # # # # # # # # # # #
# Input number of runs in ensemble
num_ens <- 500
# Read in tree for ensemble analysis
ens_tree <- list()
for (j in 1:num_ens) {
  # inport each run
  ens_tree[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/ensemble/ens_",j,"_0_tree_from_data.txt"), 
                            header = FALSE)
    # creating add columns
    colnames(ens_tree[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    ens_tree[[j]]$month <- seq.int(nrow(ens_tree[[j]]))
    ens_tree[[j]]$run <- j
}
# Read in liana for ensemble analysis
ens_liana <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/ensemble/ens_",j,"_0_liana_from_data.txt"))>0)
  {
  # import each run
  ens_liana[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/ensemble/ens_",j,"_0_liana_from_data.txt"), 
                            header = FALSE)
  # creating add columns
  colnames(ens_liana[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ens_liana[[j]]$month <- seq.int(nrow(ens_liana[[j]]))
  ens_liana[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {ens_liana[[j]] <-  data.frame(matrix(data = 0, nrow = num_steps, ncol = 6))
  colnames(ens_liana[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ens_liana[[j]]$month <- seq.int(nrow(ens_liana[[j]]))
  ens_liana[[j]]$run <- j
  }
}

# LA histograms
# Tree
hist(sapply(ens_tree, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "Tree final timestep LA",
     breaks = "FD")
# Liana
hist(sapply(ens_liana, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "Liana final timestep LA",
     breaks = "FD")
# Total
hist(sapply(ens_tree, function(x) tail(x$LA,1))+
       sapply(ens_liana, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "Couplet final timestep LA",
     breaks = "FD")



