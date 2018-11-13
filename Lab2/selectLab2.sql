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