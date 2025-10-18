-- Add subcategory column to expenses table
-- Run this SQL script in your MySQL database

USE expense_tracker;

-- Add subcategory column
ALTER TABLE expenses 
ADD COLUMN subcategory VARCHAR(100) NULL AFTER category;

-- Optional: Add index for better query performance
CREATE INDEX idx_expenses_subcategory ON expenses(subcategory);

-- Verify the change
DESCRIBE expenses;

SELECT 'Subcategory column added successfully!' AS Status;
