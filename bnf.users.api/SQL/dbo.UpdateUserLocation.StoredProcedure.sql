USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserLocation]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateUserLocation]
    @Address NVARCHAR(50),
    @City NVARCHAR(50),
	@State NVARCHAR(50),
	@Country NVARCHAR(50),
	@ZipCode NVARCHAR(50),
	@UserId INT

AS
BEGIN
    UPDATE UserLocations SET Address = @Address, City = @City, State = @State, Country = @Country, ZipCode = @ZipCode WHERE UserId = @UserId
END
GO
