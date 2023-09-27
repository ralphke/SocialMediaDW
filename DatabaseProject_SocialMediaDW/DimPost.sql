CREATE TABLE [dbo].[DimPost] (
    [PostID]        BIGINT        NOT NULL,
    [SocialMediaID] INT           NOT NULL,
    [UserID]        INT           NOT NULL,
    [PostDateKey]   INT           NOT NULL,
    [CommentID]     BIGINT        NOT NULL,
    [ValidFrom]     DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [ValidTo]       DATETIME2 (7) NOT NULL,
    [BatchID]       INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([PostID] ASC)
);


GO

