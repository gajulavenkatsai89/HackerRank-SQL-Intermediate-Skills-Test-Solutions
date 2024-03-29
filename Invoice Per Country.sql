SELECT 
    co.country_name, 
    COUNT(*) AS customer_count, 
    ROUND(AVG(i.total_price), 6) AS average_total_price
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
