-- Brax Waller
-- Exercise 2G
-- PropertyManager2 db

-- 1) Buildings, Apartments, Admin
SELECT        Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, People.FirstName + N' ' + People.LastName AS Admin
FROM            Buildings INNER JOIN
                         Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
						 People ON Apartments.Admin_Id = People.Id


-- 2) Apartments, Invoices, Line Items
SELECT        Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N',' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, LineItems.Description, LineItems.Amount
FROM            Apartments INNER JOIN
						 People ON People.Id = Apartments.Tenant_Id INNER JOIN
                         Invoices ON Apartment_Id = Invoices.Apartment_Id INNER JOIN
						 LineItems ON Invoice_Id = LineItems.Invoice_Id 

-- 3) Tenants, Invoices, Receipts
SELECT        People.Id, People.LastName + N',' + People.FirstName AS Tenant, Invoices.Id AS InvoiceId, Invoices.DueDate, Receipts.ReceiptDate, SUM(Receipts.Amount) AS Recieved
FROM            People INNER JOIN
                         Apartments ON People.Id = Apartments.Tenant_Id INNER JOIN
                         Invoices ON Invoices.Apartment_Id = Invoices.Apartment_Id INNER JOIN
                         Receipts ON Receipts.Invoice_Id = Receipts.Invoice_Id
GROUP BY People.Id, People.LastName + N',' + People.FirstName, Invoices.Id, Invoices.DueDate, Receipts.ReceiptDate
