-- Open Postico.
-- Create a local connection to your Postgres server, if needed.
-- Click the button in the upper left with the elephant icon, to get back to the list of databases/
-- Create a new database using the button at the bottom.
-- Double click your new DB.
-- Double click SQL query.
-- Paste everything from this file (https://drive.google.com/file/d/0B10Wu-zrSBwMODZMbHZ1UUNPejQ/view?usp=sharing) into the upper textbox
-- Press cmd + option + enter or select Connection -> Execute All Queries.
-- Press cmr + R or select Connection -> Reload.

-- 1. Get all users from Chicago.
SELECT username FROM syntax_practice WHERE city = 'chicago';
-- I wasnt sure if you wanted the username or the whole users data, so the
--above gets just the username and the below gets all the users data
SELECT * FROM syntax_practice WHERE city = 'chicago';

-- 2. Get all users with usernames that contain the letter a.
--again like the previous question and from now on if it says username, then
-- i will assume only the username is wanted and, username for the selector
--could be changed to * to get all the users data that fulfill the conditional clause
SELECT username FROM syntax_practice WHERE username LIKE '%a%';

-- 3. The bank is giving a new customer bonus! Update all records
--with an account balance of 0.00 and a transactions_attempted of 0. Give them
-- a new account balance of 10.00.
UPDATE syntax_practice SET account_balance = '10.00' WHERE account_balance = '0.00' AND transactions_attempted = '0';
-- 4. Select all users that have attempted 9 or more transactions.
SELECT username FROM syntax_practice WHERE transactions_attempted > '9';

-- 5. Get the username and account balance of the 3 users with the highest balances,
-- sort highest to lowest balance. NOTE: Research LIMIT
SELECT username, account_balance FROM syntax_practice ORDER BY account_balance DESC LIMIT 3;

-- 6. Get the username and account balance of the 3 users with the lowest balances,
-- sort lowest to highest balance.
SELECT username, account_balance FROM syntax_practice ORDER BY account_balance ASC LIMIT 3;

-- 7. Get all users with account balances that are more than $100.
SELECT * FROM syntax_practice WHERE account_balance > '100.00';

-- 8. Add a new record.
INSERT INTO syntax_practice (username, city, transactions_completed, transactions_attempted, account_balance) VALUES
('brian', 'minneapolis', 0, 0, 1000000);

-- 9. The bank is losing money in Miami and Phoenix and needs to unload low
--transaction customers: Delete users that reside in miami OR phoenix and have
--completed fewer than 5 transactions.
DELETE FROM syntax_practice WHERE city='miami' OR city='phoenix' AND transactions_completed < 5;
