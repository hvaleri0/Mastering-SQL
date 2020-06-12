-- 1: web/desktop application
CREATE USER moon_app IDENTIFIED BY '1234';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
ON sql_store.* -- to specify a table -> sql.store.customer
TO moon_app;  -- to specify domain -> moon_app@domainname 

-- 2: admin
GRANT ALL
ON *.* -- all tables in all databases
to john;

-- showing privileges
SHOW GRANTS FOR moon_app;