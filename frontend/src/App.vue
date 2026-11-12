<script setup>

import { ref } from 'vue'

// ============================================
// JavaScript Block: Einbinden von Viewseiten
// ============================================

import LoginView from './view/LoginView.vue'
import AdminView from './view/AdminView.vue'
import LecturerView from './view/LecturerView.vue'
import UserView from './view/UserView.vue'

// ============================================
// Aktuelle Ansicht
// ============================================

const currentView = ref('login')

// ============================================
// Wechsel zwischen den Ansichten
// ============================================

function changeView(role) {
  console.log("Rolle empfangen:", role)

  currentView.value = role
}

function logout() {
  currentView.value = 'login'
}

</script>

<template>

  <!-- Login -->

  <LoginView
    v-if="currentView === 'login'"
    @login="changeView"
  />

  <!-- User -->

  <UserView
    v-if="currentView === 'user'"
    @logout="logout"
  />

  <!-- Dozent -->

  <LecturerView
    v-if="currentView === 'lecturer'"
    @logout="logout"
  />

  <!-- Admin -->

  <AdminView
  v-if="currentView === 'admin'"
  @logout="logout"
  />

</template>

<style scoped>
</style>