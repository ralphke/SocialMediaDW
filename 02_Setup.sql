/*
	This Setup.sql file is used to execute all scripts for all tables and configurations to get objects into the target database
	Execute this after the database is created
    The script need to be executed with SQCMD or go-sqlcmd Mode
	sqlcmd -S "rakete-server.database.windows.net" -G -U ralphke@raketetechnology.com -d SocialMediaDW -i "02_Setup.sql" -v DBNAME=SocialMediaDW
*/
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
:r ./03_DimDate.sql
:r ./04_DimTime.sql
:r ./05_FactSocial.sql
:r ./06_AddSampleData.sql
