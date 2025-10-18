# 🚀 Deploy Your Expense Tracker to Railway (Free 24/7 Hosting)

## ✅ What We've Done:
- ✅ Added Railway deployment configuration
- ✅ Made application.properties use environment variables
- ✅ Pushed everything to GitHub
- ✅ Backend is ready for cloud deployment!

---

## 📋 Step-by-Step Deployment Guide

### Step 1: Sign Up for Railway

1. Go to **https://railway.app/**
2. Click **"Start a New Project"**
3. Sign up with your **GitHub account**
4. Authorize Railway to access your repositories

---

### Step 2: Create MySQL Database on Railway

1. In Railway dashboard, click **"+ New"**
2. Select **"Database"**
3. Choose **"MySQL"**
4. Railway will create a MySQL database and provide:
   - `MYSQLHOST`
   - `MYSQLPORT`
   - `MYSQLUSER`
   - `MYSQLPASSWORD`
   - `MYSQLDATABASE`

---

### Step 3: Deploy Spring Boot Backend

1. Click **"+ New"** again
2. Select **"GitHub Repo"**
3. Choose: **klu2300030150/Expense_Tracker_backend**
4. Railway will automatically detect it's a Java/Maven project
5. Click **"Deploy"**

---

### Step 4: Configure Environment Variables

In your backend service settings, add these environment variables:

```
PORT=8080
DATABASE_URL=jdbc:mysql://[MYSQLHOST]:[MYSQLPORT]/[MYSQLDATABASE]?useSSL=false&allowPublicKeyRetrieval=true
DB_USERNAME=[MYSQLUSER]
DB_PASSWORD=[MYSQLPASSWORD]
JWT_SECRET=YourSuperSecretKeyForJWTTokenGenerationMustBeLongEnough123456789
CORS_ORIGINS=http://localhost:5173,https://your-frontend-url.vercel.app
```

**Pro Tip:** Railway can auto-fill MySQL variables! Just click the MySQL service and connect it to your backend.

---

### Step 5: Get Your Backend URL

Once deployed, Railway will give you a public URL like:
```
https://expense-tracker-backend-production.up.railway.app
```

This is your **API base URL** that runs 24/7! 🎉

---

### Step 6: Update Your React Frontend

In your React frontend, update the API URLs:

**Before (local):**
```javascript
http://localhost:8080/api/auth/login
```

**After (deployed):**
```javascript
https://expense-tracker-backend-production.up.railway.app/api/auth/login
```

Update in these files:
- `src/pages/Login.jsx`
- `src/pages/Signup.jsx`
- `src/pages/Dashboard.jsx`

---

### Step 7: Deploy Frontend to Vercel (Free)

1. Go to **https://vercel.com/**
2. Sign in with GitHub
3. Click **"New Project"**
4. Import: **klu2300030150/Expense_Tracker_Frontend**
5. Vercel will auto-deploy your React app!

Your frontend will be at:
```
https://expense-tracker-frontend.vercel.app
```

---

## 🎯 Final Architecture (24/7 Live!)

```
User's Browser
     ↓
React Frontend (Vercel) ← Free 24/7 hosting
https://expense-tracker.vercel.app
     ↓
Spring Boot Backend (Railway) ← Free 24/7 hosting
https://expense-tracker-backend.railway.app
     ↓
MySQL Database (Railway) ← Free database
Running 24/7 in cloud
```

---

## 💰 Cost Breakdown

### Railway (Backend + MySQL):
- **Free Tier:** $5 credit/month
- Backend: ~$3/month
- MySQL: ~$2/month
- **Total: FREE for hobby projects!**

### Vercel (Frontend):
- **Completely FREE** for unlimited projects
- Auto-deploys on every GitHub push
- Global CDN for fast loading

---

## 🔄 Auto-Deployment Setup

### For Backend (Railway):
✅ Already configured! Every time you push to GitHub:
```bash
git push
```
Railway automatically redeploys your backend! 🚀

### For Frontend (Vercel):
✅ Also auto-configured! Every push to GitHub:
```bash
git push
```
Vercel automatically rebuilds and deploys! 🎉

---

## 🛠️ Useful Railway Commands

### View Logs:
```
Click your service → Deployments → View Logs
```

### Restart Service:
```
Click your service → Settings → Restart
```

### Add Custom Domain:
```
Click your service → Settings → Domains
```

---

## 🐛 Troubleshooting

### Backend won't start:
- Check environment variables are set correctly
- Verify MySQL connection string
- Check logs for errors

### Frontend can't connect:
- Update API URLs to Railway backend URL
- Check CORS_ORIGINS includes your Vercel URL
- Verify backend is running (green status)

### Database connection failed:
- Ensure MySQL service is running on Railway
- Check DATABASE_URL format
- Verify DB credentials

---

## 📱 Testing Your Live App

1. Open your Vercel URL: `https://expense-tracker.vercel.app`
2. Sign up with a new account
3. Login and add expenses
4. Everything works 24/7! 🎉

---

## 🎓 What You've Learned

✅ How to deploy Spring Boot to cloud  
✅ How to configure environment variables  
✅ How to connect to cloud MySQL database  
✅ How to deploy React frontend  
✅ How to set up auto-deployments  
✅ How to build a full-stack app that runs 24/7!

---

## 🔗 Quick Links

- **Railway Dashboard:** https://railway.app/dashboard
- **Vercel Dashboard:** https://vercel.com/dashboard
- **Your Backend Repo:** https://github.com/klu2300030150/Expense_Tracker_backend
- **Your Frontend Repo:** https://github.com/klu2300030150/Expense_Tracker_Frontend

---

**🎉 Congratulations! Your app is now live and accessible from anywhere in the world!**

No need to keep your computer running - Railway and Vercel handle everything 24/7! 🚀
