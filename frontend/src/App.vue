<template>
  <div id="app">
    <NavigationHeader />
    <HeroSection />
    <CongratsSection />
    <ProductsSection />
    <InfluencerSection />
    <FooterSection />
    <ContactFormModal />
  </div>
</template>

<script>
import NavigationHeader from './components/NavigationHeader.vue'
import HeroSection from './components/HeroSection.vue'
import CongratsSection from './components/CongratsSection.vue'
import ProductsSection from './components/ProductsSection.vue'
import InfluencerSection from './components/InfluencerSection.vue'
import FooterSection from './components/FooterSection.vue'
import ContactFormModal from './components/ContactFormModal.vue'

export default {
  name: 'App',
  components: {
    NavigationHeader,
    HeroSection,
    CongratsSection,
    ProductsSection,
    InfluencerSection,
    FooterSection,
    ContactFormModal
  }
}
</script>
