# ============================================
# Quick MySQL Data Viewer
# ============================================

Write-Host "=== MySQL Database Viewer ===" -ForegroundColor Cyan
Write-Host ""

# Simple queries to view your data

# 1. View all expenses
Write-Host "Command to view all expenses:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; SELECT * FROM expenses;"' -ForegroundColor Green
Write-Host ""

# 2. View all users
Write-Host "Command to view all users:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; SELECT * FROM users;"' -ForegroundColor Green
Write-Host ""

# 3. View table structure
Write-Host "Command to view table structure:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; DESCRIBE expenses;"' -ForegroundColor Green
Write-Host ""

# 4. Count records
Write-Host "Command to count expenses:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; SELECT COUNT(*) AS total FROM expenses;"' -ForegroundColor Green
Write-Host ""

# 5. View recent expenses
Write-Host "Command to view recent 10 expenses:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; SELECT * FROM expenses ORDER BY date DESC LIMIT 10;"' -ForegroundColor Green
Write-Host ""

# 6. View category breakdown
Write-Host "Command to view spending by category:" -ForegroundColor Yellow
Write-Host 'mysql -u root -p -e "USE expense_tracker; SELECT category, SUM(amount) as total FROM expenses GROUP BY category;"' -ForegroundColor Green
Write-Host ""

Write-Host "=== OR USE MYSQL WORKBENCH ===" -ForegroundColor Cyan
Write-Host "1. Open MySQL Workbench" -ForegroundColor White
Write-Host "2. Connect to your database" -ForegroundColor White
Write-Host "3. Select 'expense_tracker' database" -ForegroundColor White
Write-Host "4. Click on 'expenses' table" -ForegroundColor White
Write-Host "5. Click the table icon (with grid) to view data" -ForegroundColor White
Write-Host ""

Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
