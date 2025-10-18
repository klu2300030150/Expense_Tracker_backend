# 🚂 Railway Deployment Configuration

## Railway MySQL Database Connection

Your Spring Boot backend is configured to connect to Railway's cloud MySQL database.

### Connection Details:
- **Host:** tramway.proxy.rlwy.net
- **Port:** 14634
- **Database:** railway
- **Username:** root
- **Password:** (Your Railway MySQL password - replace in application.properties)

### Environment Variables to Set in Railway:

When you deploy to Railway, set these environment variables:

```bash
PORT=8080
DATABASE_URL=jdbc:mysql://tramway.proxy.rlwy.net:14634/railway?useSSL=false&allowPublicKeyRetrieval=true
DB_USERNAME=root
DB_PASSWORD=your_railway_mysql_password
JWT_SECRET=YourSuperSecretKeyForJWTTokenGenerationMustBeLongEnough123456789
CORS_ORIGINS=http://localhost:5173,https://your-frontend-url.vercel.app
```

### How to Deploy:

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Configure Railway MySQL connection"
   git push
   ```

2. **Deploy on Railway:**
   - Go to https://railway.app/
   - Click "New Project" → "Deploy from GitHub repo"
   - Select: `Expense_Tracker_backend`
   - Railway will auto-detect Spring Boot and deploy!

3. **Connect MySQL:**
   - In Railway dashboard, your MySQL service should be visible
   - Railway will automatically set DATABASE_URL environment variable
   - Your backend will connect to it automatically!

4. **Get Your Backend URL:**
   - After deployment, Railway gives you a URL like:
   ```
   https://expense-tracker-backend-production.up.railway.app
   ```

5. **Update Frontend:**
   - Replace `http://localhost:8081` with your Railway backend URL
   - Push frontend changes to GitHub
   - Deploy frontend to Vercel

### Testing Connection Locally:

To test Railway MySQL connection from your local machine:

```bash
mysql -h tramway.proxy.rlwy.net -u root -p --port 14634 --protocol=TCP railway
```

Then run your Spring Boot app:
```bash
mvn spring-boot:run
```

Your backend will connect to Railway's cloud MySQL! 🎉

### Benefits:

✅ **24/7 Database:** Railway MySQL runs continuously  
✅ **No Local MySQL Needed:** Connect from anywhere  
✅ **Automatic Backups:** Railway handles backups  
✅ **Scalable:** Can handle production traffic  
✅ **Free Tier:** $5 credit/month included  

### Database will be shared:
- Local development → Railway MySQL
- Production deployment → Railway MySQL
- Same database for both! Data persists even when you close your laptop.

---

**Note:** Replace `your_railway_mysql_password` in `application.properties` with your actual Railway MySQL password from the connection details above.
