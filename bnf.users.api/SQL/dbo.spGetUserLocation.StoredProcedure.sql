USE [bnfuser]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserLocation]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserLocation]
    @UserId INT
AS
BEGIN
    SELECT Address, City, State, Country, ZipCode
    FROM UserLocations
    WHERE UserId = @UserId;
END
GO
