# Load the dataset to RStudio using readxl package
library(readxl)
df<-read_excel("BusinessAnalyst.xlsx")
View(df)
class(df)
df<-as.data.frame(df)
str(df)

# 3. Conduct data exploration to identify patterns and relationships across the dataset.

# Checking the Size of data 
length(df) #15
nrow(df) #4092

# Checking for missing values: sum() to check NAs 
sum(is.na(df)) #10584

# Check the structure of the data frame
head(df)

# Check for unique values
unique(df$`Salary Estimate`)
unique(df$Size)
unique(df$`Type of ownership`)
unique(df$Industry)
unique(df$Sector)
unique(df$Revenue)

# 4. Display the following columns: a. Job Title; b. Rating; c. Location; d. Industry

library(dplyr)

# Select the desired columns
selected_columns <- select(df, "Job Title", "Rating", "Location", "Industry")
selected_columns

# 5. Show a list of the following: 
# a. Top 20 Industries (must be unique values, no duplicates) 
# b. Top 20 Sectors (must be unique values, no duplicates) 
# c. Top 20 Headquarters (must be unique values, no duplicates) 

library(dplyr)

# Select the "Industry" column and remove duplicates
unique_industries <- df %>%
  select(Industry) %>%
  distinct()

# Count the occurrences of each unique industry
industry_counts <- unique_industries %>%
  count(Industry, sort = TRUE)

# Show the top 20 industries
top_20_industries <- head(industry_counts, 20)

# Print the result
print(top_20_industries)

# b. Top 20 Sectors (must be unique values, no duplicates) 
# Select the "Sector" column and remove duplicates
unique_sectors <- df %>%
  select(Sector) %>%
  distinct()
# Count the occurrences of each unique sector
sector_counts <- unique_sectors %>%
  count(Sector, sort = TRUE)
# Show the top 20 sectors
top_20_sectors <- head(sector_counts, 20)
# Print the result
print(top_20_sectors)

# c. Top 20 Headquarters (must be unique values, no duplicates) 
# Select the "Headquarter" column and remove duplicates
unique_headquarters <-df %>%
  select(Headquarters) %>%
  distinct()
# Count the occurrences of each unique headquarter
headquarter_counts <- unique_headquarters %>%
  count(Headquarters, sort = TRUE)
# Show the top 20 headquarters
top_20_headquarters <- head(headquarter_counts, 20)
# Print the result
print(top_20_headquarters)

# 6. Then display the following: 
# a. Top 15 jobs based on Rating

library(dplyr)

top_15_jobs <- df %>%
  arrange(desc(Rating)) %>%  # Sort by Rating in descending order
  head(15)  # Select the top 15 rows

# Print the result
print(top_15_jobs)


# b. Top 15 jobs based on Rating under “Consulting” industry 
top_15_consulting_jobs <- df %>%
  filter(Industry == "Consulting") %>%
  arrange(desc(Rating)) %>%
  head(15)

print(top_15_consulting_jobs)
# c. Bottom 15 jobs based on Rating Screenshot the list and paste into a document. 
bottom_15_jobs <-df %>%
  arrange(Rating) %>%
  head(15)

bottom_15_jobs
# 7. Then plot the following: 
# a. Top 10 Companies with rating greater than 3 and under industry “Consulting” 
library(dplyr)
library(ggplot2)

top_10_consulting_companies <- df %>%
  filter(Industry == "Consulting" & Rating > 3) %>%  # Filter for Consulting and Rating > 3
  arrange(desc(Rating)) %>%  # Sort by Rating in descending order
  head(10)  # Select the top 10 rows

# Create a bar plot
ggplot(top_10_consulting_companies, aes(x = reorder(`Company Name`, -Rating), y = Rating)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Top 10 Companies in Consulting with Rating > 3",
       x = "Company Name",
       y = "Rating") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability
# In the context of ggplot2, hjust stands for "horizontal justification," and it is used to control the horizontal alignment of text or labels on a plot. hjust takes a numeric value that represents the horizontal justification, where:
# hjust = 0 aligns the text to the left.
# hjust = 0.5 aligns the text to the center.
# hjust = 1 aligns the text to the right.
# Display the plot
ggsave("top_10_consulting_companies_plot.png", width = 10, height = 6)  # Save the plot to a file

# b. Top 10 Companies with rating greater than 3 and under industry “Energy”
top_10_energy_companies <-df %>%
  filter(Industry == "Energy" & Rating > 3 ) %>% # Filter for Energy and Rating > 3 
  arrange(desc(Rating)) %>% # Sort by Rating in descending order
  head(10) # Select the top 10 rows
# Create a bar plot
ggplot(top_10_energy_companies, aes(x = reorder(`Company Name`, -Rating), y = Rating)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Top 10 Energy Companies with Rating > 3",
       x = "Company Name",
       y = "Rating") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# c. Top 10 Companies with rating greater than 3 and under industry “Accounting” 
top_10_accounting_companies <- df %>%
  filter(Industry == "Accounting" & Rating > 3) %>%
  arrange(desc(Rating)) %>%
  head(10)

ggplot(top_10_accounting_companies, aes(x = reorder (`Company Name`, -Rating), y = Rating)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Top 10 Accounting Companies with Rating > 3",
       x = "Company Name", 
       y = "Rating") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# 8. Add 10 more summaries/ plots based on your own analysis. 

# 8.1 Distribution of Companies by Size
# Convert the "Size" column
df$Size <- case_when(
  df$Size == "1 to 50 employees" ~ 1,
  df$Size == "51 to 200 employees" ~ 2,
  df$Size == "201 to 500 employees" ~ 3,
  df$Size == "501 to 1000 employees" ~ 4,
  df$Size == "1001 to 5000 employees" ~ 5,
  df$Size == "5001 to 10000 employees" ~ 6,
  df$Size == "10000+ employees" ~ 7,
  TRUE ~ NA_integer_  # For any other values not explicitly matched
)

# Print the unique values after conversion
unique(df$Size)

library(ggplot2)
# Create a bar chart based on the "Size" column
ggplot(df, aes(x = as.factor(Size))) +
  geom_bar() +
  labs(title = "Distribution of Companies by Size",
       x = "Size",
       y = "Count")

# 8.2 Distribution of Companies by Revenue

# Decode and convert the "Revenue" column
df$Revenue <- case_when(
  df$Revenue == "Less than 1 million" ~ 1,
  df$Revenue == "1 to 5 million" ~ 2,
  df$Revenue == "5 to 10 million" ~ 3,
  df$Revenue == "10 to 25 million" ~ 4,
  df$Revenue == "25 to 50 million" ~ 5,
  df$Revenue == "50 to 100 million" ~ 6,
  df$Revenue == "100 to 500 million" ~ 7,
  df$Revenue == "500 million to 1 billion" ~ 8,
  df$Revenue == "1 to 2 billion" ~ 9,
  df$Revenue == "2 to 5 billion" ~ 10,
  df$Revenue == "5 to 10 billion" ~ 11,
  df$Revenue == "10+ billion" ~ 12,
  TRUE ~ NA_integer_  # For any other values not explicitly matched
)
# Print the unique values after conversion
unique(df$Revenue)

# Create a bar chart based on the "Size" column
ggplot(df, aes(x = as.factor(Size))) +
  geom_bar() +
  labs(title = "Distribution of Companies by Revenue",
       x = "Revenue",
       y = "Count")

# 8.3 Linear Regression: Revenue vs. Size

# Create a linear regression model
model_revenue_size <- lm(Revenue ~ Size, data = df)

# Summarize the regression model
summary(model_revenue_size)

library(ggplot2)

# Create a scatter plot with a linear regression line
ggplot(df, aes(x = Size, y = Revenue)) +
  geom_point() +  # Scatter plot points
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Linear regression line
  labs(title = "Linear Regression Visualization",
       x = "Size",
       y = "Revenue") +
  theme_minimal()

# 8.4 Linear Regression: Founded vs. Size 

# Create a linear regression model
model_founded_size <- lm(Founded ~ Size, data = df)
# Summary of the linear regression model
summary(model_founded_size)

ggplot(df, aes(x = Founded, y = Size)) +
  geom_point() +  # Scatter plot points
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Linear regression line
  labs(title = "Scatter Plot with Trend Line (Year vs. Size)",
       x = "Founded",
       y = "Size") +
  theme_minimal()

# 8.5 Linear Regression: Founded vs. Rating
model_founded_rating <- lm(Founded ~ Rating, data = df)

summary(model_founded_rating)

ggplot(df, aes(x = Founded, y = Rating)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Scatter Plot with Trend Line (Year vs. Rating)", 
       x = "Founded", 
       y = "Rating") +
         theme_minimal()

# 8.6 Multiple Regression: Founded, Rating, Size, and Revenue
multiple_regression_model <- lm(Founded ~ Rating + Size + Revenue, data = df)

# Summary of the multiple regression model
summary(multiple_regression_model)

# 8.7 Top 5 Industries with the highest average rating
library(dplyr)

top_5_industries <- df %>%
  group_by(Industry) %>%
  summarize(Average_Rating = mean(Rating, na.rm = TRUE)) %>%
  arrange(desc(Average_Rating)) %>%
  head(5)

print(top_5_industries)

# 8.8 Top 5 Sectors with the highest average rating 

top_5_sectors <-df %>%
  group_by(Sector) %>%
  summarize(Average_Rating = mean(Rating, na.rm = TRUE)) %>%
  arrange(desc(Average_Rating)) %>%
  head(5)

print(top_5_sectors)


# 8.9 Most common industry per ownership
library(dplyr)
most_common_industry_per_ownership <- df %>%
  filter(!is.na(`Type of ownership`) & !is.na(Industry)) %>%  # Exclude rows with missing values
  group_by(`Type of ownership`) %>%  # Group by the 'Type of Ownership' column
  summarize(Most_Common_Industry = names(which.max(table(Industry)))) %>%
  ungroup()
most_common_industry_per_ownership


# 8.10 Most common sector per ownership
most_common_sector_per_ownership <- df %>%
  filter(!is.na(`Type of ownership`) & !is.na(Sector)) %>%
  group_by(`Type of ownership`) %>%
  summarize(Most_Common_Sector = names(which.max(table(Sector)))) %>%
  ungroup()
most_common_sector_per_ownership

