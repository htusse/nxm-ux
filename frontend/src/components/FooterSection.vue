<template>
  <footer class="footer-section">
    <div class="container">
      <div class="footer-content">
        <p class="copyright">Copyright © 2022 | <span class="brand">LOGO</span></p>
        <div class="footer-links">
          <a href="#privacy" class="footer-link">Privacy Policy</a>
          <a href="#terms" class="footer-link">Terms & Condition</a>
          <a href="#contact" class="footer-link">Contact Us</a>
          <a href="#faqs" class="footer-link">FAQs</a>
        </div>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer-section {
  background-color: #456276;
  padding: 2rem 0;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1.5rem;
}

.copyright {
  color: #fff;
  margin: 0;
  font-size: 14px;
  font-weight: 200
}

.brand {
  color: white;
  font-weight: 600;
}

.footer-links {
  display: flex;
  gap: 2rem;
  flex-wrap: wrap;
  font-weight: 200
}

.footer-link {
  color: rgba(255, 255, 255, 0.8);
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s ease;
}

.footer-link:hover {
  color: white;
}

@media (max-width: 767px) {
  .footer-section {
    padding: 1.5rem 0;
  }
  
  .footer-content {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
  }
  
  .footer-links {
    justify-content: center;
    gap: 2rem;
  }
  
  .copyright,
  .footer-link {
    font-size: 0.85rem;
  }
}

@media (max-width: 480px) {
  .footer-section {
    padding: 1.25rem 0;
  }
  
  .copyright,
  .footer-link {
    font-size: 0.8rem;
  }
}
</style>
