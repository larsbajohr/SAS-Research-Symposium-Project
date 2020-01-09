# SAS-Research-Symposium-Project
ABSTRACT 

 

As more Millennials enter the housing market every year, it is important to understand what factors may be valuable to determine how likely they are to own or rent a home. For the last 10 years, nearly 70% or more of Millennials determine home ownership to be a personal achievement in fulfilling their American Dream (Rudden, 2019). This is clearly a very important aspect in their lives, but multiple factors prohibit this population from accomplishing this endeavor. Though student debt is steadily rising, receiving a higher education “generally leads to higher home ownership rates” (Choi et al., 2018). More Millennials are focusing more on continuing their education and less on major life events. Situations such as delaying marriage and childbearing, as well as waiting to formulate an independent household contribute to Millennials renting a dwelling longer and put off buying a home or obtaining a loan for one (Choi et al., 2018). This paper will focus on three major variables in home ownership: household income, educational attainment, and marriage.  We seek to investigate how likely an individual is to rent or own a home based on four levels of education, whether they are married/which year they have married in, and how the household income amount is affected regarding the aforementioned variables.  

 

INTRODUCTION 

 

For our project we took a look at the US housing market under the assumption that the age group of millennials buys less homes than previous generations and that millennials tend to rent homes instead. For our research we further investigated several personal variables and also outside factors that influence the decision of whether millennials own a home or rent a home instead. Before we go into detail about the variables at hand, it is important to know that we defined the age group of millennials as people born between 1981 and 1996 for our research project.  

At the beginning of our project we planned on using datasets from the Federal Reserve Economic Data and we were trying to find datasets that gave insight into student loan debt of individuals. The latter were difficult to find and we ended up using data from the IPUMS website for our further research instead.  

METHODS 

 

At the beginning of our research our dataset included roughly 58 million rows with 21 variables. The many rows are caused by the fact that we had the census data from 2013 through 2017. As of right now, we are only using the census data from the year 2017 and that significantly shortened our rows. As far as the variables go, we dropped five variables because they had the same meaning as other variables in our dataset that we kept for our research.  

Since we focused on the age group of millennials, we also had to drop all entries that included birthyears which were not between 1981 and 1996. Further, we also dropped all entries which did not at least have a high school diploma. Moreover, we only kept households in our dataset that included 0 or 1 couples to see whether having a partner influences if people rent or buy. We also had to drop entries which showed that millennials were married before 1999 because they could legally not be married before that year. Refer to Figure __ to observe what percentage of people in our dataset are married each year from the 2000 up until 2017. We grouped our education variable into four categories: “Less than HS”, “HS Diploma or Equivalent”, “College Degree”, and “Professional Degree”. This made the data easier to read and understand. Refer to Figure __ to see a distribution of each category in our dataset. Lastly, we also decided to set our household income variable between $10,000 and $200,000 because extreme outliers skewed our results. Refer to Figure __ for a categorical breakdown of household income for individuals who own and rent across each educational level.  

 

PROBLEM 

The main problem that we faced while working with this data set was how much information we were given. As we mentioned above, when IPUMS originally gave us the data set, it had 58 million rows of data with 21 different variables. Many of these rows were repetitive and useless once we figured out the definition of each variable.  

MODELS 

For the analysis, we focused on two separate models. In the first, we are predicting household income based on education level and year married. We will refer to this as Model 1. In the second model, Model 2, we attempt to predict whether a Millennial will rent or own a home based on education level as well. 

RESULTS 

MODEL 1 

Utilizing a generalized linear model, our results yield a significant p-value, and the model accounts for approximately 14.2% of the variability of household income around the mean. If an individual marries in 2017 and holds a Professional Degree, they are expected to achieve a household income of approximately $108,000 per year. As the level of degree type goes down, the annual household income decreases exponentially. Oppositely, if an individual is married, the household income increases. 

MODEL 2 

This model provides the probabilities when the variable ‘ownership’ is set to ‘rented’. Since two possibilities exist within the response variable, ‘owned or being bought(loan)’ or ‘rented’, the distribution of the probit model is set to be binomial. Model 2 generates a significant p-value. Refer to Figure __ for the output of the odds ratios for the levels of educational attainment. Additionally, you may refer to Figure __ to the frequency of predicted probabilities for each educational level before a model was fit to the data.  

DISCUSSION  

Overall, IPUMS data contains many observations, and it can be applicable to the US population since it is a nationwide census. Model 1 shows that if a person is married, they will achieve a greater household income no matter what degree type they possess. To go along with that, individuals are more likely to own a home if they have a higher degree level. That is, those who possess some sort of college degree are much more likely to own or obtain a loan for a home. This information is important to Millennials attempting to enter the housing market, so they may have a better understanding of obstacles they may encounter depending on marital status and education level.  

FUTURE WORK 

Regarding future work, our team would like to include interactions in both models to determine what other factors contribute to the variability of each. Since Model 1 explains only 14% of this, including more factors such as sex, year married, and/or ownership may increase the R-squared value and be able to better predict household income. Including these variables and their interactions in Model 2 could also potentially explain more of the variability in predicting the probabilities of ownership.  

Additionally, we are interested in introducing more variables into our data such as region and metropolitan status. This would give a more detailed look at the education level and income in specific areas of the United States. That could help us make more insightful conclusions and create a more accurate model predicting household income and ownership. 

PROJECT INFORMATION WEBSITE 

 https://github.com/larsbajohr/SAS-Research-Symposium-Project  

REFERENCES 

Choi, J., Zhu, J., Goodman, L., Ganesh, B., & Strochak, S. (2018). Millennial Homeownership Why Is It So Low, and How Can We Increase It? Housing Finance Policy Center.  

Elkins, K. (2019, January 15). Millennial households are earning more money than ever before-here's why it may not be enough. Retrieved from https://www.cnbc.com/2019/01/11/millennials-households-earn-more-money-than-ever-heres-the-problem.html. 

Rudden, J. (2019, August 2). Topic: Millennial homeownership in the U.S. Retrieved from https://www.statista.com/topics/4403/millennials-and-real-estate-in-the-us/. 

Steven Ruggles, Sarah Flood, Ronald Goeken, Josiah Grover, Erin Meyer, Jose Pacas and Matthew Sobek. IPUMS USA: Version 9.0 [dataset]. Minneapolis, MN: IPUMS, 2019. https://doi.org/10.18128/D010.V9.0 

Xu, Y., Johnson, C., Bartholomae, S., Oneill, B., & Gutter, M. S. (2015). Homeownership Among Millennials: The Deferred American Dream? Family and Consumer Sciences Research Journal, 44(2), 201–212. doi: 10.1111/fcsr.12136 
