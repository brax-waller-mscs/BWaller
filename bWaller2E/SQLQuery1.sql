-- Brax Waller
-- Exercise 2E
-- PropertyManager db

-- 1) Building Name and Location
SELECT        BuildingName, Address, City + N', ' + State + N' ' + ZipCode  AS Location
FROM            Building
WHERE        (City = N'Winona')

-- 2) Estimated Rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + Apartment.Bathroom * 100 AS [Estimated Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
WHERE        (Building.City = N'Red Wing')

-- 3) Estimated Rent vs Actual Rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent AS [Actual Rent], Apartment.SquareFeet * 0.9 + Apartment.Bathroom * 100 AS [Estimated Rent], 
                         Apartment.Rent - (Apartment.SquareFeet * 0.9 + Apartment.Bathroom * 100) AS Difference
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
WHERE        (Building.City = N'Red Wing')

-- 4) Invoice Total
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Total
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoices.InvoiceDate, Person.FirstName + N' ' + Person.LastName

-- 5) Invoice Total and Receipt
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Total, Receipt.Amount
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoices.InvoiceDate, Person.FirstName + N' ' + Person.LastName, Receipt.Amount

-- 6) Invoice Total vs Recieved
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Name, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Total, Receipt.Amount, SUM(LineItem.Amount) 
                         - Receipt.Amount AS Difference
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoices.InvoiceDate, Person.FirstName + N' ' + Person.LastName, Receipt.Amount
HAVING        (SUM(LineItem.Amount) - Receipt.Amount > 0)

-- 7) Late Payments


