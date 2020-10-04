# Pewlett-Hackard

## Overview

This project scope was to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program based on age. Postgre SQL was used to combine databases and run queries. 

## Results

The main results include: 
- There are 240,124 current employees working at Pewlett Hackard.
- There are only about 1500 people eligible for the mentoring program (those born in 1965)
- About 90,000 employees are eligible for retirement over the next few years 
- The departments most affected by retirements will be: 

![retirements](https://github.com/JaniceBgithub/Pewlett-Hackard/blob/main/Resources/Dept_retiree.png)



## Summary

# How many roles will need to be filled as the "silver tsunami" begins to make an impact?

There are 90,398 employees that are expected to retire over the next few years at Pewlett Hackard.  This is very significant compared to the ~240,000 employees working at the company now. Senior engineer, senior staff and engineer are most affected by looming retirements. 

![Retirees](https://github.com/JaniceBgithub/Pewlett-Hackard/blob/main/Resources/Retirees_title.png)


# Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

There are about 1500 employees that are elgible for the mentorship program.  This is probably not sufficient for the next generation of Pewlett Hackard employees. They may want to consider expanding eligibility for the program.

# Years of service histogram

The assumed date of data retrieval for this assignment is 2003, so that some employees have ~1 year of service and there are no negative values in current date minus start date. 

The years of service was plotted and resulted in an unusual block with a steep drop off at ~18 years.  I don't think this is real data - where you would expect to see a more normal distribution of ages and more people with extended tenures!

![hist](https://github.com/JaniceBgithub/Pewlett-Hackard/blob/main/Resources/Histogram.png)

# Salaries by start date for current employees

The salaries by start date was plotted.  The more senior employees are on the left hand side, the more recent starters are on the right.  There is not a huge difference in salaries vs start date.  Pewlett Hackard should not expect to see significant savings in salaries as their older workers retire. 

![salaries](https://github.com/JaniceBgithub/Pewlett-Hackard/blob/main/Resources/Salary_scatter.png)

A histogram of salaries by tenure greater than or less than 10 years was created with no significant difference between the two groups.  Similar to the scatter plot, there are no major differences in salary for greater than or less than 10 years of service. 

![salary2](https://github.com/JaniceBgithub/Pewlett-Hackard/blob/main/Resources/salary_histograms.png)


