CREATE TABLE [dbo].[DimTime] (
    [TimeKey]              INT         NOT NULL,
    [Hour24]               INT         NULL,
    [Hour24ShortString]    VARCHAR (2) NULL,
    [Hour24MinString]      VARCHAR (5) NULL,
    [Hour24FullString]     VARCHAR (8) NULL,
    [Hour12]               INT         NULL,
    [Hour12ShortString]    VARCHAR (2) NULL,
    [Hour12MinString]      VARCHAR (5) NULL,
    [Hour12FullString]     VARCHAR (8) NULL,
    [AmPmCode]             INT         NULL,
    [AmPmString]           VARCHAR (2) NOT NULL,
    [Minute]               INT         NULL,
    [MinuteCode]           INT         NULL,
    [MinuteShortString]    VARCHAR (2) NULL,
    [MinuteFullString24]   VARCHAR (8) NULL,
    [MinuteFullString12]   VARCHAR (8) NULL,
    [HalfHour]             INT         NULL,
    [HalfHourCode]         INT         NULL,
    [HalfHourShortString]  VARCHAR (2) NULL,
    [HalfHourFullString24] VARCHAR (8) NULL,
    [HalfHourFullString12] VARCHAR (8) NULL,
    [Second]               INT         NULL,
    [SecondShortString]    VARCHAR (2) NULL,
    [FullTimeString24]     VARCHAR (8) NULL,
    [FullTimeString12]     VARCHAR (8) NULL,
    [FullTime]             TIME (7)    NULL,
    PRIMARY KEY CLUSTERED ([TimeKey] ASC)
);


GO

