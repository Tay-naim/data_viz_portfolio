install.packages("tidyverse")
install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

str(penguins)
head(penguins)
summary(penguins)

# scatterplot bill length (x) by body_mass (y)

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g))

#  species coloured

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm,y = body_mass_g, colour = island))

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  # adds a line
  geom_smooth(mapping = aes(x = bill_length_mm, y = body_mass_g))

# using mapping to avoid repitition

ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth()

# creating a curve for each species

ggplot(data = penguins, 
       mapping = aes(x = bill_length_mm, 
                     y = body_mass_g, 
                     colour = species)) +
  geom_point() +
  geom_smooth()

# assigning curve to variable
# pengu_plot <-
ggplot(data = penguins,
       mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(aes(colour = species))

#We can add layers to our plot
pengu_plot +
  geom_smooth()

?geom_smooth

# plot of bill length by bill depth + linear regression lines 

pengu_plot <-
  ggplot(data = penguins,
         mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(colour=species, shape=species)) + 
  geom_smooth(aes(colour=species), method = "lm", se = FALSE)

# 3 - saving plots

# can save our plots to a file using ggsave

ggsave(filename = "penguin_plot_1.png", plot = pengu_plot,
       width = 200, height = 300, units = c("mm"))

# 4 - continous vs categorical

plot_2 <-
  ggplot(data = penguins,
       mapping = aes(x = species, y = body_mass_g)) +
  geom_boxplot(mapping = aes(fill = species), colour = 'black')

plot_2

# saving the file

ggsave(filename = "plot_2.png", plot = plot_2,
       width = 200, height = 300, units = c("mm"))


str(penguins)

# section 4
# example where alphabetical order = annoying

df_days <-
  data.frame(day = c("Mon", "Tues", "Wed", "Thu"),
             counts = c(3, 8, 10, 5))
# df_days$day <- as.factor(df_days$day)
# change to this:
df_days$day <- factor(df_days$day, levels = c("Mon", "Tues", "Wed", "Thu"))
str(df_days)

ggplot(data = df_days, mapping = aes(x = day, y = counts)) +
  geom_col()

# changing the order of the species

penguins$species <- factor(penguins$species,
                           levels = c("Chinstrap", 
                                      "Gentoo", 
                                      "Adelie"))
str(penguins)

plot_3 <-
  ggplot(data = penguins,
       mapping = aes(x=species, y=body_mass_g, colour=island)) +
  geom_violin(mapping=aes(fill=island), colour='black')

ggsave(filename = "plot_3.png", plot = plot_3,
       width = 200, height = 300, units = c("mm"))

# section 5

ggplot(data = penguins) +
  geom_bar(mapping = aes(x = species)) +
  coord_flip()

?geom_bar

# section 6

plot_4 <- 
  penguins %>% filter(!species == "Chinstrap") %>%
  ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species, shape = island))

ggsave(filename = "plot_4.png", plot = plot_4,
       width = 200, height = 300, units = c("mm"))

# violin plot of species by bodymass, filtering out NA
plot_5 <-
  penguins %>% filter(!is.na(sex)) %>%
  ggplot(mapping = aes(x=species, y=body_mass_g)) +
  geom_violin(mapping=aes(fill=sex),colour='black')

ggsave(filename = "plot_5.png", plot = plot_5,
       width = 200, height = 300, units = c("mm"))

# section 7

# example 1

penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Gentoo penguins are the heaviest",
       x = "Species",
       y = "Weight in g",
       fill = "Sex",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  )

# example 2

plot_1 <-
  penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Gentoo penguins are the heaviest",
       x = "Species",
       y = "Weight in g",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  ) +
  scale_fill_discrete(name = "Sex", # the legend title can be changed here or in labs()
                      labels = c("Female", "Male", "Unknown"),
                      type = c("yellow3", "magenta4", "grey"))

plot_1

ggsave(filename = "plot_1.png", plot = plot_1,
       width = 200, height = 300, units = c("mm"))




