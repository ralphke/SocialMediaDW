CREATE TABLE [dbo].[DimUser] (
    [UserID]       INT           NOT NULL,
    [UserName]     NVARCHAR (50) NOT NULL,
    [UserEmail]    NVARCHAR (50) NOT NULL,
    [UserLocation] NVARCHAR (50) NOT NULL,
    [ValidFrom]    DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [ValidTo]      DATETIME2 (7) NOT NULL,
    [BatchID]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO

