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
library('plotrix')

# Model parameters
num_sp <- 47  # Enter the number of species modeled
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
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/vox_la_max/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/vox_la_max/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
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
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/vox_LA_max/top_down_sum_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/vox_LA_max/top_down_sum_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
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
  theme_classic(base_size = 22)+ xlab(bquote("Maximum voxel LAD ["*~m^2~"/"~m^3*"]")) + ylab(bquote("Tree LA ["*~m^2*"]"))

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
  theme_classic(base_size = 22)+ xlab("Maximum voxel LAD [m^2/m^3]") + ylab(bquote("Liana LA ["*~m^2*"]"))

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), vox_LA_max = vox_LA_max)
LA_spline <- data.frame(spline(x = vox_LA_max, y = LA_final$LA_final, method = "natural"))

VLA_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = vox_LA_max, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab(bquote("Maximum voxel LAD ["*~m^2~'/'~m^3*"]")) + ylab(bquote("Total LA ["*~m^2*"]"))

# Compile figures
VLA <- plot_grid(VLA_tree + theme(axis.title.x = element_blank(),
                                  axis.text.x = element_blank()),
                 VLA_liana + theme(axis.title.x = element_blank(),
                                   axis.text.x = element_blank()),
                 VLA_total, ncol = 1, nrow = 3)

### Save variables for lollipop
cv_vox_la_max <- sqrt(var(LA_final$LA_final))/median(LA_final$LA_final)
f <- splinefun(x = vox_LA_max, y = LA_final$LA_final, method = "natural")
elasticity_vox_la_max <- f(vox_LA_max, deriv = 1)[4]*(vox_LA_max[4]/LA_final$LA_final[4])
variances <- data.frame(vox_la_max = c(var(LA_spline$y)))

################################
## Examine statistic Strength ##
################################
# Tree
plot(x = tree[[1]]$month, y = tree[[1]]$GPP_n, type = "l", col = "red", 
     xlab = "Month", ylab = "# of Surviving Realizations", ylim = c(0,50),
     main = "COVI Tree Survivorship\nTop-Down, Sum LA Scheme", lwd = 2)
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
plot(x = liana[[1]]$month, y = liana[[1]]$GPP_n, type = "l", col = "red", 
     xlab = "Month", ylab = "# of Surviving Realizations", ylim = c(0,50),
     main = "MACH/CIFU Liana Survivorship\nTop-Down, Sum LA Scheme", lwd = 2)
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
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/shed_median/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/shed_median/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
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
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/shed_median/top_down_sum_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:MITE/shed_median/top_down_sum_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
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
LA_t_final <- c(tail(tree[[1]]$LA_mu,1),tail(tree[[2]]$LA_mu,1),tail(tree[[3]]$LA_mu,1),
                tail(tree[[4]]$LA_mu,1),tail(tree[[5]]$LA_mu,1),tail(tree[[6]]$LA_mu,1),
                tail(tree[[7]]$LA_mu,1))
LA_t_spline <- data.frame(spline(x = shed_median, y = LA_t_final, method = "natural"))
LA_t_shed_LA <- data.frame(LA_t_final,shed_median)

Sh_tree <- ggplot(data = LA_t_shed_LA) + 
  geom_point(mapping = aes(x = shed_median, y = LA_t_final)) + 
  geom_line(data = LA_t_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution shed median") + ylab("Tree LA [m^2]")

# Liana
LA_l_final <- c(tail(liana[[1]]$LA_mu,1),tail(liana[[2]]$LA_mu,1),tail(liana[[3]]$LA_mu,1),
                tail(liana[[4]]$LA_mu,1),tail(liana[[5]]$LA_mu,1),tail(liana[[6]]$LA_mu,1),
                tail(liana[[7]]$LA_mu,1))
LA_l_spline <- data.frame(spline(x = shed_median, y = LA_l_final, method = "natural"))
LA_l_shed_LA <- data.frame(LA_l_final,shed_median)

Sh_liana <- ggplot(data = LA_l_shed_LA) + 
  geom_point(mapping = aes(x = shed_median, y = LA_l_final)) + 
  geom_line(data = LA_l_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution shed median") + ylab("Liana LA [m^2]")

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), shed_median = shed_median)
LA_spline <- data.frame(spline(x = shed_median, y = LA_final$LA_final, method = "natural"))

Sh_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = shed_median, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution") + ylab("Total LA [m^2]")

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
cv_shed_median <- sqrt(var(LA_final$LA_final))/median(LA_final$LA_final)
f <- splinefun(x = shed_median, y = LA_final$LA_final, method = "natural")
elasticity_shed_median <- f(shed_median, deriv = 1)[4]*(shed_median[4]/LA_final$LA_final[4])
variances$shed_median <- var(LA_spline$y)

####################
### KNOCK_MEDIAN ###
####################
tree <- list()
for (j in 1:7) {
  tree[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:CIFU/knock_median/top_down_individ_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:CIFU/knock_median/top_down_individ_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
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
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:CIFU/knock_median/top_down_individ_",sd[j],"/ens_",i,"_0_liana_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/DARE:CIFU/knock_median/top_down_individ_",sd[j]),"/ens_",i,"_0_liana_from_data.txt"), 
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
LA_t_final <- c(tail(tree[[1]]$LA_mu,1),tail(tree[[2]]$LA_mu,1),tail(tree[[3]]$LA_mu,1),
                tail(tree[[4]]$LA_mu,1),tail(tree[[5]]$LA_mu,1),tail(tree[[6]]$LA_mu,1),
                tail(tree[[7]]$LA_mu,1))
LA_t_spline <- data.frame(spline(x = knock_median, y = LA_t_final, method = "natural"))
LA_t_knock_LA <- data.frame(LA_t_final,knock_median)

K_tree <- ggplot(data = LA_t_knock_LA) + 
  geom_point(mapping = aes(x = knock_median, y = LA_t_final)) + 
  geom_line(data = LA_t_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution knock median") + ylab("Tree LA [m^2]")

# Liana
LA_l_final <- c(tail(liana[[1]]$LA_mu,1),tail(liana[[2]]$LA_mu,1),tail(liana[[3]]$LA_mu,1),
                tail(liana[[4]]$LA_mu,1),tail(liana[[5]]$LA_mu,1),tail(liana[[6]]$LA_mu,1),
                tail(liana[[7]]$LA_mu,1))
LA_l_spline <- data.frame(spline(x = knock_median, y = LA_l_final, method = "natural"))
LA_l_knock_LA <- data.frame(LA_l_final,knock_median)

K_liana <- ggplot(data = LA_l_knock_LA) + 
  geom_point(mapping = aes(x = knock_median, y = LA_l_final)) + 
  geom_line(data = LA_l_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution knock median") + ylab("Liana LA [m^2]")

# Total
LA_final <- data.frame(LA_final = c(LA_t_final+LA_l_final), knock_median = knock_median)
LA_spline <- data.frame(spline(x = knock_median, y = LA_final$LA_final, method = "natural"))

K_total <- ggplot(data = LA_final) + 
  geom_point(mapping = aes(x = knock_median, y = LA_final)) + 
  geom_line(data = LA_spline, aes(x = x, y = y)) +
  ylim(-5,80)+
  theme_classic(base_size = 22)+ xlab("Kumaraswamy distribution") + ylab("Total LA [m^2]")

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
cv_knock_median <- sqrt(var(LA_final$LA_final))/median(LA_final$LA_final)
f <- splinefun(x = knock_median, y = LA_final$LA_final, method = "natural")
variances$knock_median <- var(LA_spline$y)
elasticity_knock_median <- f(knock_median, deriv = 1)[4]*(knock_median[4]/LA_final$LA_final[4])

# # # # # # # # # # # # # #
# SENSITIVITY SPLINE GRID #
# # # # # # # # # # # # # #
Fig6 <- plot_grid(ncol = 2, nrow = 1, VLA, Sh,
                  labels = c("Maximum Voxel LAD", "Shed Median"),
                  label_size = 22)

# # # # # # # # # # # # #
# SENSITIVITY LOLLIPOP  #
# # # # # # # # # # # # #
# Partial Variance calc
partial_variances <- variances/sum(variances)*100

# Lollipop chart
lollipop_cv <- data.frame(x = c("Maximum Voxel LAD", "Shed Median"), 
                          y = c(cv_vox_la_max*100, cv_shed_median*100))
lollipop_elasticity <- data.frame(x = c("Maximum Voxel LAD", "Shed Median"), 
                          y = c(elasticity_vox_la_max, elasticity_shed_median))
lollipop_pv <- data.frame(x = c("Maximum Voxel LAD", "Shed Median"),
                              y = c(partial_variances$vox_la_max,partial_variances$shed_median))

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
    panel.grid.minor.x = element_blank(),
    axis.text.y = element_blank()
  )

PV <- ggplot(data = lollipop_pv, aes(x=x, y=y)) +
  geom_segment( aes(x=x, xend=x, y=0, yend=y), color="black", size = 2) +
  geom_point( color="black", size=4) +
  geom_hline(yintercept = 0)+
  theme_light() +
  coord_flip() +
  ylab("Partial Variance (%)")+
  xlab("")+
  background_grid(major = 'none', minor = "none")+
  theme(
    panel.grid.major.y = element_blank(),
    panel.border = element_blank(),
    axis.line.x = element_line(),
    panel.grid.minor.x = element_blank()
  )

Fig5 <- plot_grid(CV,Elasticity,PV + theme(axis.text.y = element_blank(),
                                        axis.ticks.y = element_blank(),
                                        axis.title.y = element_blank()),
                  labels = c("a","b","c"),
                  ncol = 3, nrow = 1)
title <- ggdraw() + 
  draw_label(
    "Partitioning of variance by parameter",
    fontface = 'bold',
    x = 0,
    hjust = 0)
Fig5 <- plot_grid(title, Fig5, ncol = 1, rel_heights = c(0.1, 1))

plot_grid(Fig6,Fig5, ncol = 2)

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
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/ensemble/DARE:MITE/top_down_sum/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    ens_tree[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/ensemble/DARE:MITE/top_down_sum/ens_",j,"_0_tree_from_data.txt"), 
                               header = FALSE)
    # creating add columns
    colnames(ens_tree[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
    ens_tree[[j]]$month <- seq.int(nrow(ens_tree[[j]]))
    ens_tree[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {ens_tree[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(ens_tree[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ens_tree[[j]]$month <- seq.int(nrow(ens_tree[[j]]))
  ens_tree[[j]]$run <- j
  }
}
# Take mean and stderr for a timeseries graph
ens_tree <- bind_rows(ens_tree) %>% group_by(month) %>% 
  summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), 
                   list(mu = ~ mean(.), sigma = ~ std.error(.), n = ~ length(.))))

# Read in liana for ensemble analysis
ens_liana <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (liana died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/ensemble/DARE:MITE/top_down_sum/ens_",j,"_0_liana_from_data.txt"))>0)
  {
  # import each run
  ens_liana[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/ensemble/DARE:MITE/top_down_sum/ens_",j,"_0_liana_from_data.txt"), 
                            header = FALSE)
  # creating add columns
  colnames(ens_liana[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ens_liana[[j]]$month <- seq.int(nrow(ens_liana[[j]]))
  ens_liana[[j]]$run <- j
  }
  # if file is blank, generate matrix of 0s
  else {ens_liana[[j]] <-  data.frame(matrix(data = 0, nrow = 1, ncol = 6))
  colnames(ens_liana[[j]]) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
  ens_liana[[j]]$month <- seq.int(nrow(ens_liana[[j]]))
  ens_liana[[j]]$run <- j
  }
}
# Take mean and stderr for a timeseries graph
ens_liana <- bind_rows(ens_liana) %>% group_by(month) %>% 
  summarize(across(c(GPP,NPP,LA,Height,Crown_Depth,Crown_Radius), 
                   list(mu = ~ mean(.), sigma = ~ std.error(.), n = ~ length(.))))

# LA timeseries, for comparing random vs top-down
# top-down
top_down_LA <- ggplot()+
  geom_line(data = ens_tree, aes(x = month, y = LA_mu, color = "tree LA"), size = 1)+
  geom_line(data = ens_liana, aes(x = month, y = LA_mu, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = ens_tree$LA_mu+ens_liana$LA_mu, color = "total LA"), size = 1)+
  geom_ribbon(data = ens_tree, aes(x = month, ymax = LA_mu + LA_sigma, ymin = LA_mu - LA_sigma), alpha = 0.3)+
  geom_ribbon(data = ens_liana, aes(x = month, ymax = LA_mu + LA_sigma, ymin = LA_mu - LA_sigma), alpha = 0.3)+
  geom_ribbon(aes(x = 1:120, ymax = ens_tree$LA_mu + ens_liana$LA_mu + std.error(ens_tree$LA_mu + ens_liana$LA_mu),
                  ymin = ens_tree$LA_mu + ens_liana$LA_mu - std.error(ens_tree$LA_mu + ens_liana$LA_mu)), alpha = 0.3)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+ ylim(c(0,50))+
  ggtitle("DARE/MITE leaf area\ntop-down growth scheme")+ theme_classic(base_size = 22)
# switch filepath for list read-in, and proceed to random
random_LA <- ggplot()+
  geom_line(data = ens_tree, aes(x = month, y = LA_mu, color = "tree LA"), size = 1)+
  geom_line(data = ens_liana, aes(x = month, y = LA_mu, color = "liana LA"), size = 1)+
  geom_line(aes(x = 1:120, y = ens_tree$LA_mu+ens_liana$LA_mu, color = "total LA"), size = 1)+
  geom_ribbon(data = ens_tree, aes(x = month, ymax = LA_mu + LA_sigma, ymin = LA_mu - LA_sigma), alpha = 0.3)+
  geom_ribbon(data = ens_liana, aes(x = month, ymax = LA_mu + LA_sigma, ymin = LA_mu - LA_sigma), alpha = 0.3)+
  geom_ribbon(aes(x = 1:120, ymax = ens_tree$LA_mu + ens_liana$LA_mu + std.error(ens_tree$LA_mu + ens_liana$LA_mu),
                  ymin = ens_tree$LA_mu + ens_liana$LA_mu - std.error(ens_tree$LA_mu + ens_liana$LA_mu)), alpha = 0.3)+
  labs(x = "timestep", y = "Leaf Area [m^2]", color = "Legend")+ ylim(c(0,50))+
  ggtitle("DARE/MITE leaf area\nrandom growth scheme")+ theme_classic(base_size = 22)


# LA histograms
# Tree
hist(sapply(ens_tree, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "DARE/MITE Tree final timestep LA",
     breaks = "FD", ylim = c(0,200), xlim = c(0,80))
# Liana
hist(sapply(ens_liana, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "DARE/MITE Liana final timestep LA\nTop-down growth scheme",
     ylim = c(0,200), xlim = c(0,60))
# Total
hist(sapply(ens_tree, function(x) tail(x$LA,1))+
       sapply(ens_liana, function(x) tail(x$LA,1)),
     xlab = "Leaf area [m^2]",
     main = "DARE/MITE Couplet final timestep LA",
     breaks = "FD", ylim = c(0,200), xlim = c(0,80))

# Survival histograms
# Tree
hist(sapply(ens_tree, function(x) tail(x$month,1)),
     xlab = "Months survived",
     main = "Tree Survival",
     breaks = "FD")
# Liana
hist(sapply(ens_liana, function(x) tail(x$month,1)),
     xlab = "Months survived",
     main = "Liana Survival",
     breaks = "FD")

# # # # # # # # # # # # # # #
#   ######################  #
#   # Mortality Analysis #  #
#   ######################  #
# # # # # # # # # # # # # # #
tree <- list()
for (j in 1:7) {
  tree[[j]] <- lapply(1:num_ens, function(i) {
    # check that file isn't blank
    if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/COVI:CIFU/vox_la_max/top_down_sum_",sd[j],"/ens_",i,"_0_tree_from_data.txt"))>0)
    {
      # importing data on each index i
      r <- read.csv(paste0(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/COVI:CIFU/vox_la_max/top_down_sum_",sd[j]),"/ens_",i,"_0_tree_from_data.txt"), 
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
      r <- data.frame(matrix(data = 0, nrow = 1, ncol = 6))
      # creating add columns
      colnames(r) <- c("GPP","NPP","LA","Height","Crown_Depth","Crown_Radius")
      r$month <- seq.int(nrow(r))
      r$run <- i
      
      return(r)
    }
  })      
}

df <- matrix(ncol = 7, nrow = num_ens)
for (i in 1:7)
{
  for (j in 1:num_ens)
  {
    df[j,i] <-  length(tree[[i]][[j]]$LA)
  }
}
df <- data.frame(df)
colnames(df) <- LETTERS[1:7]
  
ggplot(stack(df), aes(x = ind, y = values)) +
  geom_boxplot(aes(fill = ind)) + theme_classic() +
  ylab("Months Survived")+ ylim(0,120)

# Multi-species mortality comparison, without liana
# # # # # # # # #
BUSI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_BUSI/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    BUSI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_BUSI/ens_",j,"_0_tree_from_data.txt"), 
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

CEPE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_CEPE/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    CEPE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_CEPE/ens_",j,"_0_tree_from_data.txt"), 
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

SIGL <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_SIGL/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    SIGL[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_SIGL/ens_",j,"_0_tree_from_data.txt"), 
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

TAIM <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_TAIM/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    TAIM[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_TAIM/ens_",j,"_0_tree_from_data.txt"), 
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

COVI <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_COVI/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    COVI[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_COVI/ens_",j,"_0_tree_from_data.txt"), 
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

DARE <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_DARE/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    DARE[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_DARE/ens_",j,"_0_tree_from_data.txt"), 
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

MACH <- list()
for (j in 1:num_ens) {
  # check that file isn't blank (tree died in 1st timestep)
  if (file.size(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_MACH/ens_",j,"_0_tree_from_data.txt"))>0)
  {
    # import each run
    MACH[[j]] <- read.csv(paste0("/Users/sethparker/Documents/Medvigy_Lab/Ensemble:Sensitivity/post-xy-fix/solo_tree_MACH/ens_",j,"_0_tree_from_data.txt"), 
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

df <- matrix(ncol = 6, nrow = 7*num_ens)
# Make long-form data to analyze for explanatory variables
for (j in 1:num_ens)
{
  df[j,1] <- species_info$sp[10]
  df[j,2] <- species_info$Nmass[10]
  df[j,3] <- species_info$LMA[10]
  df[j,4] <- species_info$wsg[10]
  df[j,5] <- species_info$Pmass[10]
  df[j,6] <- length(COVI[[j]]$month)
  
  df[j+num_ens,1] <- species_info$sp[8]
  df[j+num_ens,2] <- species_info$Nmass[8]
  df[j+num_ens,3] <- species_info$LMA[8]
  df[j+num_ens,4] <- species_info$wsg[8]
  df[j+num_ens,5] <- species_info$Pmass[8]
  df[j+num_ens,6] <- length(CEPE[[j]]$month)
  
  df[j+2*num_ens,1] <- species_info$sp[4]
  df[j+2*num_ens,2] <- species_info$Nmass[4]
  df[j+2*num_ens,3] <- species_info$LMA[4]
  df[j+2*num_ens,4] <- species_info$wsg[4]
  df[j+2*num_ens,5] <- species_info$Pmass[4]
  df[j+2*num_ens,6] <- length(BUSI[[j]]$month)
  
  df[j+3*num_ens,1] <- species_info$sp[32]
  df[j+3*num_ens,2] <- species_info$Nmass[32]
  df[j+3*num_ens,3] <- species_info$LMA[32]
  df[j+3*num_ens,4] <- species_info$wsg[32]
  df[j+3*num_ens,5] <- species_info$Pmass[32]
  df[j+3*num_ens,6] <- length(SIGL[[j]]$month)
  
  df[j+4*num_ens,1] <- species_info$sp[34]
  df[j+4*num_ens,2] <- species_info$Nmass[34]
  df[j+4*num_ens,3] <- species_info$LMA[34]
  df[j+4*num_ens,4] <- species_info$wsg[34]
  df[j+4*num_ens,5] <- species_info$Pmass[34]
  df[j+4*num_ens,6] <- length(TAIM[[j]]$month)
  
  df[j+5*num_ens,1] <- species_info$sp[12]
  df[j+5*num_ens,2] <- species_info$Nmass[12]
  df[j+5*num_ens,3] <- species_info$LMA[12]
  df[j+5*num_ens,4] <- species_info$wsg[12]
  df[j+5*num_ens,5] <- species_info$Pmass[12]
  df[j+5*num_ens,6] <- length(DARE[[j]]$month)
  
  df[j+6*num_ens,1] <- species_info$sp[26]
  df[j+6*num_ens,2] <- species_info$Nmass[26]
  df[j+6*num_ens,3] <- species_info$LMA[26]
  df[j+6*num_ens,4] <- species_info$wsg[26]
  df[j+6*num_ens,5] <- species_info$Pmass[26]
  df[j+6*num_ens,6] <- length(MACH[[j]]$month)
}
# dataframe it and convert values to numeric
colnames(df) <- c("species","Nmass","LMA","wsg","Pmass","months_survived")
df <- data.frame(df)
for (i in 2:6) 
{
  df[,i] <- as.numeric(df[,i])
}

df2 <- matrix(ncol = 7, nrow = num_ens)
for (i in 1:num_ens) 
{
df2[i,1] <- length(COVI[[i]]$month)
df2[i,2] <- length(CEPE[[i]]$month)
df2[i,3] <- length(BUSI[[i]]$month)
df2[i,4] <- length(SIGL[[i]]$month)
df2[i,5] <- length(TAIM[[i]]$month)
df2[i,6] <- length(DARE[[i]]$month)
df2[i,7] <- length(MACH[[i]]$month)
}
colnames(df2) <- c("COVI","CEPE","BUSI","SIGL","TAIM","DARE","MACH")
df2 <- data.frame(df2)

# Save df2 histograms for each solo species to evaluate $counts
solo <- list()
for (i in 1:7) 
{
solo[[i]] <- hist(df2[,i], breaks = c(0,10,20,30,40,50,60,70,80,90,100,110,120))  
}
names(solo) <- c("COVI","CEPE","BUSI","SIGL","TAIM","DARE","MACH")

# Change species filepath to include lianas, again save as objects
# CIFU
infested <- list()
for (i in 1:7) 
{
  infested[[i]] <- hist(df2[,i],breaks = c(0,10,20,30,40,50,60,70,80,90,100,110,120))  
}
names(infested) <- c("COVI","CEPE","BUSI","SIGL","TAIM","DARE","MACH")

# percentage change in survival
par(mfrow=c(3,3))
# COVI CIFU
barplot((solo[["COVI"]]$counts / 5) - (infested[["COVI"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on COVI survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# CEPE CIFU
barplot((solo[["CEPE"]]$counts / 5) - (infested[["CEPE"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on CEPE survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# BUSI CIFU
barplot((solo[["BUSI"]]$counts / 5) - (infested[["BUSI"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on BUSI survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# SIGL CIFU
barplot((solo[["SIGL"]]$counts / 5) - (infested[["SIGL"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on SIGL survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# TAIM CIFU
barplot((solo[["TAIM"]]$counts / 5) - (infested[["TAIM"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on TAIM survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# DARE CIFU
barplot((solo[["DARE"]]$counts / 5) - (infested[["DARE"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on DARE survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)
# MACH CIFU
barplot((solo[["MACH"]]$counts / 5) - (infested[["MACH"]]$counts / 5), ylab = "Percentage change", 
        names.arg = c("0-10","10-20","20-30","30-40","40-50","50-60",
                      "60-70","70-80","80-90","90-100","100-110","110-120"),
        main = "Influence of CIFU liana on MACH survival", cex.axis = 1, cex.names = .75, 
        cex.main = 1.5, cex.lab = 1.5, ylim = c(-6,4))
mtext("Months Survived",1, cex = 1)

ggplot(df, aes(months_survived))+
  geom_histogram()+ facet_wrap(~species)+ theme_classic()

ggplot(stack(df), aes(x = ind, y = values)) +
  geom_boxplot(aes(fill = ind)) + theme_classic() +
  ylab("Months Survived")+ ylim(0,120)+ ggtitle("Just trees\nCOVI mean: 107.7, se: 1.15\nMACH mean: 117.3 se: 0.57")













