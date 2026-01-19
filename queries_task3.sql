/* =====================================================
   Task 3: SQL Basics – Filtering, Sorting & Aggregations
   Dataset: Chinook Database
   ===================================================== */

-- 1. Display sample records
SELECT * FROM Invoice
LIMIT 10;

-- 2. Verify total number of invoices
SELECT COUNT(*) AS total_invoices
FROM Invoice;

-- 3. Filter invoices from USA
SELECT *
FROM Invoice
WHERE BillingCountry = 'USA';

-- 4. Sort invoices by highest total
SELECT InvoiceId, CustomerId, Total
FROM Invoice
ORDER BY Total DESC;

-- 5. Total sales by country
SELECT BillingCountry,
       SUM(Total) AS total_sales
FROM Invoice
GROUP BY BillingCountry
ORDER BY total_sales DESC;

-- 6. Average invoice value by country
SELECT BillingCountry,
       AVG(Total) AS average_sales
FROM Invoice
GROUP BY BillingCountry;

-- 7. Countries with sales greater than 100
SELECT BillingCountry,
       SUM(Total) AS total_sales
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100;

-- 8. Monthly sales (January 2009)
SELECT InvoiceDate, Total
FROM Invoice
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-01-31';

-- 9. Customer name search using LIKE
SELECT FirstName, LastName
FROM Customer
WHERE FirstName LIKE 'A%';

-- 10. Top 5 customers by total spending
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       SUM(i.Total) AS total_spent
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY total_spent DESC
LIMIT 5;
