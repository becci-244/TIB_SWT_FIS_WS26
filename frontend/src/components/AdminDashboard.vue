<script setup>

import { ref, onMounted } from 'vue'

const emit = defineEmits([
  'open-edit',
  'open-create',
  'logout'
])

const appointments = ref([])

function openEdit() {
  emit('open-edit')
}

function openCreate() {
  emit('open-create')
}

function logout() {
  emit('logout')
}

async function loadAppointments() {

  try {

    const response = await fetch(
      'http://localhost:3000/api/v1/appointments'
    )

    appointments.value =
      await response.json()

  } catch (error) {

    console.error(
      "Fehler beim Laden der Termine:",
      error
    )

  }

}

onMounted(() => {
  loadAppointments()
})

</script>

<template>

  <!-- Header -->

  <div class="header">

    <div>

      <h2>Verwaltungsmanager</h2>

      <h1>Studiengang: Technische Informatik (TIB)</h1>

    </div>

    <div class="header-right">

      <div class="datetime">
        15:37 &nbsp;&nbsp;&nbsp; 12.11.2026
      </div>

      <button
        class="logout-btn"
        @click="logout"
      >
        Logout
      </button>

    </div>

  </div>

  <!-- Termin erstellen -->

  <button
    class="create-btn"
    @click="openCreate"
  >
    Termin erstellen
  </button>

  <!-- Terminübersicht -->

  <div class="card-container">

    <div
      class="card"
      v-for="appointment in appointments"
      :key="appointment.id"
      @dblclick="openEdit"
    >

      <h3>{{ appointment.title }}</h3>

      <p>
        Raum:
        {{ appointment.room }}
      </p>

      <p>
        {{ appointment.start }}
        -
        {{ appointment.end }}
        Uhr
      </p>

      <p>
        Dozent:
        {{ appointment.lecturer }}
      </p>

      <p>

        Status:

        <span class="status-planned">
          {{ appointment.status }}
        </span>

      </p>

      <p>
        Event:
        {{ appointment.date }}
      </p>

    </div>

  </div>

</template>

<style scoped>

*{
  font-family: Arial;
}

.header{
  display:flex;
  justify-content:space-between;
  align-items:flex-start;
  margin-bottom:40px;
}

.header h1{
  text-decoration:underline;
  font-size:26px;
  margin:0;
}

.header h2{
  text-decoration:underline;
  font-size:22px;
  margin:0 0 10px 0;
}

.header-right{
  display:flex;
  align-items:center;
  gap:30px;
}

.datetime{
  font-size:18px;
  font-weight:bold;
}

.logout-btn{
  padding:8px 18px;
  border:1px solid black;
  background:#ddd;
  font-weight:bold;
}

.create-btn{
  margin-bottom:30px;
  padding:10px 20px;
  border:1px solid black;
  background:#eee;
  font-weight:bold;
  cursor:pointer;
}

.card-container{
  display:grid;
  grid-template-columns:repeat(3,1fr);
  gap:25px;
}

.card{
  border:2px solid black;
  border-radius:12px;
  padding:30px;
  min-height:220px;
  background:white;
  cursor:pointer;
}

.card h3{
  margin-top:0;
  font-size:20px;
}

.card p{
  font-size:16px;
  margin:8px 0;
}

.card:hover{
  background:#f8f8f8;
}

.status-planned{
  color:green;
  font-weight:bold;
}

</style>