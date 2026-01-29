# 🚀 Quick Start Guide

## Start Both Applications in 3 Steps:

### Step 1: Install Dependencies (First Time Only)

```bash
cd frontend
npm install
cd ..
```

### Step 2: Set Up Database (First Time Only)

```bash
mysql -u root -p < database.sql
```

Update `backend/config/database.php` with your MySQL credentials if needed.

### Step 3: Start Both Servers

Open **TWO terminal windows**:

#### Terminal 1 - Backend:
```bash
cd backend
php -S localhost:8000
```
✅ Backend running at: http://localhost:8000

#### Terminal 2 - Frontend:
```bash
cd frontend
npm run dev
```
✅ Frontend running at: http://localhost:5173

### 🎉 Open Your Browser

Visit: **http://localhost:5173**

---

## Stop the Servers

Press `Ctrl+C` in each terminal window.

---

## Need Help?

See the detailed [README.md](README.md) for full installation and configuration instructions.
