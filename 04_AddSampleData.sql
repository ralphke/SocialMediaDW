SET NOCOUNT ON
-- This script adds some sample data to the database
-- should be skipped if not needed
TRUNCATE TABLE [dbo].[DimHoliday]
GO
--Insert local Holiday dates (NRW, Germany)
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230403, N'NRW', CAST(N'2023-04-03' AS Date), CAST(N'2023-04-15' AS Date), 1, N'Osterferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230501, N'NRW', CAST(N'2023-05-01' AS Date), CAST(N'2023-05-01' AS Date), 2, N'Tag der Arbeit')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230518, N'NRW', CAST(N'2023-05-18' AS Date), CAST(N'2023-05-18' AS Date), 2, N'Christi Himmelfahrt')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230529, N'NRW', CAST(N'2023-05-29' AS Date), CAST(N'2023-05-29' AS Date), 2, N'Pfingstmontag')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230530, N'NRW', CAST(N'2023-05-30' AS Date), CAST(N'2023-05-30' AS Date), 1, N'Pfingstferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230608, N'NRW', CAST(N'2023-06-08' AS Date), CAST(N'2023-06-08' AS Date), 2, N'Fronleichnam')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230622, N'NRW', CAST(N'2023-06-22' AS Date), CAST(N'2023-08-04' AS Date), 1, N'Sommerferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231002, N'NRW', CAST(N'2023-10-02' AS Date), CAST(N'2023-10-14' AS Date), 1, N'Herbstferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231003, N'NRW', CAST(N'2023-10-03' AS Date), CAST(N'2023-10-03' AS Date), 2, N'Tag der Deutschen Einheit')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231101, N'NRW', CAST(N'2023-11-01' AS Date), CAST(N'2023-11-01' AS Date), 2, N'Allerheiligen')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231221, N'NRW', CAST(N'2023-12-21' AS Date), CAST(N'2024-01-05' AS Date), 1, N'Weihnachtsferien')
GO

TRUNCATE TABLE [dbo].[Batch]
GO
SET IDENTITY_INSERT [dbo].[Batch] ON 
GO
INSERT [dbo].[Batch] ([BatchID], [Operation], [Credentials], [Operator], [Result], [Success], [Start], [End]) VALUES (1, N'Load Data', N'anonymous', N'Rakete', N'Success', 0, CAST(N'2023-09-25T15:03:28.0853663' AS DateTime2), CAST(N'2023-09-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Batch] ([BatchID], [Operation], [Credentials], [Operator], [Result], [Success], [Start], [End]) VALUES (2, N'LOad more Data', N'Rakete', N'Henk', N'Failure', 1, CAST(N'2023-09-25T15:04:36.1165311' AS DateTime2), CAST(N'2023-09-24T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Batch] OFF
GO

TRUNCATE TABLE [dbo].[DimSocialMedia]
GO
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (1, N'Facebook', N'https://www.facebook.com', CAST(N'2023-09-25T14:57:01.2524571' AS DateTime2), CAST(N'2030-12-31T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (2, N'LinkedIn', N'https://www.linkedin.com', CAST(N'2023-09-25T14:57:44.3861308' AS DateTime2), CAST(N'2030-12-31T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (3, N'Xing', N'https://www.xing.com', CAST(N'2023-09-25T15:00:46.4591257' AS DateTime2), CAST(N'2029-12-31T00:00:00.0000000' AS DateTime2), 2)
GO

TRUNCATE TABLE [dbo].[DimUser]
GO
INSERT [dbo].[DimUser] ([UserID], [UserName], [UserEmail], [UserLocation], [ValidFrom], [ValidTo], [BatchID]) VALUES (1, N'rakete', N'rakete@raketetechnology.com', N'Cologne, Germany', CAST(N'2023-09-25T15:01:59.7246970' AS DateTime2), CAST(N'2023-12-31T00:00:00.0000000' AS DateTime2), 1)
GO