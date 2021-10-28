"# UdacityHRDatabase" 
# Designing an HR Database

In this project, I have designed, built, and populated a database for the Human Resources (HR) Department at the imaginary Tech ABC Corp, a video game company. This project will start with a request from the HR Manager. From there, I had to design a database using the foundational principals of data architecture that is best suited to the department's needs. This project is important, as it is a scaled-down simulation of the kind of real-world assignments data architects work on every day.

## Business Scenario
Tech ABC Corp saw explosive growth with a sudden appearance onto the gaming scene with its new AI-powered video game console. As a result, they have gone from a small 10 person operation to 200 employees and 5 locations in under a year. HR is having trouble keeping up with the growth since they are still maintaining employee information in a spreadsheet. While that worked for ten employees, it has become increasingly cumbersome to manage as the company expands.

* [Link to the sample data](./Data/hr-dataset.xlsx)
* [Link to the Proposal Document](./Docs/Proposal%20Document.pdf)

## Project Steps

__Step 1__: This step is all about information gathering and putting it down on paper. In this step, we are expected to complete both [business and technical proposal documents](./Docs/HR%20Database%20Proposal.pdf) required to begin the database design process. 

__Step 2__: This is where we walk through the design process. Here I have used Lucidchart to create [database diagrams](./HR_ERD) that will be used to build an actual database.

__Step 3__: It is time to start coding. Here we use [SQL DDL commands](./SQL_Code/DDL_Code.sql) to create a database. Then we populate our database with the [HR dataset](./SQL_Code/DML_Code.sql). From there, we demonstrate the effectiveness of our database by completing some [SQL CRUD exercises](./SQL_Code/CRUD_Code.sql).

## Project Files

#### Conceptual ERD
![alt-text](./HR_ERD/Conceptual_ERD.png)

#### Logical ERD
![alt-text](./HR_ERD/Logical_ERD.png)

#### Physical ERD
![alt-text](./HR_ERD/Physical_ERD.png)


#### Staging Table
* [Link to the Direct Feed command](./SQL_Code/direct_feed.sql)

#### Creation of Physical DB
* [Link to the DDL commands](./SQL_Code/DDL_Code.sql)

#### Populating Physical DB
* [Link to the DML commands](./SQL_Code/DML_Code.sql)

#### Testing of Physical DB
* [Link to the CRUD commands](./SQL_Code/CRUD_Code.sql)


## License
Licensed under the [MIT License](./LICENSE) @ Udacity

## Issues/Bugs
Please open issues on github to report bugs or make feature requests

## Contribution
If you are interested in improving the code, please open an issue first to describe the task you are planning to do. For small fixes (a few lines of change) feel free to open pull requests directly.