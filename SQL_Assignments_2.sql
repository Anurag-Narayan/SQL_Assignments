
--1-Create   Database Name as Order_Stores_Data 

Create Database Order_Stores_Data

------------------------------------------------------------------------------------------------------------------

--2-Create two Table names as Orders_Table and Stores_Table
--3-Insert All records present here in the Orders_table and Stores_Table.

Create Table Orders_Table(OrderDate date, Region varchar(max), Rep varchar(max), Order_Item varchar(max), Units int, UnitCost float, Total_Price float, Order_Id int)

Create Table Stores_Table(Store_Id int, StoreType varchar(max), Assortment int, CompetitionDistance int, Month int, Year int, PromoInterval varchar(max))

------------------------------------------------------------------------------------------------------------------

--3-Make Order_Id  Column as Primary Key.

alter table Orders_Table
alter column Order_Id int not null

alter table Orders_Table
add constraint pk_Orders_Table Primary Key(Order_Id)

------------------------------------------------------------------------------------------------------------------

--4-Add one Column Name  as Store_Names and insert the records given above in Stores table.

alter table Stores_Table add Store_Names varchar(max)

update Stores_Table set Store_Names='Car' where Store_Id=1
update Stores_Table set Store_Names='Bikes' where Store_Id=2
update Stores_Table set Store_Names='Hardware' where Store_Id=3
update Stores_Table set Store_Names='Electrics' where Store_Id=4
update Stores_Table set Store_Names='Fibers' where Store_Id=5
update Stores_Table set Store_Names='Elastics' where Store_Id=6
update Stores_Table set Store_Names='Books' where Store_Id=7
update Stores_Table set Store_Names='Shoes' where Store_Id=8
update Stores_Table set Store_Names='Clothes' where Store_Id=9
update Stores_Table set Store_Names='Scraps' where Store_Id=10

------------------------------------------------------------------------------------------------------------------

--5-Make Stored_Id as a Foreign Key with reference too Orders_Table 

alter table Stores_Table
add constraint fk_Stores_Table Foreign Key(Store_Id)
references Orders_Table(Order_Id)

------------------------------------------------------------------------------------------------------------------

--6-Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

update Orders_Table set Order_Item='Compass' where Order_Id=3
update Orders_Table set Order_Item='Torch' where Order_Id=4
update Orders_Table set Order_Item='Phone' where Order_Id=5
update Orders_Table set Order_Item='Laptop' where Order_Id=7
update Orders_Table set Order_Item='Box' where Order_Id=9

------------------------------------------------------------------------------------------------------------------

--7-Update the missing records in the PromoInterval Column in Stores Table.

update Stores_Table set PromoInterval='Apr' where Store_Id=4
update Stores_Table set PromoInterval='Jul' where Store_Id=7
update Stores_Table set PromoInterval='Sep' where Store_Id=9

------------------------------------------------------------------------------------------------------------------

--8-Rename the column name  of Assortment to Store_Nos in Stores_Table.

exec sp_rename 'Stores_Table.Assortment', 'Store_Nos', 'column'

------------------------------------------------------------------------------------------------------------------

--9-Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.

exec sp_rename 'Orders_Table.Order_Item', 'Item_name', 'column'
exec sp_rename 'Orders_Table.Rep', 'Customers_name', 'column'

------------------------------------------------------------------------------------------------------------------

--10-Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.

Select * from Orders_Table
order by UnitCost desc

Select * from Orders_Table
order by Total_Price asc

------------------------------------------------------------------------------------------------------------------

--11-Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.

exec sp_rename 'Orders_Table.Customers_name', 'Cus_Name', 'column'

Select Region, COUNT(Cus_Name) 'Cus_No' from Orders_Table
group by Region

------------------------------------------------------------------------------------------------------------------

--12-Find the sum of Total_Price Column and Unit Cost  in Orders_Table 

Select Total_Price + UnitCost 'Total_Price plus UnitCost' from Orders_Table

------------------------------------------------------------------------------------------------------------------

--13-Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.

With Order_Stores_Table As
(
Select OT.*, ST.* from Orders_Table OT
inner join Stores_Table ST
on OT.Order_Id=ST.Store_Id
)
Select OrderDate, UnitCost, StoreType, Year from Order_Stores_Table

------------------------------------------------------------------------------------------------------------------

--14-Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9

exec sp_rename 'Orders_Table.Item_name', 'Order_Item', 'column'

Select Order_Item, Region from Orders_Table
where Order_Id in (4, 5, 6, 9)

------------------------------------------------------------------------------------------------------------------

--15-Show me year  whose ComptetitionDistance is 29910  , 310 , 3160

Select Year from Stores_Table
where CompetitionDistance in (29910, 310, 3160)

------------------------------------------------------------------------------------------------------------------

--16-Give me that Item_name whose  Total_Price is greater than 200 and less than 400

exec sp_rename 'Orders_Table.Order_Item', 'Item_name', 'column'

Select Item_name from Orders_Table
where Total_Price between 200 and 400

------------------------------------------------------------------------------------------------------------------

--17-Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

exec sp_rename 'Stores_Table.CompetitionDistance', 'CD', 'column'

------------------------------------------------------------------------------------------------------------------

--18-What is the Total Count of Stores_Type and CD columns

Select COUNT(StoreType)+COUNT(CD) 'Total Count of Stores_Type and CD' from Stores_Table

------------------------------------------------------------------------------------------------------------------

--19-Apply the Cross Join in  Orders_Table and Stores_Table.

Select * from Orders_Table
cross join Stores_Table

------------------------------------------------------------------------------------------------------------------

--20-DROP both the databases

---Droped both the databases manually

------------------------------------------------------------------------------------------------------------------
