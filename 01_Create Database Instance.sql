/*
	Use this File in combination with SQCMD or go-sqlcmd Mode
	If not executed with SQLCMD, you will get a database with the name $(DBNAME)
	to start this from command prompt, use the following command:
	sqlcmd -S "rakete-server.database.windows.net" -G -U ralphke@raketetechnology.com -d master -i "01_Create Database Instance.sql" -v DBNAME=SocialMediaDW
*/
:setvar DBNAME "SocialMediaDW"
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
use master
GO
IF (SELECT 1 from sys.databases where [name] = N'$(DBNAME)') = 1
BEGIN 
	DROP DATABASE [$(DBNAME)] 
END
GO
/****** Object:  Database [$(DBNAME)]    Script Date: 27.09.2023 14:53:24 ******/
-- Use slightly different syntax for SQL-Server on-prem versus Azure SQL, as sp_fulltext_database is only available for on-prem SQL-Server

IF (SELECT @@Version ) like N'Microsoft SQL Server %'
	Begin 
		PRINT 'Create Microsoft SQL-Server DB $(DBNAME)'
		CREATE DATABASE [$(DBNAME)] 
		 CONTAINMENT = NONE
		 COLLATE Latin1_General_100_BIN2_UTF8
		IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
			begin
			--EXEC [$(DBNAME)].[dbo].[sp_fulltext_database] @action = 'enable'
			PRINT 'Fulltext is enabled'
			end
	END
ELSE
	BEGIN
		PRINT 'Create Azure SQL DB $(DBNAME)'
		CREATE DATABASE [$(DBNAME)]  
		 COLLATE Latin1_General_100_BIN2_UTF8
		(EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 1 GB) 
	END

GO
-- Switch to SQL 2022 Mode
ALTER DATABASE [$(DBNAME)] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [$(DBNAME)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [$(DBNAME)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [$(DBNAME)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [$(DBNAME)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [$(DBNAME)] SET ARITHABORT OFF 
GO
ALTER DATABASE [$(DBNAME)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [$(DBNAME)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [$(DBNAME)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [$(DBNAME)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [$(DBNAME)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [$(DBNAME)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [$(DBNAME)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [$(DBNAME)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [$(DBNAME)] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [$(DBNAME)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [$(DBNAME)] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [$(DBNAME)] SET  MULTI_USER 
GO
ALTER DATABASE [$(DBNAME)] SET ENCRYPTION ON
GO
ALTER DATABASE [$(DBNAME)] SET QUERY_STORE = ON
GO
ALTER DATABASE [$(DBNAME)] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
ALTER DATABASE [$(DBNAME)] SET  READ_WRITE 
GO
