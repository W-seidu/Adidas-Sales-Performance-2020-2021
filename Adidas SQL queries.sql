-- Verifying that the final_sales_data CSV file was imported successfully.
SELECT *
FROM final_sales_data;

-- Change the misspelt old column name (ï»¿retailer) to the correct spelling (retailer).
ALTER TABLE final_sales_data CHANGE ï»¿retailer retailer VARCHAR(255);

-- Modify its position, so that product_category comes after name (this seems more ideal).
ALTER TABLE products
MODIFY COLUMN product_category VARCHAR(255) AFTER product_name;

-- Create all required table structure from the imported table.
CREATE TABLE retailers ( 
    retailer_id INT PRIMARY KEY,
    retailer_name VARCHAR(255) NOT NULL
); 

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_category VARCHAR(255) NOT NULL
);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

CREATE TABLE Locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE sales (
	sale_id INT PRIMARY KEY,
    retailer_id INT NOT NULL,
    location_id INT NOT NULL,
    product_id INT NOT NULL,
    invoice_date DATE NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    units_sold INT NOT NULL,
    operating_profit DECIMAL(10, 2) NULL,
    operating_margin DECIMAL(5, 2) NULL,
    sales_method VARCHAR(50) NOT NULL,  /* VARCHAR(50) is used because the sales methods are known for certain,
										   and the number of their characters cannot change. */
    FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into the created tables.
-- For regions: 
INSERT INTO regions
SELECT DISTINCT (region_id), region
FROM final_sales_data;

-- For locations:
/* The workaround of using the MAX function on city and state was to get a single city and state
so that the query works. 
*/
INSERT INTO locations (location_id, city, state, region_id)
SELECT location_id, 
       MAX(city),  
       MAX(state),  
       region_id
FROM final_sales_data 
GROUP BY location_id, region_id;

-- For retailers 
INSERT INTO retailers
SELECT DISTINCT(retailer_id), retailer
FROM final_sales_data;

-- For products:
/* Add product_name column to products table. This will help to create the 
products table.
*/
ALTER TABLE products
ADD COLUMN product_name VARCHAR(255) NOT NULL;

/* The NOT NULL constraint had to be removed on product_category before inserting data 
into the products table.This is because only two out of the three columns had to be 
filled first and product_category was the unpopulated column. 
*/

ALTER TABLE products
MODIFY COLUMN product_category VARCHAR(255) NULL;

-- Populate the product_id and product_name column.
INSERT INTO products (product_id, product_name)
SELECT DISTINCT(product_id), product
FROM final_sales_data; 

-- Populate the product_category column
UPDATE products
SET product_category = CASE
    WHEN product_name LIKE '%Apparel%' THEN 'Clothing'
    WHEN product_name LIKE '%Footwear%' THEN 'Shoes'
    ELSE 'Other' -- For products that do not match any of the above
END;

-- For sales:
-- Change the data type of invoive_date from text to date in final_sales_data.
-- To do this, first change the date format (in text) to the standard acceptable by SQL.
UPDATE final_sales_data
SET invoice_date = STR_TO_DATE(invoice_date, '%m/%d/%Y')
WHERE STR_TO_DATE(invoice_date, '%m/%d/%Y') IS NOT NULL;

-- Change invoice_date from text to date.
ALTER TABLE final_sales_data
MODIFY COLUMN invoice_date DATE;

-- Populate sales table.
INSERT INTO sales
SELECT sale_id, retailer_id, location_id, product_id, invoice_date, 
price_per_unit, units_sold, operating_profit, operating_margin, sales_method 
FROM final_sales_data;

-- Verify whether data has been inserted into the sales table properly.
SELECT *
FROM sales;









