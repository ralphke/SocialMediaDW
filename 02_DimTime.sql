SET NOCOUNT ON
SET LANGUAGE German; 
SET DATEFORMAT ymd
GO
DROP TABLE if exists DimTime
GO
CREATE TABLE DimTime
(
    TimeKey INT NOT NULL PRIMARY KEY,
    Hour24 INT NULL,
    Hour24ShortString VARCHAR(2) NULL,
    Hour24MinString VARCHAR(5) NULL,
    Hour24FullString VARCHAR(8) NULL,
    Hour12 INT NULL,
    Hour12ShortString VARCHAR(2) NULL,
    Hour12MinString VARCHAR(5) NULL,
    Hour12FullString VARCHAR(8) NULL,
    AmPmCode INT NULL,
    AmPmString VARCHAR(2) NOT NULL,
    Minute INT NULL,
    MinuteCode INT NULL,
    MinuteShortString VARCHAR(2) NULL,
    MinuteFullString24 VARCHAR(8) NULL,
    MinuteFullString12 VARCHAR(8) NULL,
    HalfHour INT NULL,
    HalfHourCode INT NULL,
    HalfHourShortString VARCHAR(2) NULL,
    HalfHourFullString24 VARCHAR(8) NULL,
    HalfHourFullString12 VARCHAR(8) NULL,
    Second INT NULL,
    SecondShortString VARCHAR(2) NULL,
    FullTimeString24 VARCHAR(8) NULL,
    FullTimeString12 VARCHAR(8) NULL,
    FullTime TIME(7) NULL
);
GO
DROP TABLE if exists #SecondPerDay
GO
SELECT NULL AS [Hour], NULL as [Minute], Null as [Second] 
INTO #SecondPerDay Where 0 = 1 -- Trick to create a schema that matches the expected column names.
UNION ALL  
SELECT *
FROM GENERATE_SERIES(0, 23, 1) as [Hour]
CROSS APPLY  GENERATE_SERIES(0, 59, 1) as [Minute]
CROSS APPLY GENERATE_SERIES(0, 59, 1) as [Second]
;
INSERT INTO [dbo].[DimTime]
    ([TimeKey]
    ,[Hour24]
    ,[Hour24ShortString]
    ,[Hour24MinString]
    ,[Hour24FullString]
    ,[Hour12]
    ,[Hour12ShortString]
    ,[Hour12MinString]
    ,[Hour12FullString]
    ,[AmPmCode]
    ,[AmPmString]
    ,[Minute]
    ,[MinuteCode]
    ,[MinuteShortString]
    ,[MinuteFullString24]
    ,[MinuteFullString12]
    ,[HalfHour]
    ,[HalfHourCode]
    ,[HalfHourShortString]
    ,[HalfHourFullString24]
    ,[HalfHourFullString12]
    ,[Second]
    ,[SecondShortString]
    ,[FullTimeString24]
    ,[FullTimeString12]
    ,[FullTime])
select
    ([Hour]*10000 + [Minute]*100 + [Second]) as TimeKey
    ,[Hour] as [Hour24]
    ,FORMAT([Hour], '0#') as [Hour24ShortString]
    ,FORMAT([Hour]*100, '0#:##') as [Hour24MinString]
    ,FORMAT([Hour]*10000, '0#:##:##') as [Hour24FullString]
    ,[Hour]%12 as [Hour12]
    ,FORMAT([Hour]%12, '0#') as [Hour12ShortString]
    ,FORMAT([Hour]%12*100, '0#:##') as [Hour12MinString]
    ,FORMAT([Hour]%12*10000, '0#:##:##') as [Hour12FullString]
    ,[Hour]/12 as [AmPmCode]
    ,case when [Hour]<12 then 'AM' else 'PM' end as [AmPmString]
    ,[Minute]
    ,([Hour]*100 + [Minute]) [MinuteCode]
    ,FORMAT([Minute], '0#') as [MinuteShortString]
    ,FORMAT([Hour]*10000 + [Minute], '0#:##:##') as [MinuteFullString24]
    ,FORMAT([Hour]%12*10000 + [Minute], '0#:##:##') as [MinuteFullString12]
    ,[Minute]/30 as [HalfHour]
    ,[Hour]*100 + ([Minute]/30)*30 as [HalfHourCode]
    ,FORMAT(([Minute]/30)*30, '0#') as [HalfHourShortString]
    ,FORMAT([Hour]*100 + ([Minute]/30)*30, '0#:##') as [HalfHourFullString24]
    ,FORMAT([Hour]%12*100 + ([Minute]/30)*30, '0#:##') as [HalfHourFullString12]
    ,[Second]
    ,FORMAT([Second], '0#') as [SecondShortString]
    ,FORMAT([Hour]*10000 + [Minute]*100 + [Second], '0#:##:##') as [FullTimeString24]
    ,FORMAT([Hour]%12*10000 + [Minute]*100 + [Second], '0#:##:##')  as [FullTimeString12]
    ,convert(time,FORMAT([Hour]*10000 + [Minute]*100 + [Second], '0#:##:##')) as [FullTime]
FROM #SecondPerDay 
