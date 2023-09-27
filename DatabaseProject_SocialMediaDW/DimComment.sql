CREATE TABLE [dbo].[DimComment] (
    [CommentID]      BIGINT         NOT NULL,
    [PostID]         BIGINT         NOT NULL,
    [UserID]         INT            NOT NULL,
    [CommentDateKey] INT            NOT NULL,
    [CommentText]    NVARCHAR (MAX) NOT NULL,
    [ValidFrom]      DATETIME2 (7)  NOT NULL,
    [ValidTo]        DATETIME2 (7)  NOT NULL,
    [BatchID]        INT            NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [FT_CommentID]
    ON [dbo].[DimComment]([CommentID] ASC);


GO

