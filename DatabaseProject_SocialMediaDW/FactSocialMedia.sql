CREATE TABLE [dbo].[FactSocialMedia] (
    [SocialMediaID] INT           NOT NULL,
    [PostID]        BIGINT        NOT NULL,
    [UserID]        INT           NOT NULL,
    [PostDateKey]   INT           NOT NULL,
    [Likes]         INT           NOT NULL,
    [Shares]        INT           NOT NULL,
    [Comments]      INT           NOT NULL,
    [ValidFrom]     DATETIME2 (7) NOT NULL,
    [ValidTo]       DATETIME2 (7) NOT NULL,
    [BatchID]       INT           NOT NULL
);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CCI_FactSocialMedia]
    ON [dbo].[FactSocialMedia];


GO

