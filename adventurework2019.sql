--Tìm sản phẩm bán chạy nhất theo tháng
SELECT * FROM Production.Product
SELECT * FROM Purchasing.PurchaseOrderDetail

SELECT month(DueDate) as month
		, SUM(OrderQty*UnitPrice) as ordernumber
		,Product.Name
		into #temp_abc
FROM Production.Product join Purchasing.PurchaseOrderDetail on Product.ProductID = PurchaseOrderDetail.ProductID
WHERE year(DueDate) = 2011
GROUP BY month(DueDate), Product.Name
ORDER BY ordernumber DESC

select * from #temp_abc

select month, max(ordernumber) as summ, Name 
from #temp_abc
group by month, Name



-- Tìm sản phẩm bán chạy thứ 2 theo tháng
SELECT ROW_NUMBER() OVER (ORDER BY (SUM(OrderQty*UnitPrice)) DESC) as ordernumber 
		, month(DueDate) as month
		, Product.Name 
		, SUM(OrderQty*UnitPrice) as sum
		FROM Production.Product join Purchasing.PurchaseOrderDetail on Product.ProductID = PurchaseOrderDetail.ProductID
		GROUP BY month(DueDate)
		, Product.Name 
		




SELECT SUM(OrderQty*UnitPrice) as sum
FROM (SELECT TOP 2 SUM(OrderQty*UnitPrice) as ordernumber 
		, month(DueDate) as month
		, Product.Name 
		, SUM(OrderQty*UnitPrice) as sum
		FROM Production.Product join Purchasing.PurchaseOrderDetail on Product.ProductID = PurchaseOrderDetail.ProductID
		GROUP BY month(DueDate)
		, Product.Name
		ORDER BY ordernumber DESC ) 


SELECT * from Purchasing.PurchaseOrderHeader
SELECT * FROM Purchasing.Vendor
SELECT DISTINCT year(OrderDate) FROM Purchasing.PurchaseOrderHeader
SELECT * FROM 
(
	SELECT Purchasing.Vendor.Name, Purchasing.PurchaseOrderHeader.OrderDate
	FROM  Purchasing.PurchaseOrderHeader inner join Purchasing.Vendor on PurchaseOrderHeader.VendorID = Vendor.VendorID
)


