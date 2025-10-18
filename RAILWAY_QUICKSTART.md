# ⚙️ Quick Setup for Railway MySQL

## Step 1: Get Your Railway MySQL Password

1. Go to your Railway dashboard: https://railway.app/dashboard
2. Click on your MySQL service
3. Go to "Variables" tab
4. Copy the value of `MYSQL_ROOT_PASSWORD`

## Step 2: Update application.properties

Replace this line in `src/main/resources/application.properties`:

```properties
spring.datasource.password=${DB_PASSWORD:your_railway_password}
```

With your actual Railway MySQL password:

```properties
spring.datasource.password=${DB_PASSWORD:YOUR_ACTUAL_PASSWORD_HERE}
```

## Step 3: Test Connection

Run your Spring Boot app:

```bash
cd backend
mvn spring-boot:run
```

You should see:
```
HikariPool-1 - Start completed.
Started ExpenseTrackerApplication in X seconds
```

✅ Your app is now connected to Railway's cloud MySQL!

## Step 4: Deploy to Railway

```bash
git add .
git commit -m "Connect to Railway MySQL database"
git push
```

Then in Railway dashboard:
1. Create "New Project"
2. "Deploy from GitHub repo"
3. Select: `Expense_Tracker_backend`
4. Set environment variables (Railway auto-fills DATABASE_URL from MySQL service)
5. Deploy!

Your backend will be live 24/7 at:
```
https://your-app-name.up.railway.app
```

---

## Alternative: Use Environment Variable

Instead of hardcoding the password, you can:

1. Keep the default value as is
2. Set `DB_PASSWORD` environment variable when running:

**On Windows (PowerShell):**
```powershell
$env:DB_PASSWORD="your_railway_password"
mvn spring-boot:run
```

**On Linux/Mac:**
```bash
export DB_PASSWORD="your_railway_password"
mvn spring-boot:run
```

This way, the password is not stored in your code! ✅

---

## Current Configuration:

Your app will use:
- **Development:** Railway MySQL (cloud)
- **Production:** Railway MySQL (cloud)
- **Same database everywhere!**

No need for local MySQL installation anymore! 🎉
