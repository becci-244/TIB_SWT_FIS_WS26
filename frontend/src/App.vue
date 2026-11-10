<script setup>

// ============================================
// JavaScript Block: Einbinden von Viewseiten
// ============================================

import LoginView from './view/LoginView.vue'
import AdminView from './view/AdminView.vue'

</script>

<template>

  <!-- Testbereich -->
  <h1>You did it! Das ist nun deine Anzeigeseite :3</h1>

  <p>
    Visit
    <a href="https://vuejs.org/" target="_blank" rel="noopener">
      vuejs.org
    </a>
    to read the documentation
  </p>

  <!-- ============================================ -->
  <!-- Hier werden später andere Views eingebunden -->
  <!-- ============================================ -->

  <LoginView />
  <AdminView />


</template>

<style scoped>
</style>