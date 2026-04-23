# reading the dataset

beetles1 <- read.csv("beetles_v1.csv")
beetles1

beetles2 <- read.csv("beetles_v2.csv")
beetles2
# table 2 has NA values

beetles3 <- read.csv("beetles_v3.csv")
beetles3
# table 3 has NA values

beetles4 <- read.csv("beetles_v4.csv")
beetles4

# 2.1 

usites <- unique(beetles1$Site)
length(usites)

colnames(beetles1)[3:ncol(beetles1)]

# Use the ‘unique’ and ‘length’ functions to count the number of species using ‘beetles3’: 
# how many beetle species are there?

speciesb3 <- unique(beetles3$spp)
length(speciesb3)

# created a vector called species: unique identifies different values
# and gives the number of unique species 

#3 

str(beetles4)
summary(beetles4)
head(beetles4)

#4 Reading tables

beetlesdf <- read.table("beetles_read_1.csv", sep=",",header=T)  
# notice how we set the separator

read.table("beetles_read_2.txt", sep="\t", header=T)
read.table("beetles_read_3.txt",  sep="", header=T, fill=TRUE, skip=1)


#5

library(tidyr)

?fill 

fill(beetlesdf,Site) # fills in the gaps in the column site

beetlesdf2 <- read.table("beetles_read_4.txt")

fill(beetlesdf2,Site)

class(beetlesdf2$Site)
class(beetlesdf$Site)
beetlesdf2$Site <- as.integer(beetlesdf2$Site)
fill(beetlesdf2,Site)
beetlesdf2<-fill(beetlesdf2,Site)

#6

beetlesdf <- read.table("beetles_read_1.csv", sep=",",header=T) %>% fill(Site)

#7 PIVOTING

# 7.2 pivot_longer

pivot_longer(data=beetlesdf, cols = c("blue_beetle", "green_beetle",
                                      "purple_beetle", "red_beetle",
                                      "brown_beetle", "black_beetle",
                                      "orange_beetle", "white_beetle"),
             names_to="Species")

# cleaner 

pivot_longer(data=beetlesdf, cols = contains('_beetle'), names_to="species",
             values_to = "Count")

casesdf <- read.table("WMR2022_reported_cases_1.txt",sep="\t")
casesdf






