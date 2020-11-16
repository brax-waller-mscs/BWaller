SELECT        SkateShops.Id AS [Shop Id], SkateShops.City, SkateShops.State, Skates.FName + N' ' + Skates.LName AS Skater, Designs.FName + N' ' + Designs.LName AS Designer, CustomBoards.Id AS [Board Id], 
                         Invoices.Id AS [Invoice Id]
FROM            SkateShops INNER JOIN
                         Skates ON SkateShops.Id = Skates.SkateShop_Id INNER JOIN
                         Designs ON SkateShops.Id = Designs.SkateShop_Id AND Skates.Design_Id = Designs.Id INNER JOIN
                         CustomBoards ON Designs.Id = CustomBoards.Design_Id INNER JOIN
                         LineItems ON CustomBoards.Id = LineItems.CustomBoard_Id INNER JOIN
                         Invoices ON LineItems.Invoice_Id = Invoices.Id

SELECT        Designs.FName + N' ' + Designs.LName AS Designer, CustomBoards.Size, CustomBoards.Shape, LineItems.Amount AS [LineItem Amount], Invoices.Date AS [Invoice Date]
FROM            CustomBoards INNER JOIN
                         Designs ON CustomBoards.Design_Id = Designs.Id INNER JOIN
                         LineItems ON CustomBoards.Id = LineItems.CustomBoard_Id INNER JOIN
                         Invoices ON LineItems.Invoice_Id = Invoices.Id