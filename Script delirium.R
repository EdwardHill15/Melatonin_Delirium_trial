library(readr)
Melatonin_delirium <- read_delim("Melatonin-delirium.csv", delim = ";", 
                                 escape_double = FALSE, trim_ws = TRUE)
delirium <- as.data.frame(Melatonin_delirium)
View(delirium)

dim(delirium)
str(delirium)
delirium$group <- as.factor(delirium$group)

delirium
delirium <- as.data.frame(delirium)
colnames(delirium) <- c("group", "0_min", "30_min", "60_min", "90_min")
library(tidyverse)

df_long <- gather(delirium, time, number, c(2:5))
str(df_long)
df_long$time <- as.factor(df_long$time)





df_long %>% 
  ggplot(aes(x = time, y = number, fill = group)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("#84A45A", "#715E4E", "#112B04")) +
  #scale_fill_manual(values = c("#728CA3", "#73C0F4", "#E6EFF3")) +
  scale_y_continuous(expand = expansion(0),
                     limits = c(0, 13),
                     breaks = seq(-1, 13, 1)) + 
labs(title = "Melatonin efficacy trial in preventing Postoperative Delirium",
     subtitle = "Barchart of delirium cases after 30, 60 and 90 minutes of orthopedic surgery under general anesthesia",
     caption = "Source: https://github.com/EdwardHill15/Melatonin_Delirium_trial",
     xlab = "MDAS_registration",
     ylab = "Number_delirium") + 
  theme(
    text = element_text(color = "white"),
    panel.background = element_rect(fill = "black"),
    plot.background = element_rect(fill = "black"),
    plot.title = element_text(color = "white", size = 35),
    plot.subtitle = element_text(color = "white", size = 20),
    plot.caption = element_text(color = "white", size = 15, hjust = 0.9),
    panel.grid = element_blank(),
    axis.text.y = element_text(color = "white"),
    axis.text.x = element_text(color = "white"),
    axis.title.x = element_text(color = "white"),
    axis.ticks = element_line(color = "white"),
    axis.ticks.y = element_blank(),
    axis.line.x = element_line(color = "white"),
    axis.line.y = element_blank(),
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.text = element_text(color = "white", size = 8, face = "bold"),
    legend.title = element_text(color = "white", size = 9),
    legend.background = element_rect(fill = "black"),
    legend.key = element_rect(fill = "black"))
  )





