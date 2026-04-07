create Database Messy_Ecommerce;

use Messy_Ecommerce;


--- Show All Data
select * from e_commerce;


--- Count of ID
select count(Distinct [ Customer Name]) As Unique_Customers from e_commerce;


--- Total Sales
select sum([Total]) As Total_Sales from e_commerce;


--- Total Sales per Payment Method
select [Payment Method] , sum([Total]) As Total_Sales
from e_commerce
group by ([Payment Method])
order by sum([Total]) Desc;


--- Total Sales per Years
select [Year] , sum([Total]) As Total_Sales
from e_commerce
group by [Year]
order by sum([Total]);


--- Total Sales per Product
select [ Product] , sum([Total]) As Total_Sales
from e_commerce
group by [ Product]
order by sum([Total]) Desc;


--- Top Product per Category
With Top_Product As (
select [Category] , [ Product] , sum([Total]) As Total_Sales , rank() over(Partition by [Category] order by sum([Total]) Desc) As Sales_Rank
from e_commerce
group by [Category] , [ Product]
)
select [Category] , [ Product] , Total_Sales 
from Top_Product
where Sales_Rank = 1;