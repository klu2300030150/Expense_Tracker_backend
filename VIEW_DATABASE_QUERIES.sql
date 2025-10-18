-- ============================================
-- MySQL Database Viewing Commands
-- FOR RAILWAY CLOUD DATABASE
-- ============================================

-- CONNECTION INFO:
-- Host: tramway.proxy.rlwy.net
-- Port: 14634
-- Username: root
-- Password: FAuqyBgOVquUtJBPKbWBcPqgjkBNisLf
-- Database: railway

-- Connect using:
-- mysql -h tramway.proxy.rlwy.net -P 14634 -u root -pFAuqyBgOVquUtJBPKbWBcPqgjkBNisLf railway

-- 1. SHOW ALL DATABASES
SHOW DATABASES;

-- 2. USE YOUR DATABASE (RAILWAY, not expense_tracker!)
USE railway;

-- 3. SHOW ALL TABLES IN DATABASE
SHOW TABLES;

-- 4. DESCRIBE TABLE STRUCTURE (See columns, types, etc.)
DESCRIBE expenses;
DESCRIBE users;
DESCRIBE budgets;

-- 5. VIEW ALL DATA FROM TABLES

-- View all expenses
SELECT * FROM expenses;

-- View all users
SELECT * FROM users;

-- View all budgets
SELECT * FROM budgets;

-- ============================================
-- DETAILED QUERIES
-- ============================================

-- 6. COUNT RECORDS
SELECT COUNT(*) AS total_expenses FROM expenses;
SELECT COUNT(*) AS total_users FROM users;
SELECT COUNT(*) AS total_budgets FROM budgets;

-- 7. VIEW EXPENSES WITH USER INFO
SELECT 
    e.id,
    e.amount,
    e.category,
    e.subcategory,
    e.description,
    e.date,
    u.full_name,
    u.email
FROM expenses e
JOIN users u ON e.user_id = u.id
ORDER BY e.date DESC;

-- 8. VIEW EXPENSES BY CATEGORY
SELECT 
    category,
    subcategory,
    COUNT(*) AS count,
    SUM(amount) AS total_amount
FROM expenses
GROUP BY category, subcategory
ORDER BY total_amount DESC;

-- 9. VIEW RECENT EXPENSES (Last 10)
SELECT 
    id,
    amount,
    category,
    subcategory,
    description,
    date
FROM expenses
ORDER BY date DESC
LIMIT 10;

-- 10. VIEW EXPENSES BY USER
SELECT 
    u.full_name,
    COUNT(e.id) AS total_expenses,
    SUM(e.amount) AS total_spent
FROM users u
LEFT JOIN expenses e ON u.id = e.user_id
GROUP BY u.id, u.full_name;

-- 11. VIEW MONTHLY EXPENSE SUMMARY
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    COUNT(*) AS expense_count,
    SUM(amount) AS total_amount
FROM expenses
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY month DESC;

-- 12. VIEW EXPENSES BY CATEGORY (PIE CHART DATA)
SELECT 
    category,
    SUM(amount) AS total,
    COUNT(*) AS count
FROM expenses
GROUP BY category
ORDER BY total DESC;

-- 13. CHECK IF SUBCATEGORY COLUMN EXISTS
SHOW COLUMNS FROM expenses LIKE 'subcategory';

-- 14. VIEW TABLE CREATION INFO
SHOW CREATE TABLE expenses;
SHOW CREATE TABLE users;

-- 15. VIEW DATABASE SIZE
SELECT 
    table_schema AS 'Database',
    SUM(data_length + index_length) / 1024 / 1024 AS 'Size (MB)'
FROM information_schema.tables
WHERE table_schema = 'expense_tracker'
GROUP BY table_schema;

-- 16. VIEW EACH TABLE SIZE
SELECT 
    table_name AS 'Table',
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS 'Size (MB)',
    table_rows AS 'Rows'
FROM information_schema.tables
WHERE table_schema = 'expense_tracker'
ORDER BY (data_length + index_length) DESC;

-- ============================================
-- SPECIFIC QUERIES FOR YOUR USE CASES
-- ============================================

-- 17. VIEW FOOD SUBCATEGORIES
SELECT 
    subcategory,
    COUNT(*) AS count,
    SUM(amount) AS total
FROM expenses
WHERE category = 'Food'
GROUP BY subcategory
ORDER BY total DESC;

-- 18. VIEW TRANSPORT SUBCATEGORIES
SELECT 
    subcategory,
    COUNT(*) AS count,
    SUM(amount) AS total
FROM expenses
WHERE category = 'Transport'
GROUP BY subcategory
ORDER BY total DESC;

-- 19. VIEW TODAY'S EXPENSES
SELECT * FROM expenses
WHERE date = CURDATE()
ORDER BY id DESC;

-- 20. VIEW THIS MONTH'S EXPENSES
SELECT 
    category,
    subcategory,
    SUM(amount) AS total
FROM expenses
WHERE MONTH(date) = MONTH(CURDATE())
  AND YEAR(date) = YEAR(CURDATE())
GROUP BY category, subcategory
ORDER BY total DESC;

-- 21. VIEW HIGHEST EXPENSES
SELECT 
    id,
    amount,
    category,
    subcategory,
    description,
    date
FROM expenses
ORDER BY amount DESC
LIMIT 10;

-- 22. SEARCH EXPENSES BY DESCRIPTION
SELECT * FROM expenses
WHERE description LIKE '%snack%'
   OR description LIKE '%coffee%'
ORDER BY date DESC;

-- ============================================
-- QUICK REFERENCE COMMANDS
-- ============================================

-- View everything at once
USE expense_tracker;
SELECT 'USERS TABLE' AS '=====';
SELECT * FROM users;
SELECT 'EXPENSES TABLE' AS '=====';
SELECT * FROM expenses;
SELECT 'BUDGETS TABLE' AS '=====';
SELECT * FROM budgets;

-- Export data (use in MySQL Workbench)
-- Right-click table → "Table Data Export Wizard"
