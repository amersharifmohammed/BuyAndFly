USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserDetails]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserDetails]
    @Email NVARCHAR(100)
AS
BEGIN
    SELECT FirstName, LastName,  Email, UserRole FROM Users WHERE Email = @Email
END
GO
