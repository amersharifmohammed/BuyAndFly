USE [bnfuser]
GO
/****** Object:  User [admin]    Script Date: 2/12/2024 8:09:03 PM ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
