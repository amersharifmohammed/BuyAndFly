USE [bnfuser]
GO
/****** Object:  Table [dbo].[UserLocations]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocations](
	[UserId] [int] NOT NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserLocations] ([UserId], [Address], [City], [State], [Country], [ZipCode]) VALUES (1, N'string', N'string', N'string', N'string', N'string')
GO
ALTER TABLE [dbo].[UserLocations]  WITH CHECK ADD  CONSTRAINT [FK__UserLocat__UserI__398D8EEE] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserLocations] CHECK CONSTRAINT [FK__UserLocat__UserI__398D8EEE]
GO
