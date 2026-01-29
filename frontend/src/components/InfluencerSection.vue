<template>
  <section class="influencer-section" id="influencer">
    <div class="container">
      <div class="row">
        <div class="col-lg-10 mx-auto text-center">
          <h2 class="section-title">WHAT'S YOUR INFLUENCE?</h2>
          <p class="section-subtitle">
            Is this you? Could this be you?<br>
            Are you ready to be an influencer?
          </p>

          <div class="row mt-5 influencer-cards">
            <div class="col-md-4 mb-4">
              <div class="influencer-card">
                <div class="card-image-wrapper">
                  <img src="/influencer-1.png" alt="Grace Perez" class="influencer-image" />
                </div>
                <div class="influencer-info">
                  <div class="influencer-avatar">
                    <img src="/avatar-1.png" alt="Grace Perez Avatar" />
                  </div>
                  <div class="influencer-details">
                    <h4 class="influencer-name">Grace Perez</h4>
                    <p class="influencer-handle">@graceperez</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4 mb-4">
              <div class="influencer-card">
                <div class="card-image-wrapper">
                  <img src="/influencer-2.png" alt="Bella Marie" class="influencer-image" />
                </div>
                <div class="influencer-info">
                  <div class="influencer-avatar">
                    <img src="/avatar-2.png" alt="Bella Marie Avatar" />
                  </div>
                  <div class="influencer-details">
                    <h4 class="influencer-name">Bella Marie</h4>
                    <p class="influencer-handle">@bellamarie</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4 mb-4">
              <div class="influencer-card">
                <div class="card-image-wrapper">
                  <img src="/influencer-3.png" alt="Gigi Hadid" class="influencer-image" />
                </div>
                <div class="influencer-info">
                  <div class="influencer-avatar">
                    <img src="/avatar-3.png" alt="Gigi Hadid Avatar" />
                  </div>
                  <div class="influencer-details">
                    <h4 class="influencer-name">Gigi Hadid</h4>
                    <p class="influencer-handle">@gigihadid</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="cta-section mt-5">
            <h3 class="cta-title">WOULD YOU LIKE TO<br>LEARN MORE?</h3>
            <button 
              class="btn btn-connect-large" 
              data-bs-toggle="modal" 
              data-bs-target="#contactModal"
            >
              <img src="/ben-avatar.png" alt="Ben" class="btn-avatar" />
              Connect with Ben
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.influencer-section {
  background-color: #f8f9fa;
  padding: 5rem 0;
}

.section-title {
  font-size: 40px;
  color: #416887;
  margin-bottom: 1rem;
}

.section-subtitle {
  font-size: 23px;
  color: #99A1A5;
  line-height: 1;
  margin-bottom: 2rem;
  font-weight: 200
}

.influencer-card {
  background: white;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.influencer-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
}

.card-image-wrapper {
  position: relative;
  padding-top: 100%;
  overflow: hidden;
}

.influencer-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.influencer-info {
  display: flex;
  align-items: center;
  padding: 1.25rem;
  gap: 1rem;
}

.influencer-avatar {
  flex-shrink: 0;
}

.influencer-avatar img {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #f0f0f0;
}

.influencer-details {
  text-align: left;
}

.influencer-name {
  font-size: 21px;
  font-weight: 600;
  color: #416887;
  margin-bottom: 0.25rem;
}

.influencer-handle {
  font-size: 15px;
  color: #99A1A5;
  margin: 0;
}

.cta-section {
  padding: 3rem 0 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 30px;
}

.cta-title {
  font-size: 45px;
  color: #416887;
  margin-bottom: 0;
  line-height: 1;
  text-align: left;
}

.btn-connect-large {
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

.btn-connect-large:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(61, 90, 128, 0.3);
}

.btn-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  border: 2px solid white;
  object-fit: cover;
}

@media (max-width: 767px) {
  .influencer-section {
    padding: 3rem 0;
  }
  
  .section-title {
    font-size: 1.5rem;
    margin-bottom: 0.75rem;
  }
  
  .section-subtitle {
    font-size: 0.9rem;
  }
  
  .cta-title {
    font-size: 1.25rem;
    margin-bottom: 1.5rem;
    text-align: center;
  }
  
  .section-subtitle br,
  .cta-title br {
    display: none;
  }
  
  .influencer-cards {
    margin-top: 2rem !important;
  }
  
  .influencer-card {
    margin-bottom: 1.5rem;
  }
  
  .btn-connect-large {
    width: 100%;
    max-width: 300px;
    padding: 0.875rem 2rem;
    font-size: 1rem;
  }
  
  .cta-section {
    padding: 2rem 0 1rem;
    flex-direction: column;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 1.25rem;
  }
  
  .cta-title {
    font-size: 1.1rem;
  }
  
  .section-subtitle {
    font-size: 0.85rem;
  }
}
</style>
