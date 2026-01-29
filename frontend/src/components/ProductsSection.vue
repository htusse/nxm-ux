<template>
  <section class="products-section">
    <div class="container">
      <!-- Product 1 -->
      <div class="row align-items-center product-row mb-5 flex-column-reverse flex-lg-row">
        <div class="col-lg-6">
          <div class="product-content">
            <h3 class="product-title">COLLAGEN PEPTIDE<br>EXFOLIATING GEL</h3>
            <div class="product-features">
              <p class="feature-item">Instant results with visible remove of dead cells.</p>
              <p class="feature-item">Clinically proven to activate the skin repair process.</p>
              <p class="feature-item">Smooths wrinkles, improves tone & elasticity.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="product-image-wrapper">
            <img src="/product-gel.png" alt="Collagen Peptide Exfoliating Gel" class="product-image img-fluid" />
          </div>
        </div>
      </div>

      <!-- Product 2 -->
      <div class="row align-items-center product-row mb-5 flex-column-reverse flex-lg-row-reverse">
        <div class="col-lg-6">
          <div class="product-content">
            <h3 class="product-title">BELLA COLLAGEN<br>ELIXIR</h3>
            <p class="product-subtitle">Beauty from the Inside Out</p>
            <div class="product-features">
              <p class="feature-item">Helps the body product more collagen.</p>
              <p class="feature-item">Backed by double blind clinical studies.</p>
              <p class="feature-item">Healthier skin, hair, nails, joints & more.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="product-image-wrapper">
            <img src="/product-elixir.png" alt="Bella Collagen Elixir" class="product-image img-fluid" />
          </div>
        </div>
      </div>

      <!-- Product 3 -->
      <div class="row align-items-center product-row flex-column-reverse flex-lg-row">
        <div class="col-lg-6">
          <div class="product-content">
            <h3 class="product-title">HYDRATING LIP<br>PLUMPING OIL</h3>
            <div class="product-features">
              <p class="feature-item">Ultimate softness, hydration, & comfort.</p>
              <p class="feature-item">A smooth and naturally-plump look.</p>
              <p class="feature-item">Shine of a gloss with the benefits of a balm.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="product-image-wrapper">
            <img src="/product-lip.png" alt="Hydrating Lip Plumping Oil" class="product-image img-fluid" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.products-section {
  background-color: #ffffff;
  padding: 5rem 0;
}

.product-row {
  padding: 3rem 0;
}

.product-content {
  padding: 2rem;
}

.product-title {
  font-size: 40px;
  color: var(--text-primary);
  margin-bottom: 1.5rem;
  line-height: 1;
}

.product-subtitle {
  font-size: 23px;
  color: #788995;
  margin-bottom: 1.5rem;
  font-weight: 300
}

.product-features {
  border-left: 3px solid var(--secondary-color);
  padding-left: 1.5rem;
  font-size: 23px;
  color: #99A1A5;
  font-weight: 300;
}

.feature-item {
  font-size: 0.95rem;
  color: var(--text-secondary);
  line-height: 1.8;
  margin-bottom: 0.75rem;
}

.product-image-wrapper {
  padding: 2rem;
}

.product-image {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
}

@media (max-width: 991px) {
  .product-row {
    padding: 2rem 0;
  }
  
  .product-content {
    padding: 1rem;
    margin-bottom: 2rem;
  }
  
  .product-title {
    font-size: 30px;
  }
}

@media (max-width: 767px) {
  .products-section {
    padding: 3rem 0;
  }
  
  .product-row {
    padding: 1.5rem 0;
  }
  
  .product-content {
    padding: 1rem 0.5rem;
    margin-bottom: 1.5rem;
    text-align: left;
  }
  
  .product-title {
    font-size: 30px;
    margin-bottom: 1rem;
  }
  
  .product-subtitle {
    font-size: 1rem;
    margin-bottom: 1rem;
    font-weight: 300;
  }
  
  .feature-item {
    font-size: 0.875rem;
    margin-bottom: 0.5rem;
  }
  
  .product-image-wrapper {
    padding: 1rem;
  }
}

@media (max-width: 480px) {
  .product-title {
    font-size: 30px;
  }
}
</style>
