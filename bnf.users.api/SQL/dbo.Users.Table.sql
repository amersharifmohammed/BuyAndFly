USE [bnfuser]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/12/2024 8:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserRole] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (1, N'Abdul', N'Hannan', CAST(N'2024-02-02T00:00:00.000' AS DateTime), N'abdl.hannan99@gmail.com', N'9015589172', N'abdl.hannan99@gmail.com', N'Tr3vRO8nNk9QBj0aMeqGAw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (2, N'AMER SHARIF', N'mohammed', CAST(N'2024-02-13T00:00:00.000' AS DateTime), N'remu@gmail.com', N'2244154769', N'remu@gmail.com', N'RMcv2Lywm5P+t5EznaMysA==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (3, N'Muhammed husaini', N'Mohammed', CAST(N'2024-02-16T00:00:00.000' AS DateTime), N'HASAHSALKSDA@GMAIL.COM', N'12345', N'HASAHSALKSDA@GMAIL.COM', N'R+XDRRR36/iMZjh8DAE40Q==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (4, N'AMER SHARIF', N'Hannan', CAST(N'2024-02-22T00:00:00.000' AS DateTime), N'temu@temu.com', N'313236464764', N'temu@temu.com', N'bY9irY96zw/iCAJgzlPVrw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (5, N'Abdul', N'Hannan', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'abdl.hannan999999@gmail.com', N'2244154769', N'abdl.hannan999999@gmail.com', N'qrCWxLI1gF3tkWiq2V1fIQ==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (6, N'dd', N'gg', CAST(N'2024-02-17T00:00:00.000' AS DateTime), N'mohdamersharif17@gmail.com', N'9015589172', N'mohdamersharif17@gmail.com', N'X9Y1YIlGmI4NlFYeas3+Tg==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (7, N'AMER SHARIF', N'MOAHMMED', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'mohdamerggggsharif17@gmail.com', N'9015589172', N'mohdamerggggsharif17@gmail.com', N'lOO4R1YS1mF+GxcNhWgU/w==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (8, N'AMER SHARIF', N'Mohammed', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'mohffdamersharif17@gmail.com', N'9015589172', N'mohffdamersharif17@gmail.com', N't43MOsCEtJ8EVSFB03mPtw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (9, N'AMER SHARIF', N'syed', CAST(N'2024-02-16T00:00:00.000' AS DateTime), N'mooohdamersharif17@gmail.com', N'9015589172', N'mooohdamersharif17@gmail.com', N'epc7ZkE8iE1VgYSGXICOfA==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (10, N'Muhammed husaini', N'syed', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'rrremu@gmail.com', N'9015589172', N'rrremu@gmail.com', N'KwZpReXqRSdoEEHQwnGoXg==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (11, N'abbey', N'boy', CAST(N'1991-08-21T00:00:00.000' AS DateTime), N'abbas.ali74747@gmail.com', N'6309992028', N'abbas.ali74747@gmail.com', N'mSO7DXE6M6bH//4wV9aKhw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (12, N'amer', N'syed', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'syedafridi59@gmai.com', N'9015589172', N'syedafridi59@gmai.com', N'QEWjuw1ArqkKzJZTWIonBg==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (13, N'wejsk', N'sdjkfn', CAST(N'1986-03-21T00:00:00.000' AS DateTime), N'wk@yahoo.com', N'3128789586', N'wk@yahoo.com', N'9Nm6TIpSJl7rzm6bOuljPw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (14, N'waja', N'kahe', CAST(N'1985-02-01T00:00:00.000' AS DateTime), N'wk123@yahoo.com', N'3125778548', N'wk123@yahoo.com', N'9Nm6TIpSJl7rzm6bOuljPw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (15, N'ertw', N'kajh', CAST(N'1965-03-05T00:00:00.000' AS DateTime), N'wk1234@yahoo.com', N'3125543456', N'wk1234@yahoo.com', N'9Nm6TIpSJl7rzm6bOuljPw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (16, N'wajah', N'skasjh', CAST(N'1966-12-01T00:00:00.000' AS DateTime), N'wk123456ahoo.com', N'3128558968', N'wk123456ahoo.com', N'9Nm6TIpSJl7rzm6bOuljPw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (17, N'waqjkl', N'kljhdsf', CAST(N'1945-01-08T00:00:00.000' AS DateTime), N'wk1234567@yahoo.com', N'3128449464', N'wk1234567@yahoo.com', N'gODsJMynet4Qw7Pkrdj4tw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (18, N'wah', N'fgtr', CAST(N'1988-02-25T00:00:00.000' AS DateTime), N'wk12345678@yahoo.com', N'+13218998086', N'wk12345678@yahoo.com', N'gODsJMynet4Qw7Pkrdj4tw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (19, N'tamasha', N'bharath', CAST(N'1999-10-19T00:00:00.000' AS DateTime), N'kdjkdjfkdjf@gmail.com', N'+11232221112', N'kdjkdjfkdjf@gmail.com', N'WUl2aFx9SFsve14+pdEm5h9DtYi6UgCFck0miyNIBdE=', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (20, N'amer', N'ttt', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'strieeeng@gmail.com', N'+13218998086', N'strieeeng@gmail.com', N'b02qj/Q4PhZxDMX0jelRQA==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (21, N'Abdul', N'Hannan', CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'wk1278@gmail.com', N'+12244154769', N'wk1278@gmail.com', N'pzm8Lz9AlVn3Gv6CGDjW1g==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (22, N'AMER SHARIF', N'syed', CAST(N'2024-02-22T00:00:00.000' AS DateTime), N'asdasd@gmail.com', N'+11231231231', N'asdasd@gmail.com', N'4YEvvXpwLbFUYS73XQIs3Q==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (23, N'strgging', N'strgging', CAST(N'2024-02-12T15:58:37.563' AS DateTime), N'strgging', N'strgging', N'strgging', N'dSfp54ybvpAW26898egu1w==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (24, N'striiing', N'striiing', CAST(N'2024-02-12T16:00:17.717' AS DateTime), N'striiing', N'string', N'striiing', N'x6IKo/w+nhZ7xiD5tsmLqQ==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (25, N'strrring', N'strrring', CAST(N'2024-02-12T16:02:41.093' AS DateTime), N'strrrring', N'string', N'strrrring', N'bwpcZDcl/aAiyjpgPj0EFQ==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (26, N'stmmring', N'stmmring', CAST(N'2024-02-12T16:05:30.380' AS DateTime), N'strmming', N'stmmring', N'strmming', N'r9vD00QgV9exNUOSFtuDZA==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (27, N'string', N'string', CAST(N'2024-02-12T17:02:57.010' AS DateTime), N'strttting', N'string', N'strttting', N'EEqIEths/lvejDhE9Gn8xw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (28, N'amber', N'lamber', CAST(N'2024-02-12T17:55:03.100' AS DateTime), N'amber@gmail.com', N'123456789', N'amber@gmail.com', N'ON3gygURL3ZAJlMaObN65Q==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (29, N'tadu', N'madu', CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'hala', N'12345678', N'hala', N'vxpNUGLOSc3xONaFoXcoEA==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (30, N'mumu', N'numu', CAST(N'2024-02-12T18:35:20.473' AS DateTime), N'juju', N'1231231233', N'juju', N'yxsfH5c+QTIQ2hh75U+Hdw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (31, N'ahmed', N'hussain', CAST(N'2024-02-12T20:21:08.077' AS DateTime), N'ahmed@gmail.com', N'123123123', N'ahmed@gmail.com', N'2nd4BH9x4OLK31gAzW0hHw==', N'User')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [BirthDate], [Email], [PhoneNumber], [Username], [Password], [UserRole]) VALUES (32, N'strinbbg', N'stribbng', CAST(N'2024-02-12T23:01:31.757' AS DateTime), N'stribbng', N'strbbing', N'stribbng', N'2+1/d4AcNYmcVNYazkmdvA==', N'User')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_YourTableName_UserRole]  DEFAULT ('User') FOR [UserRole]
GO
