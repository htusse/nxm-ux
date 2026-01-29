<template>
  <section class="hero-section" id="home">
    <div class="hero-background-image">
      <img src="/model-face.png" alt="Model" />
    </div>
    
    <div class="feather-decoration">
      <img src="/collagen-product.png" alt="Decorative Feather" />
    </div>

    <div class="container h-100">
      <div class="row align-items-center h-100 position-relative">
        <div class="col-lg-7 hero-content offset-lg-1">
          <h1 class="hero-title">
            COLLAGEN IS<br>
            THE FOUNTAIN<br>
            OF YOUTH
          </h1>
          <p class="hero-subtitle">WHAT'S YOUR INFLUENCE?</p>
          <button 
            class="btn btn-connect" 
            data-bs-toggle="modal" 
            data-bs-target="#contactModal"
          >
            <img src="/ben-avatar.png" alt="Ben" class="btn-avatar" />
            Connect with Ben
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.hero-section {
  position: relative;
  min-height: calc(100vh - 76px); /* responsive fallback */
  background-color: #ffffff;
  overflow: hidden;
  display: flex;
  align-items: center;
  margin-top: 30px;
}

@media (min-width: 992px) {
  .hero-section {
    min-height: 725px; /* Total 897px - ~72px Header */
  }
}

.hero-background-image {
  position: absolute;
  top: 0;
  right: 0;
  width: 50%;
  height: 100%;
  z-index: 1;
}

.hero-background-image img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  object-position: center right;
}

.feather-decoration {
  position: absolute;
  width: 55%;
  z-index: 1;
  pointer-events: none;
}

.feather-decoration img {
  width: 100%;
  height: auto;
  object-fit: contain;
}

.container {
  position: relative;
  z-index: 2;
}

.hero-content {
  padding: 2rem 0;
}

.hero-title {
  font-family: 'Gotham', sans-serif;
  font-size: 65px;
  font-weight: 350; /* Gotham Book */
  color: #416887;
  line-height: 1;
  text-transform: uppercase;
}

.hero-subtitle {
  font-family: 'Gotham', sans-serif;
  font-size: 30px;
  color: #99A1A5;
  margin-bottom: 2.5rem;
  text-transform: uppercase;
  font-weight: 500;
}

.btn-connect {
  background-color: var(--text-primary);
  color: white;
  border: none;
  padding: 0.75rem 1.75rem;
  border-radius: 6px;
  font-weight: 400;
  font-size: 0.95rem;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.75rem;
  width: 359px;
  height: 64px;
}

.btn-connect:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
  box-shadow: 0 6px 12px rgba(61, 90, 128, 0.2);
}

.btn-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid rgba(255,255,255,0.2);
}

@media (max-width: 991px) {
  .hero-background-image {
    width: 50%;
    opacity: 1; /* Keep fully visible on tablet/mobile as per design */
  }
  
  .hero-title {
    font-size: 2.75rem;
  }
}

@media (max-width: 768px) {
  .hero-section {
    min-height: auto;
    padding: 2rem 0;
  }
  
  /* Mobile: Image takes half view, low opacity */
  .hero-background-image {
    width: 50%;
    height: 100%;
    opacity: 0.3; /* Low opacity requested */
    background-position: center right;
  }
  
  /* Hide feather to show only one image */
  .feather-decoration {
    display: none;
  }

  .hero-content {
    text-align: left;
    max-width: 100%;
    padding-left: 1rem; /* Consistent spacing */
    position: relative;
    z-index: 3;
  }
  
  /* Restrict text width to force wrapping on left side */
  .hero-title {
    font-size: 1.8rem;
    line-height: 1.2;
    margin-bottom: 0.5rem;
    max-width: 60%; 
  }
  
  .hero-subtitle {
    font-size: 0.75rem;
    margin-bottom: 1.5rem; /* More space before button */
    letter-spacing: 0.1em;
    max-width: 60%;
    font-weight: 300;
  }
  
  /* Button is wider than text, overlapping image area subtly */
  .btn-connect {
    width: 85%;
    max-width: none;
    justify-content: center;
    padding: 0.75rem 1rem;
    font-size: 0.9rem;
  }
}
</style>
