USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegisterUser]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @BirthDate DATETIME,
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20),
    
    @Username NVARCHAR(50),
    @Password NVARCHAR(255) -- Adjusted for potential encryption length
AS
BEGIN
    BEGIN TRY
        INSERT INTO Users (FirstName, LastName, BirthDate, Email, PhoneNumber, Username, Password)
        VALUES (@FirstName, @LastName, @BirthDate, @Email, @PhoneNumber,  @Username, @Password)

        -- Optionally return the ID of the newly inserted user, if your table has an identity column
        SELECT SCOPE_IDENTITY() AS NewUserId;
    END TRY
    BEGIN CATCH
        -- Handle or log the error here
        -- Example: SELECT ERROR_MESSAGE() AS ErrorMessage;
        THROW; -- Re-throw the caught exception after handling/logging it
    END CATCH
END
GO
