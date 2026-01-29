# NXM UX TSA - Frontend Application

Vue 3 + Vite frontend application for NXM collagen products showcase.

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ installed
- Backend server running (see main README)

### Installation

```bash
npm install
```

### Running the Application

**Important:** Start the backend server FIRST before running the frontend.

#### Step 1: Start Backend (in a separate terminal)

```bash
cd ../backend
php -S localhost:8000
```

#### Step 2: Start Frontend (in this terminal)

```bash
npm run dev
```

The application will open at `http://localhost:5173`

### Other Commands

```bash
# Build for production
npm run build

# Preview production build
npm run preview
```

## 🔧 Configuration

If your backend is running on a different port or URL, create a `.env` file:

```env
VITE_API_URL=http://localhost:8000/api
```

## 📚 Learn More

- [Vue 3 Documentation](https://vuejs.org/)
- [Vite Documentation](https://vitejs.dev/)
- [Bootstrap 5 Documentation](https://getbootstrap.com/)

## 🐛 Troubleshooting

**Form submission fails:**
- Ensure backend server is running on port 8000
- Check browser console for errors
- Verify database is set up correctly

**Port 5173 already in use:**
- Vite will automatically try the next available port
- Check the terminal output for the actual URL
