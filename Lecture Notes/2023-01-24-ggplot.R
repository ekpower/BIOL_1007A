### ggplot2
### 24 January 2023
### EKP

library(ggplot2)
library(ggthemes)
library(patchwork)

# Template for ggplot code
## p1 <- ggplot(data=<DATA>, mapping = aes(x=xVar, y=yVar)) + <GEOM FUNCTION>
  ## eg. of geom function: geom_boxplot()
## print(p1)

# Load in a built-in data set
d <- mpg
str(mpg)

library(dplyr)
glimpse(d)

# qplot: function in ggplot for quick plotting
qplot(x=d$hwy)

# histogram
qplot(x=d$hwy, fill=I("darkblue"), color=I("black"))
  ## if you don't use I, the colors won't work

# scatterplot
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"))
  # smooth adds line of best fit
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm")
  # this adds linear line of best fit

# boxplot
qplot(x=d$fl, y=d$cty, geom="boxplot", fill=I("forestgreen"))

# bar plot
qplot(x=d$fl, geom="bar", fill=I("forestgreen"))

# Create some data (specified counts)
x_trt <- c("Control", "Low", "High")
y_resp <- c(12, 2.5, 22.9)
qplot(x=x_trt, y=y_resp, geom="col", fill=I(c("forestgreen", "#00008B", "goldenrod")))

# ggplot: uses dataframes instead of vectors
p1 <- ggplot(data=d, mapping=aes(x=displ, y=cty, color=cyl)) + 
  geom_point()
  # 'group colors by the cyl variable'

p1 + theme_base()
p1 + theme_bw()
p1 + theme_classic()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_minimal()
p1 + theme_void()
p1 + theme_economist()
p1 + theme_solarized()

p1 + theme_bw(base_size=20, base_family="serif")
  # base_size = font size
  # base_family = font type

p2 <- ggplot(data=d, aes(x=fl, fill=fl)) + 
  geom_bar()
p2 + coord_flip() + theme_classic(base_size=15, base_family="sans")

# Theme modifications
p3 <- ggplot(data=d, aes(x=displ, y=cty)) + 
  geom_point(size=3, shape=21, color="magenta", fill="purple") + 
  xlab("Count") +
  ylab("Fuel") +
  labs(title="My title here", subtitle="my subtitle goes here") #x=/y= axis
p3 + xlim(1, 10) + ylim(0, 35)

library(viridis)
cols <- viridis(7, option = "plasma")
  # plasma, turbo, magma, viridis are other options
ggplot(data=d, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot() +
  scale_fill_manual(values=cols)

library(patchwork)
(p1 + p2) / p3
  # groups figures on same page