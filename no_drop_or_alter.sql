--A simple trigger that prevents non-dbowners to drop or alter tables
USE TestDB
GO

CREATE TRIGGER ddl_no_drop_or_alter ON DATABASE 
	FOR DROP_TABLE, ALTER_TABLE --Will only get triggered during dropping or altering of tables
AS 
IF IS_MEMBER ('db_owner') = 0 --Checks whether the current user is the owner of the Database
BEGIN
-- A simple warning followed by a rollback to prevent altering or dropping
   PRINT 'Only the DB owner is permitted to drop or alter tables.' 
   ROLLBACK TRANSACTION
END
GO


