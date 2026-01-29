<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top shadow-sm">
    <div class="container d-flex flex-column flex-lg-row">
      
      <!-- Mobile Layout: Top Row (Logo) -->
      <div class="d-flex w-100 justify-content-center d-lg-none mb-3">
        <a class="navbar-brand m-0" href="#">
          <img src="../assets/logo-nxm.png" alt="NXM Logo" class="logo-image" />
        </a>
      </div>

      <!-- Mobile Layout: Bottom Row (Toggler + Social) -->
      <div class="d-flex w-100 justify-content-between align-items-center d-lg-none">
        <button 
          class="navbar-toggler border-0 p-0" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#navbarNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <ul class="navbar-nav social-icons d-flex flex-row">
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Facebook">
              <img src="../assets/icons/icon-facebook.svg" alt="Facebook" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="LinkedIn">
              <img src="../assets/icons/icon-linkedin.svg" alt="LinkedIn" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Twitter">
              <img src="../assets/icons/icon-twitter.svg" alt="Twitter" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Slack">
              <img src="../assets/icons/icon-slack.svg" alt="Slack" class="social-icon" />
            </a>
          </li>
        </ul>
      </div>

      <!-- Desktop Brand (Hidden on Mobile) -->
      <a class="navbar-brand d-none d-lg-block" href="#">
        <img src="../assets/logo-nxm.png" alt="NXM Logo" class="logo-image" />
      </a>

      <!-- Collapsible Menu -->
      <div class="collapse navbar-collapse w-100 justify-content-center" id="navbarNav">
        <!-- Main Navigation Links -->
        <ul class="navbar-nav mx-auto text-center">
          <li class="nav-item">
            <a class="nav-link active" href="#home">HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#shop">SHOP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#about">ABOUT US</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#influencer">BE AN INFLUENCER</a>
          </li>
        </ul>

        <!-- Desktop Social Icons (Hidden on Mobile) -->
        <ul class="navbar-nav social-icons d-none d-lg-flex flex-row align-items-center mb-0">
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Facebook">
              <img src="../assets/icons/icon-facebook.svg" alt="Facebook" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="LinkedIn">
              <img src="../assets/icons/icon-linkedin.svg" alt="LinkedIn" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Twitter">
              <img src="../assets/icons/icon-twitter.svg" alt="Twitter" class="social-icon" />
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2" href="#" aria-label="Slack">
              <img src="../assets/icons/icon-slack.svg" alt="Slack" class="social-icon" />
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  padding: 1rem 0;
  background-color: #ffffff !important;
}

.container {
  max-width: 95%;
}

.logo-image {
  height: 40px;
  width: auto;
}

.navbar-nav .nav-link {
  color: #99A1A5;
  font-weight: 500;
  font-size: 0.875rem;
  letter-spacing: 0.05em;
  padding: 0.5rem 1rem;
  transition: color 0.3s ease;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link.active {
  color: #416887;
}

.social-icons .nav-link {
  color: #99A1A5;
  font-size: 1.1rem;
  padding: 0.5rem 0.6rem;
}

.social-icons .nav-link:hover {
  color: #416887;
}

.social-icon {
  height: 27px;
  width: 27px;
  transition: opacity 0.3s ease;
}

.social-icons .nav-link:hover .social-icon {
  opacity: 0.8;
}

@media (max-width: 991px) {
  .navbar-nav {
    margin-top: 1rem;
    margin-bottom: 1rem;
  }
}

@media (max-width: 767px) {
  .navbar {
    padding: 0.75rem 0;
  }
  
  .logo-image {
    height: 32px;
  }
  
  .navbar-nav .nav-link {
    padding: 0.5rem 1rem;
    font-size: 0.9rem;
  }
  
  .social-icons .nav-link {
    font-size: 0.9rem;
    padding: 0.25rem; /* Tighter spacing for mobile icons */
  }
}

@media (max-width: 480px) {
  .logo-image {
    height: 28px;
  }
}
</style>
