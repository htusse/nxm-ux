<template>
  <!-- Contact Form Modal -->
  <div 
    class="modal fade" 
    id="contactModal" 
    tabindex="-1" 
    aria-labelledby="contactModalLabel" 
    aria-hidden="true"
  >
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
        <button 
          type="button" 
          class="btn-close-custom" 
          data-bs-dismiss="modal" 
          aria-label="Close"
        >×</button>
        
        <div class="modal-body">
          <div class="row g-0">
            <!-- Left Side - Image -->
            <div class="col-md-5 modal-image-side">
              <img src="/ben-modal.png" alt="Ben" class="modal-person-image" />
            </div>

            <!-- Right Side - Form -->
            <div class="col-md-7 modal-form-side">
              <h3 class="form-title">CONNECT WITH BEN</h3>
              <p class="form-subtitle">Fill out the form below and we'll get in touch with you.</p>

              <!-- Success Message -->
              <div v-if="successMessage" class="alert alert-success mb-3" role="alert">
                <i class="bi bi-check-circle me-2"></i>{{ successMessage }}
              </div>

              <!-- Error Message -->
              <div v-if="errorMessage" class="alert alert-danger mb-3" role="alert">
                <i class="bi bi-exclamation-triangle me-2"></i>{{ errorMessage }}
              </div>

              <form @submit.prevent="handleSubmit" novalidate>
                <!-- Full Name -->
                <div class="mb-3">
                  <input 
                    type="text" 
                    class="form-control form-input" 
                    :class="{ 'is-invalid': errors.fullName, 'is-valid': touched.fullName && !errors.fullName }"
                    id="fullName" 
                    v-model="values.fullName"
                    @blur="validateField('fullName')"
                    @input="touched.fullName = true"
                    placeholder="Full Name *"
                  />
                  <div class="invalid-feedback" v-if="errors.fullName">
                    {{ errors.fullName }}
                  </div>
                </div>

                <!-- Email -->
                <div class="mb-3">
                  <input 
                    type="email" 
                    class="form-control form-input"
                    :class="{ 'is-invalid': errors.email, 'is-valid': touched.email && !errors.email }"
                    id="email" 
                    v-model="values.email"
                    @blur="validateField('email')"
                    @input="touched.email = true"
                    placeholder="Email Address *"
                  />
                  <div class="invalid-feedback" v-if="errors.email">
                    {{ errors.email }}
                  </div>
                </div>

                <!-- Phone -->
                <div class="mb-3">
                  <input 
                    type="tel" 
                    class="form-control form-input"
                    :class="{ 'is-invalid': errors.phone, 'is-valid': touched.phone && !errors.phone }"
                    id="phone" 
                    v-model="values.phone"
                    @blur="validateField('phone')"
                    @input="touched.phone = true"
                    placeholder="Phone Number *"
                  />
                  <div class="invalid-feedback" v-if="errors.phone">
                    {{ errors.phone }}
                  </div>
                </div>

                <!-- Subject -->
                <div class="mb-3">
                  <input 
                    type="text" 
                    class="form-control form-input"
                    :class="{ 'is-invalid': errors.subject, 'is-valid': touched.subject && !errors.subject }"
                    id="subject" 
                    v-model="values.subject"
                    @blur="validateField('subject')"
                    @input="touched.subject = true"
                    placeholder="Subject *"
                  />
                  <div class="invalid-feedback" v-if="errors.subject">
                    {{ errors.subject }}
                  </div>
                </div>

                <!-- Message -->
                <div class="mb-3">
                  <textarea 
                    class="form-control form-input"
                    :class="{ 'is-invalid': errors.message, 'is-valid': touched.message && !errors.message }"
                    id="message" 
                    v-model="values.message"
                    @blur="validateField('message')"
                    @input="touched.message = true"
                    placeholder="Message *"
                    rows="4"
                  ></textarea>
                  <div class="invalid-feedback" v-if="errors.message">
                    {{ errors.message }}
                  </div>
                </div>

                <!-- Submit Button -->
                <div class="d-grid">
                  <button 
                    type="submit" 
                    class="btn btn-submit"
                    :disabled="isSubmitting"
                  >
                    <span v-if="isSubmitting">
                      <span class="spinner-border spinner-border-sm me-2" role="status"></span>
                      Sending...
                    </span>
                    <span v-else>Send Message</span>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, reactive } from 'vue'
import * as yup from 'yup'
import axios from 'axios'

export default {
  name: 'ContactFormModal',
  setup() {
    const values = reactive({
      fullName: '',
      email: '',
      phone: '',
      subject: '',
      message: ''
    })

    const errors = reactive({
      fullName: '',
      email: '',
      phone: '',
      subject: '',
      message: ''
    })

    const touched = reactive({
      fullName: false,
      email: false,
      phone: false,
      subject: false,
      message: false
    })

    const isSubmitting = ref(false)
    const successMessage = ref('')
    const errorMessage = ref('')

    // Validation schema matching Milestone 3 requirements
    const schema = yup.object({
      fullName: yup.string()
        .required('Full name is required')
        .min(2, 'Full name must be at least 2 characters')
        .test('has-space', 'Please enter your full name (first and last name)', value => {
          return value && value.trim().split(/\s+/).length >= 2
        }),
      email: yup.string()
        .required('Email is required')
        .email('Please enter a valid email address'),
      phone: yup.string()
        .required('Phone number is required')
        .test('valid-phone', 'Please enter a valid phone number', value => {
          if (!value) return false
          const digitsOnly = value.replace(/\D/g, '')
          return digitsOnly.length >= 10
        }),
      subject: yup.string()
        .required('Subject is required'),
      message: yup.string()
        .required('Message is required')
        .min(10, 'Message must be at least 10 characters')
    })

    // Validate individual field
    const validateField = async (fieldName) => {
      touched[fieldName] = true
      try {
        await schema.validateAt(fieldName, values)
        errors[fieldName] = ''
      } catch (error) {
        errors[fieldName] = error.message
      }
    }

    // Validate all fields
    const validateForm = async () => {
      // Mark all fields as touched
      Object.keys(touched).forEach(key => touched[key] = true)
      
      try {
        await schema.validate(values, { abortEarly: false })
        Object.keys(errors).forEach(key => errors[key] = '')
        return true
      } catch (err) {
        err.inner.forEach(error => {
          errors[error.path] = error.message
        })
        return false
      }
    }

    // Handle form submission
    const handleSubmit = async () => {
      successMessage.value = ''
      errorMessage.value = ''

      const isValid = await validateForm()
      
      if (!isValid) {
        errorMessage.value = 'Please fix the errors in the form'
        return
      }

      isSubmitting.value = true

      try {
        const apiUrl = import.meta.env.VITE_API_URL || 'http://localhost/nxm-ux-tsa/backend/api'
        
        const formData = {
          fullName: values.fullName,
          email: values.email,
          phone: values.phone,
          subject: values.subject,
          message: values.message
        }
        
        const response = await axios.post(`${apiUrl}/submit-form.php`, formData)

        if (response.data.success) {
          successMessage.value = response.data.message || 'Thank you! Your message has been sent successfully. We will contact you soon.'
          
          // Reset form
          Object.keys(values).forEach(key => values[key] = '')
          Object.keys(errors).forEach(key => errors[key] = '')
          Object.keys(touched).forEach(key => touched[key] = false)

          // Close modal after 3 seconds
          setTimeout(() => {
            const modalElement = document.getElementById('contactModal')
            const modal = window.bootstrap.Modal.getInstance(modalElement)
            if (modal) {
              modal.hide()
            }
            successMessage.value = ''
          }, 3000)
        } else {
          errorMessage.value = response.data.message || 'Submission failed. Please try again.'
        }
      } catch (error) {
        console.error('Submission error:', error)
        if (error.response) {
          errorMessage.value = error.response.data.message || 'Server error. Please try again later.'
        } else if (error.request) {
          errorMessage.value = 'Unable to connect to server. Please check your connection and try again.'
        } else {
          errorMessage.value = 'An error occurred. Please try again later.'
        }
      } finally {
        isSubmitting.value = false
      }
    }

    return {
      values,
      errors,
      touched,
      isSubmitting,
      successMessage,
      errorMessage,
      validateField,
      handleSubmit
    }
  }
}
</script>

<style scoped>
.modal-content {
  border: none;
  border-radius: 8px;
  overflow: hidden;
}

.btn-close-custom {
  position: absolute;
  top: 1rem;
  right: 1rem;
  z-index: 10;
  background: white;
  border: none;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  font-size: 1.5rem;
  line-height: 1;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.btn-close-custom:hover {
  background: #f0f0f0;
  transform: rotate(90deg);
}

.modal-body {
  padding: 0;
}

.modal-image-side {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  padding: 0;
  position: relative;
  overflow: hidden;
}

.modal-person-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.modal-form-side {
  padding: 2.5rem 2rem;
  background: white;
}

.form-title {
  font-size: 1.75rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.5rem;
  line-height: 1.3;
}

.form-subtitle {
  font-size: 0.9rem;
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
}

.form-input {
  border: none;
  border-bottom: 2px solid #e5e7eb;
  border-radius: 0;
  padding: 0.75rem 0.5rem;
  font-size: 0.95rem;
  transition: border-color 0.3s ease;
}

.form-input:focus {
  border-bottom-color: var(--primary-color);
  box-shadow: none;
  background: transparent;
}

.form-input::placeholder {
  color: #9ca3af;
}

.form-input.is-valid {
  border-bottom-color: var(--success-color);
}

.form-input.is-invalid {
  border-bottom-color: var(--danger-color);
}

textarea.form-input {
  border: 2px solid #e5e7eb;
  border-radius: 4px;
  padding: 0.75rem;
  resize: vertical;
  min-height: 100px;
}

textarea.form-input:focus {
  border-color: var(--primary-color);
}

textarea.form-input.is-valid {
  border-color: var(--success-color);
}

textarea.form-input.is-invalid {
  border-color: var(--danger-color);
}

.btn-submit {
  background-color: var(--primary-color);
  color: white;
  border: none;
  padding: 0.875rem 1.5rem;
  border-radius: 4px;
  font-weight: 600;
  font-size: 1rem;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.btn-submit:hover:not(:disabled) {
  background-color: var(--primary-light);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(61, 90, 128, 0.3);
}

.btn-submit:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.alert {
  font-size: 0.875rem;
  border-radius: 4px;
}

@media (max-width: 767px) {
  .modal-image-side {
    display: none;
  }
  
  .modal-form-side {
    padding: 2rem 1.5rem;
  }
  
  .form-title {
    font-size: 1.35rem;
  }
  
  .form-subtitle {
    font-size: 0.85rem;
  }
  
  .form-input {
    font-size: 16px; /* Prevents zoom on iOS */
  }
  
  .btn-submit {
    padding: 1rem 1.5rem;
    font-size: 0.95rem;
  }
  
  .btn-close-custom {
    top: 0.75rem;
    right: 0.75rem;
  }
}

@media (max-width: 480px) {
  .modal-form-side {
    padding: 1.5rem 1rem;
  }
  
  .form-title {
    font-size: 1.25rem;
  }
}
</style>
