# HR_Business-Analyst-Career
This analysis has been formulated to delve into the realm of Business Analyst careers and their place within the industry.

# Dataset Overview
The present dataset shows Business Analyst jobs with Job Title, Salary Estimate in USD, Job Description, 
Rating (5 point Likert scale), Company Name, Location, Headquarters, Size (Number of employees), year Founded, 
Type of ownership, Industry, Sector, Revenue, Competitors, and Easy Apply availability.

# Data Exploration
a. Size and missing values
The size of the data was 15 (length) x 4092 (row) with a total of 10584 missing values.

b. Unique Values
Show unique values to find patterns and categories for Salary Estimate, Type of ownership, Industry, Sector, Size, and Revenue.

# SUMMARY 1: Show a list of the following
a. Top 20 Industries (unique values, no duplicates)
In total there are 101 industries. The most occurring industry is Accounting, followed by
Advertising & Marketing, Aerospace & Defence, and Architectural & Engineering Services
etc. as listed in the below figure

b. Top 20 Sectors (unique values, no duplicates)
In total there are 26 sectors. The most occurring sector is Accounting & Legal, followed by
Aerospace & Defence, and Agriculture & Forestry etc. as listed in the below figure.

c. Top 20 Headquarters (unique values, no duplicates)
In total there are 592 headquarters. The most occurring headquarter is Abbott Park, followed
by Aberdeen, Abu Dhabi etc. as listed in the below figure.

# SUMMARY 2: Display the following
a. Top 15 jobs based on Rating
b. Top 15 jobs based on Rating under “Consulting” industry
c. Bottom 15 jobs based on Rating

# SUMMARY 3: Plot the following
a. Top 10 Companies with rating greater than 3 and under industry “Consulting”
b. Top 10 Companies with rating greater than 3 and under industry “Energy”
c. Top 10 Companies with rating greater than 3 and under industry “Accounting”

# SUMMARY 4: Distribution of Companies by Size
First, the company Size was decoded into integers to make a meaningful order ("1 to 50
employees" = 1, "51 to 200 employees" = 2, "201 to 500 employees" = 3, "501 to 1000
employees" = 4, "1001 to 5000 employees" = 5, "5001 to 10000 employees" 6, “10000+
employees" = 7, and all the other values = NA). The result shows that companies with
“10000+ employees" mostly occurred with counts over 800.

# SUMMARY 5: Distribution of Companies by Revenue
First, the company Revenue was decoded into integers to make a meaningful order ("Less
than 1 million" = 1, "1 to 5 million" = 2, "5 to 10 million" = 3, "10 to 25 million" = 4, "25 to 50
million" = 5, "50 to 100 million" = 6, "100 to 500 million" = 7, "500 million to 1 billion" = 8, "1 to
2 billion" = 9, "2 to 5 billion" = 10, "5 to 10 billion" = 11, "10+ billion" = 12, and all the other
values = NA). The result shows that the companies with over 10 billion mostly occurred with
counts over 800.

# SUMMARY 6: Top 5 Sectors with the highest average Rating
Average Rating was calculated to find out the top 5 sectors with the highest average Rating.
The result shows that Information Technology had the highest average Rating of 4.01,
followed by Consumer Services with an average rating of 3.91.

# SUMMARY 7: Most common Industry per Ownership
Following results show a particular “industry" that is most commonly associated with a
particular "type of ownership". For instance, the ownership type of College / University type
is mostly associated with the industry of Colleges & University.

# SUMMARY 8: Most common Sector per Ownership
Following results show a particular “sector” that is most commonly associated with a
particular "type of ownership". For instance, the ownership type of College / University type
is mostly associated with the sector of Education.

# Linear Regression 1: Revenue vs. Size
A linear regression model was created to test the relationship between Revenue and Size of
companies. The result shows that there was a statistically significant positive relationship
between those variables with the p-value less than 0.001. This means that generally, when
the Size increases, the Revenue also increases (and/or vice versa). The Linear Regression
visualisation shows the result with the blue line indicating the “line of best fit”.

# Linear Regression 2: Founded (Year) vs. Size
A linear regression model was created between Founded year and Size of companies. The
result shows that there was a significant negative relationship between the variables with the
p-value less than 0.001. This indicates that generally, the older a company is, the size of the
company increases. The scatter plot with the line of best fit shows a clear and strong
correlation of this analysis.

# Linear Regression 3: Founded (Year) vs. Rating
A linear regression model was created between Founded year and Rating of companies.
The outcome of the analysis revealed a noteworthy and positive association between these
two factors, supported by a significantly low p-value (less than 0.001). In essence, this
suggests that higher ratings are associated with more recent founding years. The model
coefficients indicate that for each unit increase in the company's rating, there is an estimated
increase of approximately 17.01 in the founding year. The scatter plot with the trend line
shows this positive correlation clearly.

# Multiple Regression: Founded (Year), Rating, Size, and Revenue
A multiple regression analysis was conducted to explore the relationship between the
founding year ("Founded") of companies and their "Rating," "Size," and "Revenue." The
analysis aimed to understand how these independent variables collectively influence the
dependent variable, "Founded." The model was found to be significant across all factors
related to “Founded” with p-value less than 0.001. The coefficients of the model represent
the estimated impact of each independent variable on the dependent variable, while holding
other variables constant.

"Rating" (coefficient: 5.73) has a positive impact on "Founded," suggesting that higher
ratings are associated with more recent founding years.

"Size" (coefficient: -3.57) has a negative impact on "Founded," indicating that larger
companies tend to have been founded earlier."

"Revenue" (coefficient: -6.09) also has a negative impact on "Founded," implying that
companies with higher revenues to have been founded earlier."

# Multiple Regression Analysis Result
Companies that are recently founded tend to get higher ratings. However, Size of companies (coefficient:
-3.57) and Revenue (coefficient: -6.09) had inverse correlation with the founding year,
indicating that larger and more revenue generating companies tend to have been founded
earlier.
