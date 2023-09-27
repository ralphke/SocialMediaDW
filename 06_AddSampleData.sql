SET NOCOUNT ON
-- This script adds some sample data to the database
-- should be skipped if not needed

TRUNCATE TABLE [dbo].[Batch]
GO
SET IDENTITY_INSERT [dbo].[Batch] ON 
GO
INSERT [dbo].[Batch] ([BatchID], [Operation], [Credentials], [Operator], [Result], [Success], [Start], [End]) VALUES (1, N'Load Data', N'anonymous', N'Bill', N'Success', 0, SYSUTCDATETIME(), DATEADD(DAY,90,SYSUTCDATETIME()))
INSERT [dbo].[Batch] ([BatchID], [Operation], [Credentials], [Operator], [Result], [Success], [Start], [End]) VALUES (2, N'Load more Data', N'Mary', N'Jim', N'Failure', 1, SYSUTCDATETIME(), DATEADD(DAY,90,SYSUTCDATETIME()))
SET IDENTITY_INSERT [dbo].[Batch] OFF
GO

TRUNCATE TABLE [dbo].[DimSocialMedia]
GO
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (1, N'Facebook', N'https://www.facebook.com', SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()), 1)
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (2, N'LinkedIn', N'https://www.linkedin.com', SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()), 2)
INSERT [dbo].[DimSocialMedia] ([SocialMediaID], [Name], [URL], [ValidFrom], [ValidTo], [BatchID]) VALUES (3, N'Xing', N'https://www.xing.com', SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()), 2)
GO

TRUNCATE TABLE [dbo].[DimUser]
GO
INSERT [dbo].[DimUser] ([UserID], [UserName], [UserEmail], [UserLocation], [ValidFrom], [ValidTo], [BatchID]) VALUES (1, N'Mary', N'mary@contoso.com', N'Hamburg, Germany',SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()), 1)
GO

TRUNCATE TABLE [dbo].[DimPost]
GO
INSERT INTO [dbo].[DimPost]([PostID],[SocialMediaID],[UserID],[PostDateKey],[CommentID],[ValidFrom],[ValidTo],[BatchID]) VALUES (1,1,1,FORMAT(SYSUTCDATETIME(), 'yyyymmdd'),1,SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()),1)
GO


TRUNCATE TABLE [dbo].[DimComment]
GO
INSERT INTO [dbo].[DimComment]([CommentID], [PostID], [UserID], [CommentDateKey], [CommentText],[ValidFrom],[ValidTo],[BatchID]) VALUES (1,1,1,FORMAT(SYSUTCDATETIME(), 'yyyymmdd'),N'Hello again #SocialMediaDW rocks!',SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()),1)
GO
TRUNCATE TABLE [dbo].[FactSocialMedia]
GO
INSERT INTO [dbo].[FactSocialMedia]([SocialMediaID] ,[PostID],[UserID],[PostDateKey],[Likes],[Shares],[Comments],[ValidFrom],[ValidTo],[BatchID]) VALUES (1,1,1,FORMAT(SYSUTCDATETIME(), 'yyyymmdd'),2,0,1,SYSUTCDATETIME(),DATEADD(DAY,90,SYSUTCDATETIME()),1)
GO


