/*
	This Setup.sql file is used to execute all scripts for all tables and configurations to get objects into the target database
	Execute this after the database is created
    The script need to be executed with SQCMD or go-sqlcmd Mode
	sqlcmd -S "rakete-server.database.windows.net" -G -U ralphke@raketetechnology.com -d SocialMediaDW -i "02_Setup.sql" -v DBNAME=SocialMediaDW
*/
:on error exit
:r ./03_DimDate.sql
:r ./04_DimTime.sql
:r ./05_FactSocial.sql
:r ./06_AddSampleData.sql
