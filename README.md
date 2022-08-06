## Module 7 Challenge

## Overview of the analysis: 

The purpose of this exercise is to analyze the data for Pewlette-Hackard which is a company with thousands of employees, in order to prepare this company from “silver tsunami”. A large number of people starting to retire at a rapid rate and the company needs to plan its future accordingly. The company planned to sort things out in two ways: first, its offering retiring packages who meets certain criteria and, second, they need to figure out which positions need to be filled in near future as thousands of employees will be retiring. In order to achieve this plan, they hired us to do the following task:

A.	Develop an entity-relationship  diagram (ERD) and Schema

B.	Identify the employee who will be retiring.

C.	The sum of employees grouped by title who will be retiring.

D.	The number of employees who are eligible for mentorship.


## Resources

•	The data was gathered in CSV file and the analysis was performed with relational databases. 

•	We are using QuickDBD to create ERD.

•	PostreSQL, which is a database system. 

•	pgAdmin 13, a GUI using SQL Language.





## Results: 


### A.	ERD

Using ERD we created the relationship between different tables which is quite helpful in creating the new tables with which we could perform a better analysis in order to cater the needs of the company. Figure 1 shows the ERD which we have referred to create tables to complete this task.

![Picture_2, ERD]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/EmployeeDB.png)

#### Figure 1: ERD



### B.	The list of employees who are retiring.

The screenshot of table is shown in figure 2. The columns in the table are employee number, first name, last name, title, from-date and to-date. To obtain this table we merged employees and titles using inner join, which then filtered by the birth date which should be between ‘1952-01-01’ and ‘1955-12-31’. There is one issue with this table that there are duplicates for employees because working at the company employees might have acquired different roles and hence these titles are listed in the table below.


![Picture_2, retirement titles]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/retirement_titles.csv.png)

#### Figure 2: retirement titles



### C.	Removing the duplicates from the list of retiring employees.

The table for retiring employees shown in figure 3. We removed the duplicate entries in this table using “distinct_on” command. The employees are listed in this table only once by their most recent title.  We ordered the table by the employee number. The table below is having employee number, first name, last name, title, from-date and to date.


![Picture_2, unique titles]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/unique_titles.png)

#### Figure 3: unique titles



### D.	Grouping the retiring employee based on their titles.

The table shown in figure 4 is having two columns count and title, which is summarizing the number of employees grouped by their titles. The Senior Engineer has the highest count of 25916, followed by senior staff title count 24926 and least count 2 is for manager. We used GROUP BY command and COUNT command to obtain this table.

![Picture_3, retiring titles]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/retiring_titles.png)

#### Figure 4: retiring titles



### E.	List of retiring employees who are eligible for mentorship program.

The table shown in figure 5 is displaying a list of employees who are eligible for mentorship program. To obtain this table three tables: employees, titles and dep_emp are joined with inner join. ‘WHERE’ command is used to filter the list for the employees whose birth date is in between ‘1965-01-01’ and ‘1965-12-31’. Only current employees are included in that list by using ‘WHERE’ and ‘to date’ filters. The query gave the output result of 1549 rows, which is then sorted with ‘ORDER BY’ command to check if it is most recent.

![Picture_5, mentorship eligibility]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/mentorship_eligibility.png)

#### Figure 5: mentorship eligibility



## Summary: 

1.	How many roles will need to be filled as the "silver tsunami" begins to make an impact?

The table shown in figure 4 for retiring titles gives the information on how many employees will be retiring for a particular role and the same numbers of employees will be required to fill up these positions. Following are the numbers.

•	For “Senior Engineer”: 25916

•	For “Senior Staff”: 24926

•	For “Engineer”: 9285

•	For “Staff”: 7636

•	For “Technique Leader”: 3603

•	For “Assistant Engineer”: 1090

•	For “Manager”:2

2.	Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

In the present task there was no such query that could have answered this question. So, we ran one more query using “COUNT”  and  “GROUP BY” commands to find out the numbers of employees who are eligible for mentorship program according to the roles they have, which is shown in the figure 6. This figure clearly shows that numbers are not enough to match the vacancies. 

 
![Picture_6, mentorship eligibility]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/mentorship_by_title.png)

#### Figure 6


However, if we increase the filtering limit for eligibility criteria i.e. the birth date of the employee from one year (1965-01-01) to two years i.e. “1964” to “1965-12-31”, we will be having enough employee available for the mentorship. there will be only one manager short on mentorship program, also shown in figure 7.

![Picture_6, mentorship available]( https://github.com/gothwalritu/Pewlett-Hackard-Analysis/blob/main/module_7_challenge_screenshots/mentors_available.png)

#### Figure 7
