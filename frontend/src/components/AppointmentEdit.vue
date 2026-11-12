<script setup>
import { ref } from 'vue'

// ============================================
// Komponenten einbinden
// ============================================

import AdminDashboard from '/src/components/AdminDashboard.vue'
import AppointmentEdit from '/src/components/AppointmentEdit.vue'
import AppointmentCreate from '/src/components/AppointmentCreate.vue'

// ============================================
// Events
// ============================================

const emit = defineEmits(['logout'])

// ============================================
// Aktuelle Ansicht verwalten
// ============================================

const currentView = ref('dashboard')

// ============================================
// Logout
// ============================================

function logout() {
  emit('logout')
}

// ============================================
// Dashboard -> Edit
// ============================================

function openAppointmentEdit() {
  currentView.value = 'edit'
}

// ============================================
// Dashboard -> Create
// ============================================

function openAppointmentCreate() {
  currentView.value = 'create'
}

// ============================================
// Zurück zum Dashboard
// ============================================

function backToDashboard() {
  currentView.value = 'dashboard'
}
</script>

<template>

  <div class="admin-container">

    <!-- Dashboard -->

    <AdminDashboard
      v-if="currentView === 'dashboard'"
      @open-edit="openAppointmentEdit"
      @open-create="openAppointmentCreate"
      @logout="logout"
    />

    <!-- EditView -->

    <AppointmentEdit
      v-if="currentView === 'edit'"
      @close-edit="backToDashboard"
    />

    <!-- CreateView -->

    <AppointmentCreate
      v-if="currentView === 'create'"
      @close-create="backToDashboard"
    />

  </div>

</template>

<style scoped>

.admin-container{
  padding:20px;
}

</style>