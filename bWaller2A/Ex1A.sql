-- Brax Waller
-- Exercise 2A
-- PropertyManager db

-- 1) Building, Apartment	Tables,  ?BuildingId ?ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId
ORDER BY Apartment.ApartmentNum, Building.BuildingId


-- 2) Building, Apartment Tables, Filter Winona, Sort ?BuildingId ?Rent
SELECT        Building.BuildingId, Building.City,  Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC


-- 3) Apartment, Invoice Table, Sort ?ApartmentNum ?InvoiceDate
SELECT        Invoices.ApartmentId, Apartment.ApartmentNum, Invoices.InvoiceId, Invoices.InvoiceDate, Invoices.DueDate
FROM            Apartment INNER JOIN
                         Invoices ON Apartment.ApartmentId = Invoices.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoices.InvoiceDate DESC


-- 4) Apartment, Invoice Table, Sort ?BuildingId ?ApartmentNum ?InvoiceDate
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoices.InvoiceId, Invoices.InvoiceDate, Invoices.DueDate
FROM            Apartment INNER JOIN
                         Invoices ON Apartment.ApartmentId = Invoices.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoices.InvoiceDate


-- 5) Apartment, Person Table, alias: 'Admin', Sort ?BuildingId ?ApartmentNum
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum


-- 6) Apartment, Person Table, (alias: TenantLastName), FirstName (alias: TenantFirstName) Sort ?BuildingId ?TenantLastName ?TenantFirstName
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Apartment.BuildingId, TenantLastName, TenantFirstName


-- 7) Invoice, LineItem Table, Sort ?ApartmentId ?InvoiceDate
SELECT        Invoices.ApartmentId, LineItem.InvoiceId, Invoices.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoices INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
ORDER BY Invoices.ApartmentId, Invoices.InvoiceDate DESC

-- 8) Invoice, LineItem Table, Filter Rent, Garage, Sort ?ApartmentId ?InvoiceDate
SELECT        Invoices.ApartmentId, LineItem.InvoiceId, Invoices.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoices INNER JOIN
                         LineItem ON Invoices.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Rent') OR
                         (LineItem.Description = N'Garage')
ORDER BY Invoices.ApartmentId, Invoices.InvoiceDate DESC


-- 9) Invoice, Receipt Table, Filter Rent, Garage, Sort ?ApartmentId ?InvoiceId
SELECT        Invoices.InvoiceId, Invoices.ApartmentId, Invoices.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoices INNER JOIN
                         Receipt ON Invoices.InvoiceId = Receipt.InvoiceId
ORDER BY Invoices.InvoiceId, Invoices.ApartmentId