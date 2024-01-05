# HackerRank-SQL-Intermediate-Skills-Test-Solutions

# Question 1
1. Invoice Per Country

**CODE**

SELECT 
    co.country_name, 
    COUNT(*), 
    ROUND(AVG(i.total_price), 6)
FROM 
    country AS co, 
    city AS ci, 
    customer AS cu, 
    invoice AS i
WHERE 
    co.id = ci.country_id AND 
    ci.id = cu.city_id AND 
    cu.id = i.customer_id
GROUP BY 
    co.country_name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);


2. Product Sales Per City

**Code**

SELECT 
    ci.city_name, 
    pr.product_name, 
    ROUND(SUM(ii.line_total_price), 2) AS tot
FROM 
    city ci, 
    customer cu, 
    invoice i, 
    invoice_item ii, 
    product pr 
WHERE 
    ci.id = cu.city_id AND 
    cu.id = i.customer_id AND 
    i.id = ii.invoice_id AND 
    ii.product_id = pr.id 
GROUP BY 
    ci.city_name, pr.product_name 
ORDER BY 
    tot DESC, ci.city_name, pr.product_name;

