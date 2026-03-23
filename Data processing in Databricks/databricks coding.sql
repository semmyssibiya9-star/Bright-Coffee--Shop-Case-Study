---this is just to check if the table is loaded correct and i am able to read it properly

select * 
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3` 
limit 10;


1. Checking the date range

---They started collecting the data on 2023-01-01

select Min(transaction_date) AS start_date
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

--- When last did did they collect data 2023-06-30

select Max(transaction_date) AS start_date
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

---2. Checking the name of store locations

-- we have 3 store location, Lower Manhattan, Hell's Kitchen,and Asoria
select distinct store_Location
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

---3. Checking products sold across all the store

select distinct product_category
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

---4. checking product details sold across all the store

select distinct product_detail
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

---5. checking both product_category, product_type and product_details sold across all the store

select distinct product_category AS category,
                product_type,
                product_detail AS product_name
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;


select count(distinct store_id) AS number_of_stores
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

--1. Checking product prices


select min(Unit_price) AS cheapest_price
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

select max(Unit_price) AS expensive_price
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

select count(*) AS number_of_rows,
       count(distinct product_id) AS number_of_products,
       count(distinct store_id) AS number_of_store
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`; 

select * 
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3` 
limit 10;

select transaction_id, transaction_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,
       transaction_qty*unit_price AS revenue_per_tnx
 from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`; 

 select count(*) 
 from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`; 

select transaction_date,
        Dayname(transaction_date) AS Day_name,
        Monthname(transaction_date) AS Month_name,
        count(distinct transaction_id) AS number_of_sales,
        sum(transaction_qty*unit_price) AS revenue_per_day
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3` 
group by transaction_date, Day_name, Month_name;
      
