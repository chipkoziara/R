library(ggplot2)
library(ggthemes)

LTV <- read.csv("/path/to/file/Raw Data.csv", header = TRUE)

arpu <- ggplot(LTV, aes(x=Year, y=ARPU, fill=Company)) + geom_bar(position="dodge", stat="identity", colour="black") + theme_wsj() + scale_fill_brewer(palette="Pastel1", labels = c("AT&T", "Sprint", "T-Mobile", "Verizon")) + coord_cartesian(ylim = c(35, 55))

# preview above by calling 'arpu'

churn <- ggplot(LTV, aes(x = Company, y = Churn, colour = factor(Year))) + geom_point(position = position_jitter(w = 0.1)) + theme_wsj() + ggtitle("Customer Churn Rate") + coord_cartesian(ylim = c(0.008, 0.04))

# preview above by calling 'churn'

ggsave(file="arpu.svg", plot=arpu, width=10, height=8)
ggsave(file="churn.svg", plot=churn, width=10, height=8)

# improvements that can be made to arpu: change y-axis scale to $, add title
# improvements that can be made to churn: change y-axis scale to percentage, add title, clean up label
# the above were corrected in inkscape prior to use, but could be addressed in ggplot2/R code above
