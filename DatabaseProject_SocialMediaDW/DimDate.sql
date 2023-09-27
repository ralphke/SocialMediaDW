CREATE TABLE [dbo].[DimDate] (
    [DateKey]       INT          NOT NULL,
    [FullDate]      DATE         NOT NULL,
    [DayOfWeek]     VARCHAR (10) NOT NULL,
    [DayOfMonth]    INT          NOT NULL,
    [DayOfYear]     INT          NOT NULL,
    [Weekday]       BIT          NOT NULL,
    [Holiday]       BIT          NULL,
    [HolidayName]   VARCHAR (30) NULL,
    [WeekOfYear]    INT          NOT NULL,
    [MonthName]     VARCHAR (10) NOT NULL,
    [MonthOfYear]   INT          NOT NULL,
    [QuarterOfYear] INT          NOT NULL,
    [Year]          INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO

