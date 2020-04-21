SHOW VARIABLES LIKE'transaction_isolation';
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT points FROM customers WHERE customer_id = 1;
SELECT points FROM customers WHERE customer_id = 1;

