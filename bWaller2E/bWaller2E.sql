-- Brax Waller
-- Exercise 2E
-- PropertyManager db

-- 1) Building Name and Location
SELECT        BuildingName, Address, N'City + ,  + State +   + ZipCode' AS Location
FROM            Building
WHERE        (City = N'Red Wing')

-- 2) Estimated Rent
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet*0.9 + Apartment.Bathroom*100 AS [Estimated Rent]
FROM Apartment INNER JOIN
		Building ON Apartment.BuildingId = Building.BuildingId
WHERE (Building.City=N'Red Wing')

-- 3) Estimated Rent vs Actual Rent
SELECT Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent AS [Actual Rent], Apartment.SquareFeet*0.9 + Apartment.Bathroom*100 AS [Estimated Rent],
	Apartment.Rent-(Apartment.SquareFeet*0.9 + Apartment.Bathroom*100) AS [Difference]
FROM Apartment INNER JOIN
		Building ON Apartment.BuildingId = Building.BuildingId
WHERE (Building.City=N'Red Wing')

-- 4) Invoice Total
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Expr1
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoices.InvoiceDate

-- 5) Invoice Total and Receipt
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Expr1, Receipt.Amount
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoices.InvoiceDate, Receipt.Amount

-- 6)Invoice Total vs Receipt
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Expr1, Receipt.Amount
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoices.InvoiceDate, Receipt.Amount
HAVING		(SUM(LineItem.Amount)-Receipt.Amount>0)

-- 7) Late Payments
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, DATEDIFF(day, Invoice.DueDate, Receipt.ReceiptDate) AS Difference, Invoice.DueDate, Receipt.ReceiptDate
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
WHERE        DATEDIFF (day, 'Invoice.DueDate','Receipt.ReceiptDate' > '0')

-- 8) Next Invoice Date
SELECT        Apartment.TenantId, Person.FirstName + N' ' + Person.LastName AS Name, MAX(Invoices.InvoiceDate) AS [Most Recent], DATEADD(month, 1, MAX(Invoices.InvoiceDate)) AS [Addtional Date]
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Invoices ON Apartment.ApartmentId = Invoices.ApartmentId
GROUP BY Apartment.TenantId, Person.FirstName + N' ' + Person.LastName