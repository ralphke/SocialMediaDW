SET NOCOUNT ON
SET LANGUAGE German; 
SET DATEFORMAT ymd
GO
DROP TABLE if exists DimHoliday
GO
CREATE Table DimHoliday (
    DateKey INT NOT NULL PRIMARY KEY,
    LocationName VARCHAR(20) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate Date NOT NULL,
    Abrevation smallint NOT NULL,
    DESCRIPTION varchar(30) NOT NULL
)
GO
--Insert local Holiday dates (NRW, Germany)
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230403, N'NRW', CAST(N'2023-04-03' AS Date), CAST(N'2023-04-15' AS Date), 1, N'Osterferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230501, N'NRW', CAST(N'2023-05-01' AS Date), CAST(N'2023-05-01' AS Date), 2, N'Tag der Arbeit')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230518, N'NRW', CAST(N'2023-05-18' AS Date), CAST(N'2023-05-18' AS Date), 2, N'Christi Himmelfahrt')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230529, N'NRW', CAST(N'2023-05-29' AS Date), CAST(N'2023-05-29' AS Date), 2, N'Pfingstmontag')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230530, N'NRW', CAST(N'2023-05-30' AS Date), CAST(N'2023-05-30' AS Date), 1, N'Pfingstferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230608, N'NRW', CAST(N'2023-06-08' AS Date), CAST(N'2023-06-08' AS Date), 2, N'Fronleichnam')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20230622, N'NRW', CAST(N'2023-06-22' AS Date), CAST(N'2023-08-04' AS Date), 1, N'Sommerferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231002, N'NRW', CAST(N'2023-10-02' AS Date), CAST(N'2023-10-14' AS Date), 1, N'Herbstferien')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231003, N'NRW', CAST(N'2023-10-03' AS Date), CAST(N'2023-10-03' AS Date), 2, N'Tag der Deutschen Einheit')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231101, N'NRW', CAST(N'2023-11-01' AS Date), CAST(N'2023-11-01' AS Date), 2, N'Allerheiligen')
INSERT [dbo].[DimHoliday] ([DateKey], [LocationName], [StartDate], [EndDate], [Abrevation], [DESCRIPTION]) VALUES (20231221, N'NRW', CAST(N'2023-12-21' AS Date), CAST(N'2024-01-05' AS Date), 1, N'Weihnachtsferien')
GO

DROP TABLE if exists DimDate
GO
CREATE TABLE DimDate (
    DateKey INT NOT NULL PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayOfWeek VARCHAR(10) NOT NULL,
    DayOfMonth INT NOT NULL,
    DayOfYear INT NOT NULL,
    Weekday BIT NOT NULL,
    Holiday BIT NULL,
    HolidayName varchar(30) NULL,
    WeekOfYear INT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
    MonthOfYear INT NOT NULL,
    QuarterOfYear INT NOT NULL,
    Year INT NOT NULL
);
GO
DECLARE @date DATE = GETUTCDATE() 
DECLARE @startDate DATE = DATEADD(YEAR,-1,DATE_BUCKET (YEAR, 1, @date));
DECLARE @endDate  DATE = DATEADD(YEAR,1,DATE_BUCKET (YEAR, 1, @date));
select @startDate, @endDate

WHILE @startDate <= @endDate
BEGIN
    INSERT INTO DimDate (
        DateKey, FullDate, DayOfWeek, DayOfMonth, DayOfYear, Weekday, Holiday, WeekOfYear, 
        MonthName, MonthOfYear, QuarterOfYear, Year
    )
    VALUES (
        CONVERT(INT, CONVERT(VARCHAR(8), @startDate, 112)),
        @startDate,
        DATENAME(WEEKDAY, @startDate),
        DAY(@startDate),
        DATEPART(DAYOFYEAR, @startDate),
        CASE WHEN DATENAME(WEEKDAY, @startDate) IN ('Samstag', 'Sonntag') THEN 0 ELSE 1 END,
        NULL,
        DATEPART(ISO_WEEK, @startDate),
        DATENAME(MONTH, @startDate),
        MONTH(@startDate),
        DATEPART(QUARTER, @startDate),
        YEAR(@startDate)
    );

    SET @startDate = DATEADD(DAY, 1, @startDate);
END;

UPDATE DimDate 
SET Holiday = 1, HolidayName = [DESCRIPTION]
FROM DimHoliday INNER JOIN DimDate on DimDate.DateKey = DimHoliday.DateKey 
where DimDate.FullDate between DimHoliday.StartDate and DimHoliday.EndDate 
GO

select top 10 * from DimDate where Holiday = 1

GO
