-- Brax Waller
-- Exercise 2D
-- PropertyManager db

-- 1) Buildings, Apartment, Admin
SELECT        Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

-- 2) Tenants, Buildings, Apartment
SELECT        Person.PersonId, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM            Person INNER JOIN
                         Apartment ON Person.PersonId = Apartment.TenantId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum

-- 3) Apartment, Tenant, Invoice, Line Items
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoices.InvoiceId, Invoices.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoices ON Apartment.ApartmentId = Invoices.ApartmentId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoices.InvoiceDate

-- 4) Apartment, Tenant, Invoice Total
SELECT        Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoices.InvoiceId, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Total
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoices ON Apartment.ApartmentId = Invoices.ApartmentId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoices.InvoiceId, Invoices.InvoiceDate

-- 5) Invoice, Tenant, Receipt
SELECT        Invoices.InvoiceId, Invoices.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoices INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Invoices.InvoiceDate, Receipt.ReceiptDate

-- 6) Invoice, Tenant, Apartment, Billed, Recieved
SELECT        Invoices.InvoiceId, Invoices.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Recieved
FROM            Invoices INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
GROUP BY Invoices.InvoiceId, Invoices.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Apartment.ApartmentId, Receipt.Amount

-- 7) Admin, Invoice, Total Billed, Received
SELECT        Person.PersonId, Person.LastName, Invoices.InvoiceId, Invoices.InvoiceDate, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Received
FROM            LineItem INNER JOIN
                         Invoices ON LineItem.InvoiceId = Invoices.InvoiceId INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoices.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
GROUP BY Person.PersonId, Person.LastName, Invoices.InvoiceId, Invoices.InvoiceDate, Receipt.Amount, Apartment.ApartmentId


