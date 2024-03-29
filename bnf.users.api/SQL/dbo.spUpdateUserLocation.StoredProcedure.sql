USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUserLocation]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateUserLocation]
    @UserId INT,
    @Address NVARCHAR(255),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @Country NVARCHAR(100),
    @ZipCode NVARCHAR(20)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM UserLocations WHERE UserId = @UserId)
    BEGIN
        UPDATE UserLocations
        SET Address = @Address, City = @City, State = @State, Country = @Country, ZipCode = @ZipCode
        WHERE UserId = @UserId;
    END
    ELSE
    BEGIN
        INSERT INTO UserLocations (UserId, Address, City, State, Country, ZipCode)
        VALUES (@UserId, @Address, @City, @State, @Country, @ZipCode);
    END
END
GO
