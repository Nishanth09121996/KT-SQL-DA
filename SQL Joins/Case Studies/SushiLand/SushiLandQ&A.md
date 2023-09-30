## Case Study #1 - SushiLand

#### 1. What is the total amount each customer spent at the restaurant?

```sql
SELECT
  s.customer_id,
  SUM(m.price) AS total_sales
FROM sushiland.sales s
  JOIN sushiland.menu m
    ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;

+-------------+-------------+
| customer_id | total_sales |
+-------------+-------------+
| A           |    18290.00 |
| B           |    21340.00 |
| C           |    14140.00 |
+-------------+-------------+
```     


#### 2. How many days has each customer visited the restaurant?

```sql
SELECT
  s.customer_id,
  COUNT(DISTINCT s.order_date) AS unique_visits
FROM sushiland.sales s
GROUP BY s.customer_id

+-------------+---------------+
| customer_id | unique_visits |
+-------------+---------------+
| A           |            30 |
| B           |            30 |
| C           |            30 |
+-------------+---------------+
```



#### 3. What was the first item from the menu purchased by each customer?

```sql
SELECT 
  s.customer_id,
  s.order_date,
  m.product_name
FROM sushiland.sales s
  JOIN sushiland.menu m
    ON s.product_id = m.product_id
WHERE 
  s.orderID IN
    (SELECT
      MIN(s.orderID)
    FROM sushiland.sales s
    GROUP BY
      s.customer_id
    )
ORDER BY
  s.customer_id;

+-------------+------------+--------------+
| customer_id | order_date | product_name |
+-------------+------------+--------------+
| A           | 2023-09-30 | Ramen        |
| B           | 2023-09-29 | Sushi        |
| C           | 2023-09-28 | Curry        |
+-------------+------------+--------------+
```	 

#### 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

```sql
SELECT
  m.product_name,
  COUNT(s.product_id) AS num_of_orders
FROM sushiland.menu m
  JOIN sushiland.sales s
    ON m.product_id = s.product_id
GROUP BY
  m.product_name
ORDER BY
  num_of_orders DESC;

+--------------+---------------+
| product_name | num_of_orders |
+--------------+---------------+
| Ramen        |           156 |
| Curry        |           153 |
| Sushi        |           121 |
+--------------+---------------+
```    

#### 5. Which item was the most popular for each customer?

```sql
WITH order_count AS 
  (SELECT
      s.customer_id, 
      m.product_name, 
      COUNT(s.product_id) AS order_count,
      DENSE_RANK()
          OVER(
            PARTITION BY s.customer_id
            ORDER BY COUNT(s.customer_id) DESC) AS rnk
  FROM sushiland.sales s
    JOIN sushiland.menu m
      ON s.product_id = m.product_id
  GROUP BY 
      s.customer_id, 
      m.product_name
  )  
SELECT
  customer_id,
  product_name,
  order_count
FROM order_count 
where rnk = 1 ;

+-------------+--------------+-------------+
| customer_id | product_name | order_count |
+-------------+--------------+-------------+
| A           | Curry        |          59 |
| B           | Sushi        |          67 |
| C           | Curry        |          46 |
+-------------+--------------+-------------+
``` 	  
#### 6. Which item was purchased first by the customer after they became a member?

```sql
WITH member_timeline AS 
  (SELECT 
      mb.customer_id,
      mb.join_date,
      s.order_date,
      s.product_id,
      DENSE_RANK()
    	OVER (PARTITION BY s.customer_id
        ORDER BY s.order_date,s.OrderId) AS order_rank
  FROM sushiland.members mb
	  JOIN sushiland.sales s
      ON mb.customer_id = s.customer_id
  WHERE
      s.order_date >= mb.join_date
 ORDER BY
      mb.customer_id,
      s.order_date
)
SELECT
  mt.customer_id,
  mt.join_date,
  mt.order_date,
  m.product_name
FROM member_timeline mt
  JOIN sushiland.menu m
    ON mt.product_id = m.product_id
WHERE
  mt.order_rank = 1
ORDER BY
  mt.customer_id;


+-------------+------------+------------+--------------+
| customer_id | join_date  | order_date | product_name |
+-------------+------------+------------+--------------+
| A           | 2023-09-12 | 2023-09-12 | Ramen        |
| B           | 2023-09-10 | 2023-09-10 | Ramen        |
| C           | 2023-09-20 | 2023-09-20 | Ramen        |
+-------------+------------+------------+--------------+
``` 


#### 7. Which item was purchased just before the customer became a member?

```sql
select m.Customer_Id,m.Join_Date,s.Order_Date,mu.Product_Name from sushiland.members m
join sushiland.sales s
on m.Customer_Id = s.Customer_Id
join sushiland.menu mu
on s.Product_Id = mu.Product_ID
where Join_Date < s.Order_Date
limit 10 ;

+-------------+------------+------------+--------------+
| Customer_Id | Join_Date  | Order_Date | Product_Name |
+-------------+------------+------------+--------------+
| C           | 2023-09-20 | 2023-09-30 | Ramen        |
| C           | 2023-09-20 | 2023-09-23 | Ramen        |
| C           | 2023-09-20 | 2023-09-26 | Ramen        |
| C           | 2023-09-20 | 2023-09-24 | Ramen        |
| C           | 2023-09-20 | 2023-09-26 | Ramen        |
| C           | 2023-09-20 | 2023-09-22 | Ramen        |
| C           | 2023-09-20 | 2023-09-22 | Ramen        |
| C           | 2023-09-20 | 2023-09-25 | Ramen        |
| C           | 2023-09-20 | 2023-09-26 | Ramen        |
| C           | 2023-09-20 | 2023-09-24 | Ramen        |
+-------------+------------+------------+--------------+
```

#### 8. What is the total items and amount spent for each member before they became a member?

```sql
SELECT
  items.customer_id,
  items.total_items,
  total.total_spent
FROM
      (SELECT
          mb.customer_id,
          COUNT(s.order_date) as total_items
      FROM sushiland.members mb
          JOIN sushiland.sales s
            ON mb.customer_id = s.customer_id
      WHERE
          s.order_date < mb.join_date
      GROUP BY
          mb.customer_id
      ) items
  JOIN
      (SELECT
          mb.customer_id,
          SUM(m.price) AS total_spent
      FROM sushiland.members mb
          JOIN sushiland.sales s
            ON mb.customer_id = s.customer_id
          JOIN sushiland.menu m
            ON s.product_id = m.product_id
      WHERE
          s.order_date < mb.join_date
      GROUP BY
          mb.customer_id
      ORDER BY
          mb.customer_id
      ) total
  ON items.customer_id = total.customer_id;

+-------------+-------------+-------------+
| customer_id | total_items | total_spent |
+-------------+-------------+-------------+
| A           |          46 |     5830.00 |
| B           |          47 |     5700.00 |
| C           |          66 |     8460.00 |
+-------------+-------------+-------------+
```    

#### Bonus Question: Join All The Things!  
(Re)create the table with customer id, order date, product name, product price, and Y/N on whether the customer was a member when placing the order.

```sql
SELECT
  s.customer_id,
  s.order_date,
  m.product_name,
  m.price,
  CASE WHEN s.order_date >= mb.join_date THEN 'Y'
       ELSE 'N' 
        END AS member
FROM sushiland.sales s
  LEFT JOIN sushiland.menu m
         ON s.product_id = m.product_id
  LEFT JOIN sushiland.members mb
         ON s.customer_id = mb.customer_id
ORDER BY
  s.customer_id,
  s.order_date 
  limit 10 ;

+-------------+------------+--------------+--------+--------+
| customer_id | order_date | product_name | price  | member |
+-------------+------------+--------------+--------+--------+
| A           | 2023-09-01 | Ramen        | 120.00 | N      |
| A           | 2023-09-01 | Ramen        | 120.00 | N      |
| A           | 2023-09-02 | Ramen        | 120.00 | N      |
| A           | 2023-09-02 | Sushi        | 100.00 | N      |
| A           | 2023-09-02 | Curry        | 150.00 | N      |
| A           | 2023-09-02 | Curry        | 150.00 | N      |
| A           | 2023-09-03 | Ramen        | 120.00 | N      |
| A           | 2023-09-03 | Ramen        | 120.00 | N      |
| A           | 2023-09-03 | Ramen        | 120.00 | N      |
| A           | 2023-09-03 | Ramen        | 120.00 | N      |
+-------------+------------+--------------+--------+--------+
```