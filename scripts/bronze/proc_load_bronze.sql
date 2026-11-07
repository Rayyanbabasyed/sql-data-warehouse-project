/*
===================================================================================================
Stored Procedure: Load Bronze Layer (Source > Bronze)
===================================================================================================
Script Purpose:
This stored procedure loads data into the 'bronze schema from external CSV files.
It performs the following actions:
-Truncates the bronze tables before loading data.
-Uses the BULK INSERT command to load data from csv Files to bronze tables.
Parameters:
None.
This stored procedure does not accept any parameters or return any values.
Usage Example:
EXEC bronze.load_bronze;
=====================================================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @START_time datetime,@end_time datetime , @batch_start_time datetime, @batch_end_time datetime;
    BEGIN TRY 
        set @batch_start_time = getdate();
        PRINT '=====================================';
        PRINT 'Loading Bronze Layer'; 
        PRINT '=====================================';
        print '------------------------------------------------------------------------------------------------------'
        PRINT '=====================================';
        PRINT 'loading crm tables';
        PRINT '=====================================';
        -- 1. CRM CUSTOMER INFORMATION
        set @START_time = getdate();
        PRINT '>> Truncating table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        PRINT '>> Inserting data into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_crm\cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';
        print '--------------------------------------'

        -- 2. CRM PRODUCT INFORMATION
          set @START_time = getdate();
        PRINT '>> Truncating table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        PRINT '>> Inserting data into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_crm\prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';
        -- 3. CRM SALES DETAILS
        set @START_time = getdate();
        PRINT '>> Truncating table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '>> Inserting data into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_crm\sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';
        print '---------------------------------------------------------------------------------------------------'
        PRINT '=====================================';
        PRINT 'loading erp tables';
        PRINT '=====================================';
        -- 4. ERP CUSTOMER
        set @START_time = getdate();
        PRINT '>> Truncating table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        PRINT '>> Inserting data into: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_erp\CUST_AZ12.csv'
          WITH
            (
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';
      
        -- 5. ERP LOCATION
          set @START_time = getdate();
        PRINT '>> Truncating table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        PRINT '>> Inserting data into: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_erp\LOC_A101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';

        -- 6. ERP PRODUCT CATEGORY
        set @START_time = getdate();
        PRINT '>> Truncating table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\rayya\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\01_datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);
        set @end_time = getdate();
        print '>>load duration:' + cast(datediff(second,@START_time,@end_time) as varchar) +'seconds';
        set @batch_end_time = getdate();
   PRINT '=====================================';
   PRINT 'Bronze Layer Loading Completed'; 
   print 'total load duaration :-' + cast(datediff(second,@batch_start_time,@batch_end_time) as varchar) +'seconds';
   PRINT '=====================================';
    END TRY 
    BEGIN CATCH 
    

    PRINT '=====================================';
    PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER ';
    PRINT 'ERROR MESSAGE'+ ERROR_MESSAGE();
    PRINT 'ERROR MESSAGE '+ CAST (ERROR_NUMBER()  AS NVARCHAR );
    PRINT 'ERROR MESSAGE '+ CAST (ERROR_STATE ()  AS NVARCHAR );
    PRINT '=====================================';
    END CATCH
END
