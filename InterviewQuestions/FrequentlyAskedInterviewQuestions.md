#### Find contribution of each product in revenue generated for each category.
```sql
select
	productcategory ,
	productname ,
	sales,
	sum(sales) over(partition by productcategory) as TotalRevenue,
	concat(cast(round(sales /sum(sales) over(partition by productcategory)*100,0) as char),'%') as ContributionPercentage 
from
	interviewquestion.productsales p
order by
	productcategory;

+-----------------+--------------+---------+--------------+------------------------+
| productcategory | productname  | sales   | TotalRevenue | ContributionPercentage |
+-----------------+--------------+---------+--------------+------------------------+
| Books           | Novel        |   15.00 |       125.00 | 12%                    |
| Books           | Textbook     |   80.00 |       125.00 | 64%                    |
| Books           | Magazine     |    5.00 |       125.00 | 4%                     |
| Books           | Cookbook     |   25.00 |       125.00 | 20%                    |
| Clothing        | T-Shirt      |   20.00 |       200.00 | 10%                    |
| Clothing        | Jeans        |   40.00 |       200.00 | 20%                    |
| Clothing        | Dress        |   60.00 |       200.00 | 30%                    |
| Clothing        | Shoes        |   80.00 |       200.00 | 40%                    |
| Electronics     | Laptop       | 1200.00 |      2250.00 | 53%                    |
| Electronics     | Smartphone   |  600.00 |      2250.00 | 27%                    |
| Electronics     | Tablet       |  350.00 |      2250.00 | 16%                    |
| Electronics     | Headphones   |  100.00 |      2250.00 | 4%                     |
| Furniture       | Sofa         |  800.00 |      1925.00 | 42%                    |
| Furniture       | Dining Table |  450.00 |      1925.00 | 23%                    |
| Furniture       | Bed          |  600.00 |      1925.00 | 31%                    |
| Furniture       | Chair        |   75.00 |      1925.00 | 4%                     |
+-----------------+--------------+---------+--------------+------------------------+
```
#### 2. Compare current year and previous year sales and find the growth percentage

```sql
with sales_cte as (
select
	`year` as currentYear
,
	sales as currentYearSales 
,
	coalesce (lag(sales) over(
	order by year),
	0) as PreviousYearSales
from
	interviewquestion.yearly_sales ys 
)
select
	CurrentYear,
	CurrentYearSales,
	PreviousYearSales,
	concat(cast(ROUND((currentYearSales-PreviousYearSales)/PreviousYearSales*100,0) as char),'%') as PercentageGrowth
from
	sales_cte;
+-------------+------------------+-------------------+------------------+
| CurrentYear | CurrentYearSales | PreviousYearSales | PercentageGrowth |
+-------------+------------------+-------------------+------------------+
|        2015 |        100000.00 |              0.00 | NULL             |
|        2016 |        120000.00 |         100000.00 | 20%              |
|        2017 |        150000.00 |         120000.00 | 25%              |
|        2018 |        180000.00 |         150000.00 | 20%              |
|        2019 |        200000.00 |         180000.00 | 11%              |
|        2020 |        210000.00 |         200000.00 | 5%               |
|        2021 |        220000.00 |         210000.00 | 5%               |
|        2022 |        230000.00 |         220000.00 | 5%               |
|        2023 |        240000.00 |         230000.00 | 4%               |
+-------------+------------------+-------------------+------------------+
```

#### Compare Current Month sales and previous year month sales eg compare 1/1/2022 and 1/1/2021 sales amount

```sql 

select
	ms1.MonthDate ,
	ms1.salesamount as currentSales,
	ms2.salesamount as previousYearSalesamount,
	(ms1.salesamount - ms2.salesamount)/ms2.salesamount 
from
	interviewquestion.monthly_sales ms1
left join interviewquestion.monthly_sales ms2
on
	DATE_ADD(ms1.monthdate, interval -12 month) = ms2.MonthDate;

```
#### Remove Duplicates

```sql 

with student_cte as (
select
	studentID ,
	student_name ,
	age,
	row_number() over(partition by student_name order by studentid) as duplicateIdentifier
from
	interviewquestion.student s
	order by student_name 
	)
	select *  from student_cte where duplicateIdentifier >1

```