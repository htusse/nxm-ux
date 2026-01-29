# NXM UX TSA - Backend API

PHP REST API for handling contact form submissions with MySQL database storage.

## 🚀 Quick Start

### Prerequisites

- PHP 8.1+ installed
- MySQL 8.0+ installed
- Database created and configured

### Database Setup

1. **Create the database:**

```bash
mysql -u root -p < ../database.sql
```

2. **Configure database connection:**

Edit `config/database.php` with your credentials:

```php
define('DB_HOST', 'localhost');
define('DB_NAME', 'nxm_tsa');
define('DB_USER', 'root');        // Your MySQL username
define('DB_PASS', '');            // Your MySQL password
```

### Running the Backend Server

#### Option A: PHP Built-in Server (Recommended for Development)

```bash
php -S localhost:8000
```

API will be available at: `http://localhost:8000/api`

#### Option B: Apache/Nginx (XAMPP/MAMP/WAMP)

1. Copy backend folder to web server directory:
   - XAMPP: `/xampp/htdocs/nxm-ux-tsa/backend/`
   - MAMP: `/Applications/MAMP/htdocs/nxm-ux-tsa/backend/`
   - WAMP: `/wamp/www/nxm-ux-tsa/backend/`

2. Start Apache from control panel

3. API available at: `http://localhost/nxm-ux-tsa/backend/api`

## 📡 API Endpoints

### POST `/api/submit-form.php`

Submit contact form data.

**Request Headers:**
```
Content-Type: application/json
```

**Request Body:**
```json
{
  "fullName": "John Doe",
  "email": "john@example.com",
  "phone": "+1 (555) 123-4567",
  "subject": "General Inquiry",
  "message": "I would like to know more about your products."
}
```

**Success Response (201):**
```json
{
  "success": true,
  "message": "Thank you! Your message has been sent successfully.",
  "data": {
    "submission_id": 1
  }
}
```

**Error Response (400/500):**
```json
{
  "success": false,
  "message": "Error message here",
  "data": null
}
```

## 🗄️ Database Schema

### Table: `contact_submissions`

| Column | Type | Constraints |
|--------|------|-------------|
| `id` | INT UNSIGNED | PRIMARY KEY, AUTO_INCREMENT |
| `full_name` | VARCHAR(255) | NOT NULL |
| `email` | VARCHAR(255) | NOT NULL |
| `phone` | VARCHAR(50) | NOT NULL |
| `subject` | VARCHAR(255) | NOT NULL |
| `message` | TEXT | NOT NULL |
| `ip_address` | VARCHAR(45) | NULL |
| `user_agent` | TEXT | NULL |
| `submitted_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

**Indexes:**
- `idx_email` on `email` column
- `idx_submitted_at` on `submitted_at` column

## 🔒 Security Features

- ✅ **SQL Injection Prevention** - PDO prepared statements
- ✅ **XSS Protection** - Input sanitization with `htmlspecialchars()`
- ✅ **CORS Configuration** - Allows frontend access
- ✅ **Input Validation** - Server-side validation for all fields
- ✅ **Error Handling** - Proper error logging without exposing sensitive data

## 🧪 Testing the API

### Using cURL:

```bash
curl -X POST http://localhost:8000/api/submit-form.php \
  -H "Content-Type: application/json" \
  -d '{
    "fullName": "Test User",
    "email": "test@example.com",
    "phone": "1234567890",
    "subject": "Test Subject",
    "message": "This is a test message"
  }'
```

### Using the Test Script:

```bash
cd ..
bash test-backend.sh
```

## 📁 Project Structure

```
backend/
├── api/
│   └── submit-form.php      # Main API endpoint
├── config/
│   └── database.php         # Database configuration
├── .htaccess                # Apache configuration
└── README.md                # This file
```

## 🐛 Troubleshooting

**Database connection fails:**
- Verify MySQL is running: `mysql --version`
- Check credentials in `config/database.php`
- Ensure database `nxm_tsa` exists

**CORS errors:**
- Ensure backend server is running
- Check `Access-Control-Allow-Origin` headers in `submit-form.php`
- Frontend URL must match CORS configuration

**Port 8000 already in use:**
```bash
# Use a different port
php -S localhost:8001
```
Don't forget to update frontend `.env` file:
```env
VITE_API_URL=http://localhost:8001/api
```

**View PHP errors:**
```bash
# Check PHP error log
tail -f /path/to/php/error.log
```

## 📝 Validation Rules

- **Full Name**: Required, min 2 characters, must include first and last name
- **Email**: Required, valid email format
- **Phone**: Required, min 10 digits
- **Subject**: Required
- **Message**: Required, min 10 characters

## 🔧 Configuration Files

### `config/database.php`

Database connection configuration using PDO.

### `api/submit-form.php`

Main API endpoint with:
- CORS headers
- Input validation
- Sanitization
- Database insertion
- Error handling

## 📊 Monitoring

### View Submissions:

```sql
mysql -u root -p nxm_tsa

SELECT * FROM contact_submissions ORDER BY submitted_at DESC LIMIT 10;
```

### Count Total Submissions:

```sql
SELECT COUNT(*) as total FROM contact_submissions;
```

## 🚀 Production Deployment

1. **Disable error display** in `submit-form.php`
2. **Use environment variables** for database credentials
3. **Enable HTTPS**
4. **Restrict CORS** to specific domains
5. **Add rate limiting** to prevent spam
6. **Set up database backups**

## 📚 Learn More

- [PHP Documentation](https://www.php.net/docs.php)
- [PDO Documentation](https://www.php.net/manual/en/book.pdo.php)
- [MySQL Documentation](https://dev.mysql.com/doc/)
