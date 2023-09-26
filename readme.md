
# Social Media Analytical Data Warehouse Sample 
## Target is an Azure SQL-Server 2022 instance

This is a sample implementaion for a SQL-Server 2022 Datawarehouse to support Social Media Analytics is a scalable fashion.
To make this work, ensure the database is running in compatibility mode 160
The 01_Create Database Instance.sql contains the nessesary configuration changes

## Background

Using the collation 'Latin1_General_100_BIN2_UTF8' for SQL-Server provides the benefit of saved storage space and perfromance, if the application don't need UTF16 codes. Typically suficient in most European countries. This can help to save 1/3 of the storage space compared to all two or three byte collations.
Setting the compatibility mode to 160 allows the usage of many of the new features which have been introduced with SQL-Server 2022.
I am intentionally avoiding the fForeign key constrains in this model for scalability and performance reason.

## Work in progress
The model with regards to DimComments and DimPosts is not yet set in stone, as the initial requirements still not 100% clear. Specifically how the seach of text should operate has some important implication on the design of these tables. 
## Contributing
This project welcomes contributions and suggestions. See the [Contributor's guide](https://github.com/Azure-Samples/Synapse/tree/master/CONTRIBUTE.md)
