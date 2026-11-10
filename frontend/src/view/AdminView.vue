<script setup>

// ============================================
// JavaScript Block: Komponenten einbinden
// ============================================

import AdminDashboard from '/src/components/AdminDashboard.vue'

</script>

<template>

  <div class="admin-container">

    <h1>Tageübersicht gefiltert nach Studiengänge (Admin)</h1>

    <!-- Dashboard anzeigen -->
    <AdminDashboard />

  </div>

</template>

<style scoped>

.admin-container{
  padding:20px;
}

</style>