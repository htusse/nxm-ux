# NXM UX TSA - Vue.js Frontend with PHP Backend

A pixel-perfect, responsive web application built with Vue.js 3, Bootstrap 5, and PHP/MySQL backend.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [API Endpoints](#api-endpoints)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

This project is a fully functional webpage based on Figma design specifications featuring:
- Responsive hero section
- Video showcase section
- Interactive contact form modal with validation
- PHP backend for form submission
- MySQL database for data persistence

## ✨ Features

- **Pixel-Perfect Design**: Matches Figma specifications exactly
- **Fully Responsive**: Mobile, tablet, and desktop compatible
- **Form Validation**: Client-side and server-side validation
- **Smooth Animations**: Bootstrap modal transitions
- **Secure Backend**: SQL injection prevention with prepared statements
- **Cross-Browser Compatible**: Works on Chrome, Firefox, and Edge
- **Clean Code**: Optimized and well-documented

## 🛠️ Technology Stack

### Frontend
- **Vue.js 3.4+** - Progressive JavaScript framework
- **Vite 5.0+** - Next-generation frontend build tool
- **Bootstrap 5.3+** - CSS framework for responsive design
- **Yup 1.3+** - Schema validation
- **Axios 1.6+** - HTTP client for API calls

### Backend
- **PHP 8.1+** - Server-side programming language
- **MySQL 8.0+** - Relational database
- **PDO** - Database abstraction layer

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18 or higher) - [Download](https://nodejs.org/)
- **npm** or **yarn** - Comes with Node.js
- **PHP** (v8.1 or higher) - [Download](https://www.php.net/downloads)
- **MySQL** (v8.0 or higher) - [Download](https://dev.mysql.com/downloads/)
- **Apache** or **Nginx** - Web server
- **Git** - Version control

### Verify Installation

```bash
node --version
npm --version
php --version
mysql --version
```

## 🚀 Installation

### 1. Clone or Extract the Project

```bash
cd /path/to/your/projects
unzip nxm-ux-tsa.zip
cd nxm-ux-tsa
```

### 2. Install Frontend Dependencies

```bash
cd frontend
npm install
```

### 3. Set Up Database

**Option A: Using MySQL Command Line**

```bash
mysql -u root -p < ../database.sql
```

**Option B: Using phpMyAdmin**

1. Open phpMyAdmin in your browser
2. Create a new database named `nxm_tsa`
3. Import the `database.sql` file

**Option C: Manual Setup**

```bash
mysql -u root -p
```

Then run:

```sql
CREATE DATABASE nxm_tsa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nxm_tsa;
SOURCE /path/to/database.sql;
```

### 4. Configure Backend

**Update Database Credentials:**

Edit `backend/config/database.php`:

```php
define('DB_HOST', 'localhost');
define('DB_NAME', 'nxm_tsa');
define('DB_USER', 'root');        // Your MySQL username
define('DB_PASS', '');            // Your MySQL password
```

**Deploy Backend to Web Server:**

**For XAMPP/WAMP:**

```bash
cp -r backend /path/to/xampp/htdocs/nxm-ux-tsa/
```

**For MAMP (macOS):**

```bash
cp -r backend /Applications/MAMP/htdocs/nxm-ux-tsa/
```

**For Built-in PHP Server (Development Only):**

```bash
cd backend
php -S localhost:8000
```

### 5. Configure Frontend Environment

Create `.env` file in the `frontend` directory:

```bash
cd frontend
cp .env.example .env
```

Edit `.env` and update the API URL:

```env
VITE_API_URL=http://localhost/nxm-ux-tsa/backend/api
```

Or if using built-in PHP server:

```env
VITE_API_URL=http://localhost:8000/api
```

## ⚙️ Configuration

### Frontend Configuration

**Vite Config** (`frontend/vite.config.js`):

```javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  server: {
    port: 3000,
    open: true
  }
})
```

### Backend Configuration

**CORS Settings** - Already configured in `backend/api/submit-form.php`:

```php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
```

## 🏃 Running the Application

### Quick Start - Both Applications

You need to run **both** the frontend and backend simultaneously. Open **two terminal windows**:

#### Terminal 1 - Start Backend Server:

**Option A: Using PHP Built-in Server (Recommended for Development)**

```bash
cd backend
php -S localhost:8000
```

Backend API will run at: `http://localhost:8000/api`

**Option B: Using XAMPP/MAMP/WAMP**

1. Start Apache from XAMPP/MAMP Control Panel
2. Ensure backend files are in: `/htdocs/nxm-ux-tsa/backend/`
3. Backend API will be at: `http://localhost/nxm-ux-tsa/backend/api`

#### Terminal 2 - Start Frontend Application:

```bash
cd frontend
npm run dev
```

Frontend will run at: `http://localhost:5173` (or the port shown in terminal)

#### ✅ Verify Both Are Running:

- Frontend: Open `http://localhost:5173` in your browser
- Backend: The frontend will automatically connect to the backend API
- Test: Click "Connect with Ben" button and submit the form

### Important Notes:

- **Always start the backend FIRST**, then the frontend
- **Keep both terminals running** while using the application
- Press `Ctrl+C` in each terminal to stop the servers
- If you see CORS errors, ensure the backend is running

### Production Build

```bash
cd frontend
npm run build
```

Built files will be in `frontend/dist/` directory.

## 📁 Project Structure

```
nxm-ux-tsa/
├── frontend/
│   ├── public/
│   │   └── (static assets)
│   ├── src/
│   │   ├── assets/
│   │   │   └── style.css
│   │   ├── components/
│   │   │   ├── ContactFormModal.vue
│   │   │   └── HeroSection.vue
│   │   ├── App.vue
│   │   └── main.js
│   ├── .env
│   ├── .env.example
│   ├── index.html
│   ├── package.json
│   └── vite.config.js
├── backend/
│   ├── api/
│   │   └── submit-form.php
│   ├── config/
│   │   └── database.php
│   └── .htaccess
├── database.sql
├── README.md
├── PROJECT_PLAN.md
└── VIDEO_LINK.txt
```

## 🗄️ Database Schema

### Table: `contact_submissions`

| Column | Type | Description |
|--------|------|-------------|
| `id` | INT UNSIGNED AUTO_INCREMENT | Primary key |
| `full_name` | VARCHAR(255) | Contact's full name |
| `email` | VARCHAR(255) | Email address |
| `phone` | VARCHAR(50) | Phone number |
| `subject` | VARCHAR(255) | Message subject |
| `message` | TEXT | Message content |
| `ip_address` | VARCHAR(45) | Client IP address |
| `user_agent` | TEXT | Browser user agent |
| `submitted_at` | TIMESTAMP | Submission timestamp |

**Indexes:**
- `idx_email` on `email`
- `idx_submitted_at` on `submitted_at`

## 🔌 API Endpoints

### POST `/api/submit-form.php`

Submit contact form data.

**Request:**

```json
{
  "fullName": "John Doe",
  "email": "john@example.com",
  "phone": "+1 (555) 123-4567",
  "subject": "General Inquiry",
  "message": "I would like to know more about your services."
}
```

**Success Response (201):**

```json
{
  "success": true,
  "message": "Thank you! Your message has been sent successfully.",
  "data": {
    "submission_id": 123
  }
}
```

**Error Response (400):**

```json
{
  "success": false,
  "message": "Email is required",
  "data": null
}
```

## 🐛 Troubleshooting

### Frontend Issues

**Problem: `npm install` fails**

```bash
# Clear npm cache
npm cache clean --force
# Delete node_modules and package-lock.json
rm -rf node_modules package-lock.json
# Reinstall
npm install
```

**Problem: Port 3000 already in use**

Edit `vite.config.js` and change the port:

```javascript
server: {
  port: 3001, // or any available port
  open: true
}
```

### Backend Issues

**Problem: Database connection fails**

1. Verify MySQL is running
2. Check credentials in `backend/config/database.php`
3. Ensure database `nxm_tsa` exists
4. Test connection:

```bash
mysql -u root -p nxm_tsa -e "SHOW TABLES;"
```

**Problem: CORS errors**

Ensure `.htaccess` is properly configured and `mod_headers` is enabled in Apache:

```bash
# Enable mod_headers in Apache
sudo a2enmod headers
sudo service apache2 restart
```

**Problem: 404 on API endpoint**

1. Verify backend is accessible: `http://localhost/nxm-ux-tsa/backend/api/submit-form.php`
2. Check `.env` file has correct `VITE_API_URL`
3. Ensure web server is running

### Common Issues

**Problem: Form submission not working**

1. Open browser DevTools (F12) → Console tab
2. Check for errors
3. Verify API endpoint in Network tab
4. Test API directly with Postman/cURL:

```bash
curl -X POST http://localhost/nxm-ux-tsa/backend/api/submit-form.php \
  -H "Content-Type: application/json" \
  -d '{
    "fullName": "Test User",
    "email": "test@example.com",
    "phone": "1234567890",
    "subject": "Test",
    "message": "This is a test message"
  }'
```

**Problem: Styling looks broken**

1. Clear browser cache
2. Hard refresh (Ctrl+Shift+R or Cmd+Shift+R)
3. Check if Bootstrap CSS is loaded in DevTools → Network tab

## 🎥 Video Demo

Video demonstration available at: [See VIDEO_LINK.txt]

## 📝 License

This project is created for assessment purposes.

## 👥 Team

- **HR CHAMP**: Yen Desierto Yen
- **SCRUM MASTER**: Herve Tusse Herve

## 📞 Support

For issues or questions, please contact the development team.

---

**Last Updated**: January 21, 2026  
**Version**: 1.0.0
