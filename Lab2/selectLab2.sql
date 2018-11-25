use Northwind

select * from Products;

-- 1.a

select Products.ProductName, Products.UnitPrice, 'Денежных единиц' as valuta, Categories.CategoryName,
       Suppliers.CompanyName, Suppliers.Country, Products.UnitsOnOrder
from Suppliers, Products, Categories
where Products.CategoryID = Categories.CategoryID and Products.SupplierID = Suppliers.SupplierID and Products.UnitPrice < 20 and Products.UnitsOnOrder = 0
order by Products.UnitPrice;

-- 1.б

select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Customers.Country
from Orders, Customers
where  Customers.CompanyName not like '%a%' or (Orders.OrderDate between '19970801' and '19970830') or Customers.Country IN ('USA')
order by Orders.OrderDate desc;

-- 1.в

select Orders.OrderID, Orders.OrderDate, Orders.ShippedDate,
       DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate) as deliveryTime, Customers.CompanyName,
       (select count(*) from Orders where Customers.CustomerID = Orders.CustomerID) as ordersCount, Customers.Country
from Orders inner join Customers on (Orders.CustomerID = Customers.CustomerID)
where  (Orders.ShippedDate is not null and Orders.OrderDate between '19970801' and '19970830') or Customers.Country IN ('Germany')
order by Orders.OrderDate desc;

-- 1.г

select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Customers.Country from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID
where Customers.Country like 'U%';

-- 1.д

select Categories.CategoryName ,count(Products.CategoryID) as categoryCount, avg(Products.UnitPrice) as middlePrice from Categories, Products
where Products.CategoryID = Categories.CategoryID and Products.UnitPrice >= 10 and Categories.CategoryName not like '%ai%'
group by Categories.CategoryName;

-- 1.е

select Suppliers.CompanyName, Categories.CategoryName, count(*) as count
from Categories, Suppliers, Products
where Suppliers.SupplierID = Products.SupplierID and Categories.CategoryID = Products.CategoryID
group by grouping sets (Suppliers.CompanyName, Categories.CategoryName), (Categories.CategoryName);

select Suppliers.CompanyName, Categories.CategoryName, count(*) as count
from Categories, Suppliers, Products
where Suppliers.SupplierID = Products.SupplierID and Categories.CategoryID = Products.CategoryID
group by rollup (Suppliers.CompanyName, Categories.CategoryName);

select Suppliers.CompanyName, Categories.CategoryName, count(*) as count
from Categories, Suppliers, Products
where Suppliers.SupplierID = Products.SupplierID and Categories.CategoryID = Products.CategoryID
group by cube (Suppliers.CompanyName, Categories.CategoryName);

-- 1.ж

select Products.ProductName, Categories.CategoryName
from Products, Categories
except
select Products.ProductName, Categories.CategoryName
from Products, Categories where Products.CategoryID = Categories.CategoryID;

-- 1.з

select Customers.CompanyName, Orders.OrderDate, Orders.Freight
from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID
where Orders.Freight < (select avg(Orders.Freight) from Orders)
order by Orders.Freight;

-- 1.и

select Products.ProductName, Categories.CategoryName
from Products inner join Categories on Products.CategoryID = Categories.CategoryID
where exists (select Categories.CategoryName
from Categories where Categories.CategoryName = 'Seafood');

-- 1.к

create table Categories_0(
  CategoryID int primary key,
  CategoryName nvarchar(15) unique not null ,
  Description ntext,
  Picture image
);

insert into Categories_0 select * from Categories;
select * from Categories;
select * from Categories_0;

update Categories_0 set Categories_0.CategoryName = 'Beverages_0' where Categories_0.CategoryName = 'Beverages';
update Categories_0 set Categories_0.CategoryName = 'Condiments_0' where Categories_0.CategoryName = 'Condiments';
update Categories_0 set Categories_0.CategoryName = 'Seafood_0' where Categories_0.CategoryName = 'Seafood';

select Categories.CategoryID, Categories.CategoryName
from Categories
union
select Categories_0.CategoryID, Categories_0.CategoryName
from Categories_0;

-- drop table Categories_0;

-- 2.1

select Products.UnitsInStock from Products where Products.UnitsInStock > CAST(24 As int);

-- 2.2

select Products.UnitsInStock from Products where Products.UnitsInStock > CONVERT(int, 24);

-- 2.3

select Orders.OrderDate from Orders where Orders.OrderDate = CONVERT(datetime, '19970212');

-- 2.4

select Orders.OrderDate from Orders where month(Orders.OrderDate) = month(getdate());

-- 2.5

select Products.UnitPrice, SQUARE(Products.UnitPrice) As Kvadrat from Products;

-- 2.6

select Products.UnitPrice from Products where Products.UnitPrice < ABS(-50);

-- 2.7

select ROUND([Order Details].Discount, 1) from [Order Details] where [Order Details].Discount != 0;

-- 2.8

select [Order Details].Discount, [Order Details].Discount*RAND() from [Order Details] where [Order Details].Discount != 0;

-- 2.9

Select Categories.CategoryName, upper(Categories.CategoryName) from Categories;