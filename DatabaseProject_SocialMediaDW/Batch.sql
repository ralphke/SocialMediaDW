CREATE TABLE [dbo].[Batch] (
    [BatchID]     INT           IDENTITY (1, 1) NOT NULL,
    [Operation]   VARCHAR (50)  NOT NULL,
    [Credentials] VARCHAR (50)  NOT NULL,
    [Operator]    VARCHAR (50)  NOT NULL,
    [Result]      VARCHAR (50)  NOT NULL,
    [Success]     BIT           NOT NULL,
    [Start]       DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [End]         DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([BatchID] ASC)
);


GO

