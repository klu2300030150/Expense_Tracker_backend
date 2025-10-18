# 🚂 How to View Railway Database Data

## ⚠️ IMPORTANT: You're Using Railway Cloud Database!

Your `application.properties` shows:
```
Database URL: tramway.proxy.rlwy.net:14634/railway
Username: root
Password: FAuqyBgOVquUtJBPKbWBcPqgjkBNisLf
```

This is a **CLOUD database on Railway**, not on your local machine!

---

## 🔍 Method 1: Using Railway Dashboard (EASIEST)

### Steps:
1. Go to **https://railway.app**
2. **Login** to your account
3. Click on your **Expense Tracker project**
4. Click on the **MySQL service** (database icon)
5. Click on the **"Data"** tab at the top
6. You'll see a **table viewer** showing all your data!
7. Select `users`, `expenses`, or `budgets` table to view data

**This is the easiest way - GUI interface with all your data!**

---

## 🔍 Method 2: Using MySQL Workbench (Connect to Railway)

### Steps:
1. **Open MySQL Workbench**
2. Click **"+" button** to create new connection
3. **Enter these details:**
   - **Connection Name:** Railway Expense Tracker
   - **Hostname:** `tramway.proxy.rlwy.net`
   - **Port:** `14634`
   - **Username:** `root`
   - **Password:** `FAuqyBgOVquUtJBPKbWBcPqgjkBNisLf`
4. Click **"Test Connection"**
5. If successful, click **"OK"**
6. **Double-click** the new connection
7. Select **`railway`** database
8. View your tables: `users`, `expenses`, `budgets`

---

## 🔍 Method 3: Using PowerShell/Command Line

```powershell
# Connect to Railway MySQL
mysql -h tramway.proxy.rlwy.net -P 14634 -u root -pFAuqyBgOVquUtJBPKbWBcPqgjkBNisLf railway
```

Then run:
```sql
-- View all tables
SHOW TABLES;

-- View all users
SELECT * FROM users;

-- View all expenses
SELECT * FROM expenses;

-- Count records
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM expenses;
```

**Note:** MySQL client must be installed for this method.

---

## 🔍 Method 4: Check Backend Logs

When your Spring Boot backend runs, it shows SQL queries in the console because of:
```properties
spring.jpa.show-sql=true
```

### To see what's in database:
1. **Start your backend** (if not running)
2. **Login through your app**
3. **Add some expenses**
4. **Check the terminal** - you'll see SQL INSERT statements
5. This proves data is being saved!

---

## 🔍 Method 5: Use Railway CLI

### Install Railway CLI:
```powershell
npm i -g @railway/cli
```

### Connect and query:
```powershell
# Login to Railway
railway login

# Link to your project
railway link

# Connect to database
railway connect mysql

# Then run SQL queries
SELECT * FROM users;
SELECT * FROM expenses;
```

---

## 📊 Quick Check: Is Data Being Saved?

### Test in your application:
1. **Open your app:** http://localhost:5173/Expense_Tracker_Frontend/
2. **Login** with your credentials
3. **Add a test expense:**
   - Amount: 100
   - Category: Food
   - Subcategory: Snacks
   - Description: "Test expense"
4. **Check browser console** (F12) for API responses
5. **Check backend terminal** for SQL statements

If you see SQL INSERT statements in backend logs, **data IS being saved to Railway!**

---

## 🐛 Troubleshooting

### Issue: "Can't connect to Railway database"
**Solution:** 
- Check if Railway service is running
- Verify database credentials in `application.properties`
- Make sure Railway database is not paused

### Issue: "No data showing"
**Possible reasons:**
1. **Wrong database:** Using `expense_tracker` instead of `railway`
2. **No data added yet:** Sign up and add expenses first!
3. **Backend not running:** Start Spring Boot backend
4. **Frontend not connected:** Check `config.js` has correct API URL

### Issue: "Tables don't exist"
**Solution:**
- Make sure backend ran at least once (it creates tables automatically)
- Check `spring.jpa.hibernate.ddl-auto=update` is in properties

---

## ✅ Correct Database Names

Your SQL queries need to use **`railway`** database, not `expense_tracker`:

```sql
-- CORRECT (for Railway)
USE railway;
SELECT * FROM users;
SELECT * FROM expenses;

-- WRONG (this is for local MySQL)
USE expense_tracker;
```

---

## 🔧 Updated SQL Queries for Railway

```sql
-- Connect to Railway database
USE railway;

-- View all tables
SHOW TABLES;

-- View users
SELECT * FROM users;

-- View expenses
SELECT * FROM expenses;

-- View expenses with user info
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

-- Count records
SELECT 
    (SELECT COUNT(*) FROM users) as total_users,
    (SELECT COUNT(*) FROM expenses) as total_expenses;

-- Check table structure
DESCRIBE users;
DESCRIBE expenses;
DESCRIBE budgets;
```

---

## 🎯 Recommended: Use Railway Dashboard

**The easiest way to view your data:**

1. **Go to:** https://railway.app
2. **Login**
3. **Open your project**
4. **Click MySQL service**
5. **Click "Data" tab**
6. **Browse your tables visually!**

No command line needed! 🎉

---

## 📱 Alternative: Use DBeaver (Free Tool)

DBeaver is a free database tool that works great with Railway:

1. **Download:** https://dbeaver.io/download/
2. **Install and open**
3. **New Connection** → MySQL
4. **Enter Railway credentials:**
   - Host: `tramway.proxy.rlwy.net`
   - Port: `14634`
   - Database: `railway`
   - Username: `root`
   - Password: `FAuqyBgOVquUtJBPKbWBcPqgjkBNisLf`
5. **Test connection** → **Finish**
6. **Browse your data!**

---

## 🎉 Summary

**Your data IS being saved - it's just in the cloud!**

**3 Easiest Ways to View:**
1. ✅ **Railway Dashboard** (Best - GUI interface)
2. ✅ **MySQL Workbench** (Good - Desktop app)
3. ✅ **Backend Logs** (Quick - Just read console)

**Your database is NOT local - it's on Railway's cloud servers!**

---

## 💡 Pro Tip

Add this to your backend logs to see all database activity:
```properties
logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
```

This will show you EVERY SQL query and confirm data is being saved!

---

**The SQL queries I gave you earlier are correct, just use them on Railway's database, not local MySQL!** 🚀
