create database AUG2026; 
use AUG2026; 


select *from employee; 
select *from department ;

create table EMPLOYEE ( 
	EMP_ID INT PRIMARY KEY ,
    EMP_NAME VARCHAR(50) ,
    DEPT VARCHAR(50) , 
    MANAGER_ID INT , 
    SALARY FLOAT) ; 

INSERT INTO EMPLOYEE VALUES
(101, 'Amit',    'D01', NULL, 85000),
(102, 'Sneha',   'D02', 101,  72000),
(103, 'Rahul',   'D01', 101,  68000),
(104, 'Priya',   'D03', 101,  95000),
(105, 'Karan',   'D02', 102,  72000),
(106, 'Neha',    'D04', 102,  58000),
(107, 'Arjun',   'D03', 104,  88000),
(108, 'Pooja',   'D04', 106,  58000),
(109, 'Vikas',   'D01', 103,  65000),
(110, 'Riya',    'D05', 101,  45000);

CREATE TABLE DEPARTMENT (
    DEPT VARCHAR(10) PRIMARY KEY,
    DEPTNAME VARCHAR(50),
    LOCATION VARCHAR(50),
    BUDGET DECIMAL(12,2),
    HOD VARCHAR(50)
);

INSERT INTO DEPARTMENT VALUES
('D01', 'IT',         'Hyderabad', 5000000, 'Dr. Mehta'),
('D02', 'HR',         'Bangalore', 3000000, 'Dr. Sharma'),
('D03', 'Finance',    'Mumbai',    4500000, 'Dr. Rao'),
('D04', 'Operations', 'Hyderabad', 3500000, 'Dr. Khan'),
('D05', 'Sales',      'Chennai',   4000000, 'Dr. Reddy'),
('D06', 'Marketing',  'Pune',      2500000, 'Dr. Singh'),
('D07', 'Security',   'Delhi',     2800000, 'Dr. Verma'),
('D08', 'Research',   'Hyderabad', 6000000, 'Dr. Iyer'),
('D09', 'Legal',      'Mumbai',    2200000, 'Dr. Das'),
('D10', 'Admin',      'Kolkata',   1800000, 'Dr. Patel');

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
(101, 'Ada', 'Lagos'),
(102, 'John', 'Abuja'),
(103, 'Mercy', 'Owerri'),
(104, 'David', 'Enugu'),
(105, 'Grace', 'Lagos');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    total_amount DECIMAL(10,2)
);


INSERT INTO orders (order_id, customer_id, product, total_amount)
VALUES
(1001, 101, 'Laptop', 450000),
(1002, 102, 'Phone', 180000),
(1003, 106, 'Monitor', 150000),
(1004, 105, 'Tablet', 120000),
(1005, 103, 'Laptop', 450000);

SELECT *FROM ORDERS ; 
SELECT *FROM CUSTOMERS ;


drop database AUG2026;
drop table employee;
truncate table employee;


SELECT *FROM employee
LIMIT 3 OFFSET 4;
SELECT *FROM employee
LIMIT 4, 3;    									  -- BOTH WORK THE SAME 

SELECT *
FROM DEPARTMENT
LIMIT 3 OFFSET 4;

-- USE OF WHERE CLAUSE 
  
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE Salary < 60000;

SELECT DEPT , EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT = 'D01'
AND SALARY >  65000;

SELECT DEPT , EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT = 'D01'or SALARY > 65000;          		    -- AND OR 

select *from employee
-- where dept in ('D01', 'D04');                    	 -- IN 
WHERE DEPT NOT IN ('D03'); 

SELECT *
FROM EMPLOYEE
WHERE MANAGER_ID IN (101, 102)
AND SALARY > 72000;  

select *
from employee
where MANAGER_ID in (101, 102) and DEPT in ('D01' , 'D02') AND SALARY > 65000;

-- USE OF DISTINCT 

SELECT DISTINCT (COUNTRY) AS Unique_country							
FROM SALES ;

select count(distinct(Country)) as uniq_count from sales ;

select count(distinct(Customer_Name)) as uniq_count from sales 
where Customer_Name = "Ruby Patel";

SELECT 
	Customer_Name, COUNT(*) AS Number_of_Orders                 -- count of cust who shopped more than once 
FROM SALES 
GROUP BY Customer_Name 
HAVING COUNT(*) > 1 
order by Number_of_Orders desc
limit 3 offset 1 ; 

SELECT COUNT(ORDER_ID)
FROM SALES;

select distinct(Segment) from sales;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- ORDER BY AND LIMIT

select *from  sales
where Region = North
And Ship_Mode = Economy ;

SELECT *FROM SALES
WHERE Ship_Mode = 'Economy'
ORDER BY Total_Amount DESC
LIMIT 5;

select *from department
order by BUDGET ASC 
limit 1;

SELECT DEPT ,  min(SALARY)FROM employee 	          	 	-- min salary of every department 
group by DEPT; 
select *from employee;


SELECT *													-- MIN BUDGET OF DEPARTMENT
FROM department
WHERE 
BUDGET = (
			SELECT MIN(BUDGET) FROM department
); 

SELECT DEPTNAME, MIN(BUDGET) 
FROM department
GROUP BY DEPTNAME ;

SELECT DEPTNAME , BUDGET 										-- as lowest_budget 
FROM department
WHERE BUDGET = (SELECT MIN(BUDGET) FROM department);

SELECT MIN(BUDGET)  as minimum FROM department;

SELECT max(BUDGET)  as maximum FROM department;

SELECT sum(BUDGET)  as total FROM department;

SELECT avg(max(BUDGET))  as maximum FROM department;

select count(`DEPARTMENT ID`) as total 
from employee ;

select count(*) 
from sales ;

select count(City) 
from sales ;

-- how to add another column in the table 


SELECT *FROM EMPLOYEE;									-- select statement of all three table 
SELECT * FROM DEPARTMENT;
SELECT *FROM SALES;



-- -- -- -- -- --- --- --- --- WILDCARD -- -- -- -- --- --- --- --  

select * from employee 
where EMP_NAME LIKE 'p%' ;

select * from employee 
where EMP_NAME LIKE 'PR%' ;

select * from employee 
where EMP_NAME LIKE 'S__h%' ;

 UPDATE employee									-- UPDATE THE TABLE CONTENT 
 SET EMP_NAME = 'Amit Kumar' 
 WHERE EMP_ID = '101' ; 
 
 SELECT *FROM EMPLOYEE ;

update employee 
set EMP_NAME = case EMP_ID
when 102 then 'sneha Kumari'
when 107 then 'Arjun Kumar' 
else EMP_NAME
END ; 

UPDATE employee
SET EMP_NAME = CASE EMP_ID
    WHEN 102 THEN 'sneha Kumari'
    WHEN 107 THEN 'Arjun Kumar'
    ELSE EMP_NAME 
    END
WHERE EMP_ID IN (102, 107);

SET SQL_SAFE_UPDATES = 1;

delete from employee 
where EMP_ID = 101 ; 

delete from employee 
where EMP_ID in(101, 103, 108); 

-- -- -- -- -- JOINS -- -- -- -- -- 

select *from customers c
join orders o 
using (customer_id) ;

/*The business wants to know which customers have actually placed an order.
They need a report showing:
Customer name
City
Product
Order amount*/

select c.customer_name, c.city, o.product, o.total_amount from customers c
join orders o 
on c.customer_id = o.customer_id ; 

SELECT * FROM customers;
SELECT * FROM orders;

select DEPT, sum(salary) total_sal 
from employee 
group by DEPT; 

-- -- -- -- -- -- -- -- ALTER TABLE -- --- -- -- - -- - - --- -- - -

alter table DEPARTMENT 
rename column dept to `DEPARTMENT ID` ; 

rename table new_employee to employee ;

select * from employee ;

-- total salary by average salary 

select `DEPARTMENT ID`, avg(Salary) avg_salary from employee 
group by `DEPARTMENT ID`; 


-- waht is the total sales revenue by each region 


select region, sum(Total_Amount) as total_revenue from sales 
group by region
order by total_revenue desc ;

select region, sum(Total_Amount) as total_revenue from sales 
group by region
order by total_revenue desc
limit 1 offset 1 ;


-- TOP 3 COUNTRY GENERATING HIGHEST REVENUE 

select Country, sum(Total_Amount) as total_revenue from sales 
group by Country
order by total_revenue desc 
limit 3;


-- AVG UNIT PROFIT BY SHIP MODE 

select Ship_Mode , avg(Unit_Profit) from sales 
group by Ship_Mode
order by avg(Unit_Profit);

select Ship_Mode , round(avg(Unit_Profit),2) from sales 				-- ROUND FUNCTION 
group by Ship_Mode
order by avg(Unit_Profit) desc ;

select 2.8345934759 as decimal_randomvalue ; 

select 17/3 as division ;
select round(17/3 ,0) as division ;

select round(2.8345934759 , 1) as decimal_randomvalue ; 

select floor(2.987645);

select ceil(8.01);


-- calc the total revenue by region for each shipmode 

select 	
		Ship_Mode , Region ,  sum(Total_Amount) TOTAL_REVENUE
from sales 
group by Region, Ship_Mode 
order by Region, TOTAL_REVENUE desc ; 			  				-- taking both so that there is no error bcz possibility of error 

-- display highest revenue from each region only 1 

-- -- --- --- --- -- changing format of date column -- -- -- -- -- -- -- -- -- -- -- 

ALTER TABLE sales
ADD COLUMN New_Order_Date DATE;

UPDATE sales
SET New_Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');

SET SQL_SAFE_UPDATES = 0;

select Order_Date, New_Order_Date from sales ;


-- -- -- -------date function amd date extraxtion y m d 

select str_to_date('03-09-2026', '%d-%m- %y') as sqldate ;  -- date os by defalut char type. (Y y)  

select date_format(str_to_date('03-09-2026', '%d-%m- %Y'), '%d-%m %Y' )  as `d-my` ;

select date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%m-%d-%Y' )  as `m d y ` ;

select date_format(str_to_date('03-09-2026', '%d-%m- %Y'), '%Y' )  as `y` ;

--

select day(str_to_date('11-09-2026', '%d-%m- %Y')) as DAY_numbr ;

select dayname(str_to_date('11-09-2026', '%d-%m- %Y')) as DAY_name ;

select month(str_to_date('11-09-2026', '%d-%m- %Y')) as month_numbr ;

select monthname(str_to_date('11-09-2026', '%d-%m- %Y')) as month_numbr ;

select year(str_to_date('11-09-2026', '%d-%m- %Y')) as year_numbr ;


-- -- -- ------------- -- from full date only extract d and m this is date extraction. we extract quarter also 


select Order_Date from sales ;

SELECT YEAR(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_Year FROM sales;

SELECT YEAR(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_Year FROM sales
ORDER BY Order_Year DESC;

SELECT YEAR(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_Year FROM sales
where year (STR_TO_DATE(Order_Date, '%d-%m-%Y')) in (2019, 2020); 

SELECT Country, Region,  YEAR(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_Year FROM sales
order by Order_Year desc ;

select year(New_Order_Date) year_num from sales ;

select year(New_Order_Date) as year_num from sales
where year(New_Order_Date) in (2019, 2020)
order by year_num ;

select month(New_Order_Date) month_num from sales ;

select distinct monthname(New_Order_Date) month_num from sales ;

SELECT DISTINCT
    MONTHNAME(New_Order_Date) AS month_name,
    YEAR(New_Order_Date) AS year_num
FROM sales;

SELECT DISTINCT
    CONCAT(MONTHNAME(New_Order_Date), ' ', YEAR(New_Order_Date)) AS month_year
FROM sales;

select New_Order_Date, monthname(New_Order_Date) month_name from sales ; 

select New_Order_Date, dayname(New_Order_Date) day_name from sales
where dayname(New_Order_Date) not in ('saturday' , 'Sunday'); 

select date_format((STR_TO_DATE(Order_Date, '%d-%m-%Y')), '%m-%Y' )  as `my` from sales ;

select dayname(str_to_date('03-09-2026', '%d-%m- %Y')) as DAY_name ;

select DAYNAME(str_to_date(Order_Date, '%d-%m-%Y')) as DAY_name from sales ;

select New_Order_Date, dayname(New_Order_Date) as day_nm from sales ; 

select Order_Date, dayname(New_Order_Date) as day_name , 
				   monthname(New_Order_Date) as month_name from sales ;
                   
select dayname(curdate()) as current_day ;

-- -- -- --- -- WHICH REGION AND STATE CONTRIBUTE THE HIGHEST TOTAL SALES REVENEUE 

SELECT Region,State,SUM(Total_Amount) AS Total_Revenue
FROM sales
GROUP BY Region, State
ORDER BY Total_Revenue DESC
LIMIT 1;

-- -- -- --------- -- WHO ARE THE TOP 10 CUSTOMER BY TOTAL PURCHASE AMOUNT (COUNT HOW MANY TIME A CUSTOMER SHOPPED )

SELECT Customer_Name, SUM(Total_Amount) AS TOT_PURCHASE  FROM SALES 
GROUP BY Customer_Name
ORDER BY  TOT_PURCHASE DESC 
LIMIT 10 ;

/*SELECT Customer_Name, SUM(Total_Amount)  AS TOT_PURCHASE  , COUNT(Total_Amount) FROM SALES 
GROUP BY Customer_Name
ORDER BY  TOT_PURCHASE DESC 
LIMIT 10 ;*/

SELECT Customer_Name, SUM(Total_Amount) AS TOT_PURCHASE, count(Customer_Name) as cust_count FROM SALES 
GROUP BY Customer_Name
ORDER BY TOT_PURCHASE  DESC 
LIMIT 10 ;


-- what are the top 5 best selling products by total quantity sold and revenue generated ?

SELECT Product_Name, 
       SUM(Sold_Quantity) ,
       SUM(Total_Amount) as Total_Revenue from sales 
group by Product_Name 
order by SUM(Sold_Quantity) desc 
limit 5;


-- top 5 selling products 

SELECT Product_Name, SUM(Sold_Quantity) AS Total_Quantity FROM sales
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- top 5 product by revenue 

SELECT Product_Name, SUM(Total_Amount) AS Total_Revenue FROM sales
GROUP BY Product_Name
ORDER BY Total_Revenue DESC
LIMIT 5;



-- which top 3 product categories and sub categories are the most profitable?

select Category, Sub_Category, sum(Unit_Profit*Sold_Quantity) total_profit from sales 
group by Category, Sub_Category 
order by total_profit desc								-- order by total_profit desc ;
limit 3;

select Category, Sub_Category, sum(Unit_Profit*Sold_Quantity) total_profit from sales 
group by Category, Sub_Category 
order by Category, total_profit desc ;



-- what is the monthly sales trend across the dataset - are the sales increasing or decreasing  -- FOR SALES TREND WE USE TOTAL AMOUNT OR THE REVENUE 


select 
		year(str_to_date(Order_Date, '%d-%m-%Y')) year_name,	
        monthname(str_to_date(Order_Date, '%d-%m-%Y')) month_name ,  	
        sum(Total_Amount) total_revenue 
from sales 
group by year(str_to_date(Order_Date, '%d-%m-%Y')) , monthname(str_to_date(Order_Date, '%d-%m-%Y'))
order by year_name ;


SET SQL_SAFE_UPDATES = 0;
ALTER TABLE sales
ADD COLUMN New_Order_Date DATE;

UPDATE sales
SET New_Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');

select Order_Date, New_Order_Date from sales ;

select 
		year(New_Order_Date) year_n,	
        monthname(New_Order_Date) month_name ,  	
        sum(Total_Amount) total_revenue 
from sales 
group by year(New_Order_Date) , monthname(New_Order_Date);


-- find the yearly total revenue 


select year(New_Order_Date) year , sum(Total_Amount)  as Yearly_Sales from sales 
group by year(New_Order_Date) 
ORDER BY  year DESC  ;


-- which shipping mode is most preferred by the customer and how does it impact delivery cost/profit ?

SELECT 
    Ship_Mode,
    COUNT(Ship_Mode) AS order_count,
    SUM(Unit_Profit * Sold_Quantity) AS total_profit
FROM sales
GROUP BY Ship_Mode
ORDER BY total_profit DESC;


-- what is the average order value per customer per region ? AOV = Total Revenue ÷ Number of Orders


select Customer_Name, Region, avg(Total_Amount / Sold_Quantity) AOV from sales 
group by Customer_Name, Region 
order by AOV ; 


-- which segments (consumer , corporate , home office ) brings the highest revenue and profit ?

select Segment, sum(Total_Amount) Total_revenue , SUM(Unit_Profit * Sold_Quantity) AS total_profit from sales 
group by  Segment 
order by Total_revenue desc ;


-- -- -- -- -- -- -- -- -- -- -- -- -- --


alter table sales 
add column Total_Profit int ; 

update sales
SET Total_Profit = Unit_Profit*Sold_Quantity ;


-- STORED PROCEDURE (SP) IN SQL 

/*												-- SYNTAX 
DELIMITER $$ 
CREATE PROCEDURE SP_NAME()
BEGIN 
		ANY SQL QUERY ;
END $$ 
*/


DELIMITER $$ 
CREATE PROCEDURE Y_SALES ()						-- SPNAME IS USER DEFINDED 
BEGIN 
		select Segment, sum(Total_Amount) Total_revenue , SUM(Unit_Profit * Sold_Quantity) AS total_profit from sales 
group by  Segment 
order by Total_revenue desc ;
END $$ 

CALL Y_SALES() ;


DELIMITER $$ 
CREATE PROCEDURE A()					-- SAVE/STORE the query under SP to show top customers 
BEGIN 
		SELECT Customer_Name, SUM(Total_Amount) AS TOT_PURCHASE  FROM SALES 
GROUP BY Customer_Name
ORDER BY  TOT_PURCHASE DESC 
LIMIT 10 ;
 
END $$ 

CALL A() ;								-- calling the same query by SP name only 



-- JOINS (INNER , LEFT , RIGHT )


SELECT C.customer_id, C.customer_name, O.product FROM customers C
JOIN orders O 
ON C.customer_id = O.customer_id; 


-- LEFT JOIN SHOWS ALL RECORDS FROM FIRST TABLE AND MATCHING RECORDS FROM THE SECOND TABLE 


SELECT C.customer_id, C.customer_name, O.product, O.customer_id
FROM CUSTOMERS C 
LEFT JOIN ORDERS O 
ON C.customer_id = O.customer_id;

-- -- RIGHT JOIN 

SELECT C.customer_id, C.customer_name, O.product, O.customer_id
FROM CUSTOMERS C 
RIGHT JOIN ORDERS O 
ON C.customer_id = O.customer_id
WHERE PRODUCT = 'LAPTOP'
ORDER BY O.customer_id ;

SELECT *FROM ORDERS ; 
SELECT *FROM CUSTOMERS ;

-- SELF JOIN --

SELECT 
    e.EMP_NAME AS Employee,
    m.EMP_NAME AS Manager
FROM employee e
JOIN employee m
ON e.MANAGER_ID = m.EMP_ID;

-- COMPARE EMP SALARY WITH MAN SALARY , EMP WHIH SALARY IS GREATER TAHAN HIS EMP 

SELECT 
		E.EMP_NAME AS EMP_NAME, 
		E.SALARY AS EMP_SALARY , 
        M.EMP_NAME AS MANAGER_NAME ,
        M.SALARY AS MANAGER_SALARY 
FROM employee e
JOIN employee m
ON e.MANAGER_ID = m.EMP_ID
WHERE E.SALARY > M.SALARY;
WHERE E.SALARY < M.SALARY ;




-- -- -- UNION -- -- -- 
/* IT COMBINES TWO OR MORE SELECT STATEMENTS FROM SAME OR FROM DIFFERENT TABLE 
union : it does not allow duplicate values 
union all : allows duplicate values
intersect : allows only common values 
number of col must be same in both SELECT statement  
data type of col must be same in both SELECT statement 
col info should be same in both SELECT statement
*/

SELECT customer_id FROM CUSTOMERS 
UNION 
SELECT customer_id FROM ORDERS ;

SELECT customer_id FROM CUSTOMERS 
UNION ALL
SELECT customer_id FROM ORDERS ;

SELECT customer_id FROM CUSTOMERS 
INTERSECT
SELECT customer_id FROM ORDERS ;


-- -- -- -- -- -- -- -- -- RANKING FUNC -- -- -- --- -- -- -- -- -- -- - -- -- -- -- 
-- ROW NUMBER ()
-- RANK 
-- DENSE RANK 
-- NTILE 


CREATE TABLE STUDENT (
    STUD_ID INT PRIMARY KEY,
    STUD_NAME VARCHAR(50),
    MARKS INT
);

INSERT INTO STUDENT (STUD_ID, STUD_NAME, MARKS) VALUES
(1, 'Amit', 85),
(2, 'Sneha', 92),
(3, 'Ravi', 78),
(4, 'Priya', 85),
(5, 'Sunita', 90),
(6, 'Kiran', 92),
(7, 'Meha', 72),
(8, 'Ankit', 80),
(9, 'Pooja', 78),
(10, 'Rahul', 95);

select *from student
ORDER BY MARKS DESC 
LIMIT 1 ;

select *from student
ORDER BY MARKS DESC 
LIMIT 1,1 ;

SELECT STUD_NAME, MARKS , ROW_NUMBER() OVER (ORDER BY MARKS DESC) AS UNIQ_RANK 
FROM STUDENT ; 																			-- GIVES NORMAL SEQUENCE WO TAKING CARE OF TIES 


SELECT STUD_NAME, MARKS , RANK() OVER (ORDER BY MARKS DESC) AS UNIQ_RANK        
FROM STUDENT ; 																			-- BREAKS SEQ AFTER TIE


SELECT STUD_NAME, MARKS , DENSE_RANK() OVER (ORDER BY MARKS DESC) AS UNIQ_RANK        
FROM STUDENT ; 																			-- DOES NOT BREAK SEQ 


SELECT STUD_NAME, MARKS , NTILE(2) OVER (ORDER BY MARKS DESC) AS UNIQ_RANK        
FROM STUDENT ; 																			-- GIVES RANK IN GROUPS 



-- -- -- -- -- -- -- -- -- -- -- CTE 
-- to see the desired rank (nth rank ) position , to delete dup records 

with DESIRED_RANK AS 
(
SELECT STUD_NAME, MARKS , DENSE_RANK() OVER(ORDER BY MARKS DESC) AS SPECIFIC_RANK   
FROM STUDENT 	
)
SELECT *FROM DESIRED_RANK
WHERE SPECIFIC_RANK IN (3,5,6); 

-- -- -- -- -- -- -- -- -- VIEW ---- -- -- --- - ---- --

CREATE VIEW RANKING_FN AS 
SELECT STUD_NAME,
       MARKS,
       ROW_NUMBER() OVER(ORDER BY MARKS DESC) AS UNIQUE_RANK,
       RANK() OVER(ORDER BY MARKS DESC) AS RANK_WITH_SEQ_BREAK,
       DENSE_RANK() OVER(ORDER BY MARKS DESC) AS PROPER_RANK,
       NTILE(2) OVER(ORDER BY MARKS DESC) AS GROUP_RANK
FROM STUDENT;

SELECT *FROM RANKING_FN;


SELECT ABS(-10) AS ABSOLUTEVALUE ;


SELECT ABS(MARKS)AS ABSOLUTEVALUE FROM STUDENT ;


SELECT ABS(MARKS*2)AS ABSOLUTEVALUE FROM STUDENT ;

SELECT ROUND(SQRT(MARKS) , 2) AS SQR_ROOT FROM STUDENT ;

 
 UPDATE EMPLOYEE 
 SET MANAGER_ID = NULL 
 WHERE EMP_ID  = 103 ;
 
 
 SELECT *FROM EMPLOYEE ;
 
 UPDATE EMPLOYEE 
 SET MANAGER_ID = 99 
 WHERE EMP_ID = 108; 
 
 SELECT EMP_ID, IFNULL(MANAGER_ID, 'NO MANAGER') AS MANAGER_STATUS FROM EMPLOYEE ; 
 
 
 
 
 
 