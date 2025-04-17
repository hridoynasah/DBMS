# Schema: Product(ProductName, ProductID, Category, Price)

# 1. Create a view that lists all products with their names and prices only.
CREATE OR REPLACE VIEW ProductNP AS
SELECT ProductName, Price FROM Product;

# 2. Create a view to show all products from the 'Electronics' category.
CREATE OR REPLACE VIEW ProductE AS
SELECT * FROM Product 
WHERE Category = 'Electronics';

# 3. Create a view that lists all products with a price greater than 1000.
CREATE OR REPLACE VIEW ProductGreater AS
SELECT * FROM Product 
WHERE Price > 1000;

# 4. Create a view showing the total number of products in each category.
CREATE OR REPLACE VIEW EachTotalProducts  AS
SELECT Category, COUNT(ProductID) FROM Product
GROUP BY Category; 

# 5. Create a view that shows product names and their price after applying 10% discount.
CREATE OR REPLACE VIEW EachTotalProducts  AS
SELECT ProductName, (Price * .90) AS Price FROM Product;

# 6. Create a view that displays products with their monthly, quarterly, and annual revenue (assume price is monthly revenue).
CREATE OR REPLACE VIEW ProductView AS 
SELECT Price AS MonthlyRev, (Price * 3) AS QuarterlyRev,
COUNT(Price) AS YearlyRev FROM Product;