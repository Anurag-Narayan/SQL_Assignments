--==================================================================================================================--

--Basics Questions:-

--==================================================================================================================--

---1-Create two Databases Name :- Brands , and  Products

Create database Brands
Create database Products

----------------------------------------------------------------------------------------------------------------------

---2-Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
---3-After Creating both the tables Add records in that tables (records are available above)

Create Table ITEMS_Table(Item_Id int, item_description varchar(max), vendor_nos int, vendor_name varchar(max), bottle_size int, bottle_price float)

Create Table PRODUCT_Table(Product_Id int, Country varchar(max), Product varchar(max), UnitsSold float, ManufacturingPrice float, SalePrice float, GrossSales float, Sales float, COGS float, Profit float, Date date, MonthNumber int, MonthName varchar(max), Year int)

----------------------------------------------------------------------------------------------------------------------

---4-Delete those product having the Units Sold 1618.5 , 888 and 2470.

delete from PRODUCT_Table
where UnitsSold in (1618.5, 888, 2470)

----------------------------------------------------------------------------------------------------------------------

---5-DROP the table and Create it again.

drop table PRODUCT_Table
drop table ITEMS_Table

Create Table ITEMS_Table(Item_Id int, item_description varchar(max), vendor_nos int, vendor_name varchar(max), bottle_size int, bottle_price float)

Create Table PRODUCT_Table(Product_Id int, Country varchar(max), Product varchar(max), UnitsSold float, ManufacturingPrice float, SalePrice float, GrossSales float, Sales float, COGS float, Profit float, Date date, MonthNumber int, MonthName varchar(max), Year int)


--==================================================================================================================--

--Intermediate Questions

--==================================================================================================================--

---Big Table :--

----------------------------------------------------------------------------------------------------------------------

----1-Find the Total Sale Price  and  Gross Sales

Select SUM(SalePrice) 'Total SalePrice', SUM(GrossSales) 'Total GrossSales' from PRODUCT_Table

----------------------------------------------------------------------------------------------------------------------

----2-In which year we have got the highest sales

Select Year from PRODUCT_Table
where Sales=(Select MAX(Sales) from PRODUCT_Table)

----------------------------------------------------------------------------------------------------------------------

----3-Which Product having the sales of $ 37,050.00

Select Product from PRODUCT_Table
where Sales=37050.00

----------------------------------------------------------------------------------------------------------------------

----4-Which Countries lies between profit of $ 4,605 to $  22 , 662.00

Select Country from PRODUCT_Table
where Profit between 4605 and 22662

----------------------------------------------------------------------------------------------------------------------

----5-Which Product Id having the sales of $ 24 , 700.00

Select Product_Id from PRODUCT_Table
where Sales=24700

--==================================================================================================================--

--Small Table :--

--==================================================================================================================--

---1-Find the item_description having the bottle size of 750

Select item_description from ITEMS_Table
where bottle_size=750

----------------------------------------------------------------------------------------------------------------------

---2-Find the vendor Name having the vendor_nos 305 , 380 , 391

Select vendor_name from ITEMS_Table
where vendor_nos in (305, 380, 391)

----------------------------------------------------------------------------------------------------------------------

---3-What is total Bottle_price 

Select SUM(bottle_price) 'Total bottle_price' from ITEMS_Table

----------------------------------------------------------------------------------------------------------------------

---4-Make Primary Key to Item_id

alter table ITEMS_Table
alter column Item_Id int not null

alter table ITEMS_Table
add constraint pk_Item_Id Primary Key(Item_Id)

----------------------------------------------------------------------------------------------------------------------

---5-Which item id having the bottle_price of $ 5.06

Select Item_Id from ITEMS_Table
where bottle_price=5.06

--==================================================================================================================--

--Advance Questions:--

--==================================================================================================================--

---1-Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 

Select IT.*, PT.* from ITEMS_Table IT
inner join PRODUCT_Table PT
on IT.Item_Id=PT.Product_Id

Select IT.*, PT.* from ITEMS_Table IT
full outer join PRODUCT_Table PT
on IT.Item_Id=PT.Product_Id

Select IT.*, PT.* from ITEMS_Table IT
left join PRODUCT_Table PT
on IT.Item_Id=PT.Product_Id

----Note: And yes, I did import both the tables first in my personal database, cause i wasn't taught to handle two different tables each in different databases.

----------------------------------------------------------------------------------------------------------------------

---2-Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 



Select IT.*, PT.* from ITEMS_Table IT
right join PRODUCT_Table PT
on IT.Item_Id=PT.Product_Id

Select * from ITEMS_Table
cross join PRODUCT_Table

----------------------------------------------------------------------------------------------------------------------

---3-Find the item_description and Product having the gross sales of 13,320.00

With DataCTE As
(
Select IT.*, PT.* from ITEMS_Table IT
inner join PRODUCT_Table PT
on IT.Item_Id=PT.Product_Id
)
Select item_description from DataCTE
where (GrossSales)=13320

----------------------------------------------------------------------------------------------------------------------

---4-Split the Item_description Column into Columns Item_desc1 and Item_desc2

Select item_description, LEFT(item_description, CHARINDEX(' ', item_description, CHARINDEX(' ', item_description, 1)+1)-1) 'desc1', RIGHT(item_description, LEN(item_description)-CHARINDEX(' ', item_description, CHARINDEX(' ', item_description, 1)+1)) 'desc2' from ITEMS_Table

--==================================================================================================================--
 