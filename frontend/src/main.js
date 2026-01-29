import { createApp } from 'vue'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-icons/font/bootstrap-icons.css'
import './assets/style.css'
import App from './App.vue'

// Import Bootstrap JS and expose it globally
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

createApp(App).mount('#app')
