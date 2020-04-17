RESTORE DATABASE [AdventureWorks] FROM DISK ='/tmp/AdventureWorksLT2017.bak'
WITH FILE=1,
MOVE 'AdventureWorksLT2012_Data' TO '/var/opt/mssql/data/AdventureWorks.mdf',
MOVE 'AdventureWorksLT2012_Log' TO '/var/opt/mssql/data/AdventureWorks.ldf',
NOUNLOAD, REPLACE, STATS=5
GO