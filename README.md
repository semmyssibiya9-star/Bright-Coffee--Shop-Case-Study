Bright coffee shop sales Analysis

The project presents sales analysis of historical transaction data from the Bright Coffee Shop. It is created to provide insight analysis for a new appointed CEO with the goal of improving revenue performance and optimizing product strategy.

Objective

To use data analytics and visualization to respond to the following business question:

Which products generate the most revenue?
 What time of day the store performs best? 
Sales trends across products and time intervals. 
Recommendations for improving sales performance.

Tools used for Analysis: SQL, and data visualization skills to help Bright Coffee Shop understand the insights.

Tasks 1: Planning & Architecture- I used Miro for creating a Data flow diagram to outlines:
-	Where the data comes from (bright Coffee Shop sales csv file).
-	How it is processed (via ETL pipelines).
-	Where it is stored (Databricks).
-	How it is analysed and presented (Microsoft excel and Microsoft power point).

For Architecture Diagram (project planning)- I used Miro to list the key Insights to be delivered such as:
-	Sales by product category and time intervals.
-	Hight- performing and low-performing products.
-	Total revenue calculations.

Outlining the calculations to be performed:

-	Total revenue= transaction_qty*unit_price.
-	Grouping by 30-minutes time interval.
-	Total Units sold by product type or details.

I used Miro to measure the Project timeline.
-	To measure the time and date for completing each tasks.


Tasks 2: Data processing in Databricks for 

-	Converting the provided excel data to CSV.
-	Load the CSV file into Databricks.
-	Perform data transformations:

1.	To create a new column: “transaction_time_buckect” to group transaction into minute intervals (or it can be 3 hour interval).
2.	Cast “unit_price”properly (some entries use commas, e.g ‘3,1 should be converted to ‘3.1’).
3.	Calculate total revenue=transaction_qty*unit_price.
4.	Using SQL to group by product types, bucket time, ect.

Tasks 3: Data Analysis: I used Microsoft excel

After processing the data in Databricks: I have exported the processed data to Microsoft excel to create pivot table to perform analysis and outlining:

-	The total revenue per product type.
-	Peak time intervals for sales.
-	Quantity of Items sold by product category.
-	Best-selling product type or details.
-	Using charts and graphs to make the story visually appealing.


Making use of excel, I checked the total rows which was 149,117, total columns which is 12, total revenue of #698,812.33, minimum revenue of 0.8, maximum revenue of #360 and total qty of 214,470.

Tasks 4: Presentation to the CEO- I used Microsoft power Point to present visual backed by the key Insights.

and Used PowerBI to monitor the Dashboard and automate daily sales reporting.

