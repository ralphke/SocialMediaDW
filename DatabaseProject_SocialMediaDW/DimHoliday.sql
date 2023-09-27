CREATE TABLE [dbo].[DimHoliday] (
    [DateKey]      INT          NOT NULL,
    [LocationName] VARCHAR (20) NOT NULL,
    [StartDate]    DATE         NOT NULL,
    [EndDate]      DATE         NOT NULL,
    [Abrevation]   SMALLINT     NOT NULL,
    [DESCRIPTION]  VARCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO

