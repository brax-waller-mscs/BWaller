-- Brax Waller
-- Exercise 2B
-- PropertyManager db

-- 1) Count All Buildings
SELECT        COUNT(*) AS Total
FROM            Building

-- 2) Count Buildings in Winona
SELECT        COUNT(*) AS [Winona Buildings]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

-- 3) Avg Rent 
SELECT        AVG(Rent) AS [Avg Rent]
FROM            Apartment

-- 4) Total Rent for Building 1
SELECT        SUM(Rent) AS Total
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 5) Cheapest Rent for Building 2
SELECT        MIN(Rent) AS Cheapest
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)

-- 6) Min, Avg, Max Building 1
SELECT        MIN(SquareFeet) AS Min, AVG(SquareFeet) AS Avg, MAX(SquareFeet) AS Max
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)

-- 7) Cheapest Price Garage
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

-- 8) Total Gas
SELECT        SUM(Amount) AS [Total Gas Billed]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

-- 9) Total Oct. Rent
SELECT        SUM(Amount) AS [Total Oct. Rent]
FROM            LineItem
GROUP BY Description
HAVING        (Description LIKE N'Oct%')