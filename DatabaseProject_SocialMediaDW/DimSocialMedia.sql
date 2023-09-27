CREATE TABLE [dbo].[DimSocialMedia] (
    [SocialMediaID] INT            NOT NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [URL]           NVARCHAR (256) NOT NULL,
    [ValidFrom]     DATETIME2 (7)  DEFAULT (sysutcdatetime()) NOT NULL,
    [ValidTo]       DATETIME2 (7)  NOT NULL,
    [BatchID]       INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([SocialMediaID] ASC)
);


GO

