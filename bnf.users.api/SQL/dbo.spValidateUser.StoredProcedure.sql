USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spValidateUser]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spValidateUser]
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Users WHERE Username = @Username AND Password = @Password
END
GO
