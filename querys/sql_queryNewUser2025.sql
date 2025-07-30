USE master;

use teste1

SELECT name, is_disabled 
FROM sys.server_principals 


--CREATE LOGIN login_henrique
--WITH PASSWORD = 'H054169e';

--SELECT name FROM sys.database_principals WHERE name = 'henrique_db';

--ALTER LOGIN login_henrique ENABLE;

--CREATE USER henrique_db FOR LOGIN login_henrique;
--SELECT name FROM sys.database_principals

--ALTER ROLE db_owner ADD MEMBER henrique_db;

--ALTER LOGIN login_henrique WITH PASSWORD = '@H054169e';


SELECT name AS LoginName, type_desc AS LoginType, is_disabled
FROM sys.server_principals
WHERE type IN ('S', 'U')  -- S = SQL Login, U = Windows Login
ORDER BY name;

SELECT * FROM sys.database_principals

SELECT name, type_desc 
FROM sys.database_principals 
WHERE name = 'henrique_db';

ALTER ROLE db_owner ADD MEMBER henrique_db;
