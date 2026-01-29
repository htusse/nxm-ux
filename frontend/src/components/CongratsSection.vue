<template>
  <section class="congrats-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <h2 class="section-title">CONGRATULATIONS</h2>
          <p class="congrats-text">
            You are among the very first to learn of NXM,<br>
            a superior luxury & lifestyle brand developed by some of the<br>
            greatest minds in the industry.
          </p>
          <p class="congrats-description">
            Launching with a perfect trio of proprietary, results-driven<br>
            beauty products, NXM is primed to cause major disruption in<br>
            the direct-selling industry with its hybrid, influencer marketing<br>
            platform and rewards system.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.congrats-section {
  background-color: #f8f9fa;
  padding: 5rem 0;
}

.section-title {
  font-size: 40px;
  color: #416887;
  margin-bottom: 2rem;
}

.congrats-text {
  font-size: 23px;
  color: #788995;
  line-height: 1.1;
  margin-bottom: 1.5rem;
  font-weight: 300;
}

.congrats-description {
  font-size: 23px;
  color: #788995;
  line-height: 1.8;
  font-weight: 300;
}

@media (max-width: 767px) {
  .congrats-section {
    padding: 3rem 0;
  }
  
  .section-title {
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
  }
  
  .congrats-text,
  .congrats-description {
    font-size: 0.9rem;
    line-height: 1.7;
  }
  
  .congrats-text br,
  .congrats-description br {
    display: none;
  }
}

@media (max-width: 480px) {
  .congrats-section {
    padding: 2rem 0;
  }
  
  .section-title {
    font-size: 1.25rem;
  }
  
  .congrats-text,
  .congrats-description {
    font-size: 0.875rem;
  }
}
</style>
