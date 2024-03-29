USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spFetchUserByUsername]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFetchUserByUsername]
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT 
        UserId, 
        Username, 
        Password, -- Encrypted password
        Email, 
        FirstName, 
        LastName, 
        BirthDate, 
        PhoneNumber, 
       
        UserRole -- Adjust based on your Users table structure
    FROM 
        Users
    WHERE 
        Username = @Username;
END;
GO
