use AdventureWorks2022
GO
SET XACT_ABORT ON
SET NOCOUNT ON
GO
DECLARE @row2beDeleted int = 0;
DROP TABLE IF EXISTS #temp;
select * into #temp from HumanResources.Employee;
set @row2beDeleted = @@ROWCOUNT;
select @row2beDeleted;

while @row2beDeleted > 0
BEGIN
    BEGIN TRY
        DELETE top (100) from #temp
        SET @row2beDeleted = @row2beDeleted - 100
        -- PRINT @row2beDeleted
    END TRY
    BEGIN CATCH
        SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage  
        -- Test whether the transaction is uncommittable.  
        /*
        IF (XACT_STATE()) = -1  
        BEGIN  
            PRINT N'The transaction is in an uncommittable state. Rolling back transaction.'  
            ROLLBACK TRANSACTION 
        END  
            IF (XACT_STATE()) = 1  
        BEGIN  
            PRINT N'The transaction is in committable state. Comminting transaction.'  
            COMMIT TRANSACTION 
        END  
        */
    END CATCH
END
/*
  IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;  
*/
select count(*) from #temp;
drop table #temp