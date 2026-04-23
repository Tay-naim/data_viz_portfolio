library(tidyr)
library(dplyr)

# example with made-up dataset:

dataX <- read.table("dataset_X.csv", sep=",",
                    header=T)

# columns with 'X, X.1 = auto assigned by R
# want to get rid of them

#?select
# attempting to select columns X-X.8:
#1 dataX |> select(X:X.8)

#2

dataX <- read.table("dataset_X.csv", sep=",",
                    header=T)

dataX <- dataX %>% select(-X:-X.8)

dataX %>% 
  filter(Cat_3 > 9)

dataX %>% 
  filter(Cat_3 > 9  & Dog_3 > 2)
# first cat>9 keeps all the rows where cat > 9, and dog>2 keeps a subset of the data

# filters where cat_3 > 7 in the month of January
dataX %>%
  filter(Cat_3 > 7 & Month=="January")

# filter where it selects Cat_3>7 & month = January OR November:

dataX %>%
  filter(Cat_3 > 7 & Month=="January" | Month=="November")

# Rename
# example:

dataX %>% rename(c(Dag_2=Dog_2,
                   cap_2=Cat_2,
                   ...))
# this takes too long: manually doing it
# better to look for a pattern...
# 2 caps
# 2 dags

?rename

#example:
# function to change the names where relevant
fixNamesDogs <- function(x) {gsub("ag","og",x)}
fixNamesCats <- function(x) {gsub("ap","at",x)}

#i renamed the columns
dataX <- dataX %>%
  rename_with(fixNamesDogs, matches("ag",ignore.case=FALSE)) %>%
  rename_with(fixNamesCats, matches("ap",ignore.case=FALSE))

# matches ignore.case makes it case sensitive
# now lets make the cases uniform

fixCases <- function(x) {toupper(x)}

dataX <- dataX %>%
  rename_with(fixCases, everything())

# The first pivot

?pivot_longer

#attempt:

dataX %>% # pipes into this df
  pivot_longer( # makes the table longer
    cols = matches("Cat|Dog"), # selects the colmns containing dog or cat
    names_to = "Species", # new column name
    values_to = "Count" # moves the remaining values into a count column
    ) %>%
# splitting the species into animal + tag
  separate_wider_delim( # function to split species into 2: animal + tag
    Species, # the column we want to split 
    delim = "_", # what is separating animal_tag
    names = c("Animal", "Tag") # the names of the split columns
  )

# another way to remove the '_' to read more clearly

dataX %>% mutate("spp"=gsub("_"," ",spp))


# mutate + the W.H.O Malaria Data

casesdf <- read.table("WMR2022_reported_cases_3.txt",
                      sep="\t",
                      header=T,
                      na.strings=c("")) %>% 
  fill(country) %>% 
  pivot_longer(cols=c(3:14),
               names_to="year",
               values_to="cases") %>%
  pivot_wider(names_from = method,
              values_from = cases)

# rename columns:

casesdf <- casesdf %>%
  rename_with(
    ~ c(
      "suspected",
      "examined",
      "positive"
    ),
    .cols = c("Suspected cases", 
              "Microscopy examined", 
              "Microscopy positive")
  )

str(casesdf)
head(casesdf)

# removing 'X' from year
casesdf <- casesdf%>% # applies the function to the df
  mutate('year'=gsub('X','', year))
  
casesdf <- transform(casesdf, year = as.numeric(year))

# changing the year column to numeric

# checking cases of the df again
str(casesdf)

# checking for typos in chr columns
unique(casesdf$country)
unique(casesdf$suspected)

casesdf <- casesdf %>% 
  mutate('country'=gsub('2', '', country),
         'country'=gsub('4', '', country)) %>%
  #mutate('suspected' = gsub("\\*|\\^|\\$|\\&", "", suspected))

#casesdf <- transform(casesdf, suspected = as.numeric(suspected))

# fixNamesDogs <- function(x) {gsub("ag","og",x)}
#  rename_with(fixNamesDogs, matches("ag",ignore.case=FALSE)) %>%

# Function that cleans non-number characters & assigns column to numeric
clean_number <- function(x) {
  as.numeric(gsub("[^0-9]", "",x))
  }

casesdf <- casesdf %>%
  mutate(suspected = clean_number(suspected))

str(casesdf)

?across

# using the across function to apply the function to all the required columns 

#casesdf <- casesdf %>%
  #mutate(across(c(suspected, examined, positive), clean_number))

# cleaner way to do all columns except country

casesdf <- casesdf %>%
  mutate(across(-country, clean_number))

# creating a column for test_positivity rounded to 2 dp
casesdf <- casesdf %>%
  mutate(test_positivity= round(positive/examined, 2))

# converting country to a factor
casesdf <- casesdf %>%
  mutate(country = as.factor(country))

levels(casesdf$country)

# Use mutate and gsub to replace 
# ‘Eritrae’ with ‘Eritrea’ then convert it to a factor

casesdf <- casesdf %>%
  mutate('country'= as.factor(gsub('Eritrae','Eritrea', country)))

write.table(
  casesdf,
  file = "WMR2022_reported_cases_clean.txt",
  sep = "\t",
  quote = FALSE,
  row.names = FALSE,
  col.names = TRUE
)



