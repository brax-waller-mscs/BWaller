-- Brax Waller
-- Exercise 2F
-- Animal Shelter db

-- 1) All Animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                         People ON Animals.Person_Id = People.Id

-- 2) Cash Donations

SELECT        DonationTypes.Description AS Cash, People.LastName + N',' + People.FirstName AS Donor, Donations.DonationDate
FROM            DonationTypes INNER JOIN
                         Donations ON DonationTypes.Id = Donations.Id INNER JOIN
                         People ON Donations.Person_Id = People.Id
WHERE        (DonationTypes.Description = N'Cash')

-- 3) Total Donations for Each Donor

SELECT        People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS Total
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id
GROUP BY People.FirstName + N' ' + People.LastName, People.Id


-- 4) Number of Dogs of Each Owner
SELECT        People.FirstName + N',' + People.LastName AS Owner, People.Id, COUNT(Animals.AnimalType_Id) AS Expr1
FROM            People INNER JOIN
                         AnimalTypes ON People.Id = AnimalTypes.Id INNER JOIN
                         Animals ON People.Id = Animals.Person_Id AND AnimalTypes.Id = Animals.AnimalType_Id
GROUP BY People.FirstName + N',' + People.LastName, People.Id