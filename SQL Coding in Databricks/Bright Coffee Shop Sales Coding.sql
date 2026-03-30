-- 1. Returning the entire table.

select * 
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`; 

-- 2. Checking the date range- 6 month transaction date

select
        MIN(transaction_date) AS Minimum_date,
        MAX(transaction_date) AS Maximum_date
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 3. Checking the different store location- 3 store location

select DISTINCT store_location
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 4. Checking the product sold at our stores- we have 9 different product category

select DISTINCT product_category
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 5. Checking the product type sold at our stores- we have 29 different product types

select DISTINCT product_type
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 6. Checking the product detail sold at our stores- we have 80 different product details

select DISTINCT product_detail
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 7. Checking for Nulls in various Columns- No rows returned

select *
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`
where Unit_price IS NULL
or transaction_qty IS NULL
or transaction_date IS NULL;

-- 8. Checking the lowest and highest price- lowest_price= 0.80 and highest_price= 45

select MIN(unit_price) AS lowest_unit_price,Max(unit_price) AS Highest_unit_price
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 9. Checking the lowest and highest revenue. Lowest_revenue= 0.80 and Highest_revenue= 360

select MIN(transaction_qty*unit_price) AS Lowest_revenue,Max(transaction_qty*unit_price) AS highest_revenue
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;


-- 10. Extracting the day name.

select transaction_date,
        Dayname(transaction_date) AS Day_name,
        Monthname(transaction_date) AS Month_name
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 11. Calculating a revenue.

select Unit_price,
        transaction_qty,
        unit_price*transaction_qty AS Revenue
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;

-- 11. Combining function to get a clean and enhanced data set.

select
        transaction_id,
        transaction_date,
        transaction_time,
        transaction_qty,
        store_id,
        store_location,
        product_id,
        unit_price,
        product_category,
        product_type,
        product_detail,

-- Adding columns to enhance the table for better insights.
--new column added 1
        Dayname(transaction_date) AS Day_Name,
--new column added 2
        Monthname(transaction_date) AS Month_Name,
--new column added 3
        DayofMonth(transaction_date) AS Date_of_Month,

--new column added 4- Day_Classification

CASE 
        WHEN Dayname(transaction_date) IN ('sun', 'sat') THEN 'Weekend'
        ELSE 'Weekday'
        END as Day_Classification,

--new column added 5- Time Buckets

CASE 
        WHEN date_format(transaction_time, 'HH:MM:SS') between '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
        WHEN date_format(transaction_time, 'HH:MM:SS') between '09:00:00' AND '11:59:59' THEN '02.Morning'
        WHEN date_format(transaction_time, 'HH:MM:SS') between '12:00:00' AND '15:59:59' THEN '03.Afternoon'
        WHEN date_format(transaction_time, 'HH:MM:SS') between '16:00:00' AND '18:59:59' THEN '04.Evening'
        ELSE '05.Night'
        END AS Time_Classification,

--new column added 6- Spend Buckets.

CASE
        WHEN(transaction_qty*unit_price)<=50 THEN '01 Low Spend'
        WHEN(transaction_qty*unit_price) between 51 AND 200 THEN '02.Medium'
        WHEN(transaction_qty*unit_price) between 201 AND 300 THEN '03.High Spend'
        ELSE '04.Blesser'
        END AS Spend_buckets,


--new column added 7- Revenue

        Transaction_qty*unit_price AS Revenue
from `workspace`.`default`.`bright_coffee_shop_sales_csv_3`;
