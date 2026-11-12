<script setup>

const emit = defineEmits([
  'close-create',
  'logout'
])

function logout() {
  emit('logout')
}

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

  <!-- Titel -->

  <h2 class="section-title">
    Erstellung eines Termins (Admin)
  </h2>

  <!-- Formular -->

  <div class="create-card">

    <div class="input-row">
      <label>Terminname:</label>
      <input
        type="text"
        placeholder="Terminname eingeben"
      >
    </div>

    <div class="input-row">
      <label>Raum:</label>
      <input
        type="text"
        placeholder="Raum auswählen"
      >
    </div>

    <div class="input-row">
      <label>Uhrzeit:</label>
      <input
        type="text"
        placeholder="09:45 - 13:00"
      >
    </div>

    <div class="input-row">
      <label>Dozent:</label>
      <input
        type="text"
        placeholder="Dozent auswählen"
      >
    </div>

    <div class="input-row">
      <label>Event:</label>
      <input
        type="text"
        placeholder="2026-11-11"
      >
    </div>

  </div>

  <!-- Buttons -->

  <div class="button-row">

    <button
      class="cancel-btn"
      @click="emit('close-create')"
    >
      Abbrechen
    </button>

    <button class="create-btn">
      Termin erstellen
    </button>

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
  cursor:pointer;
}

.section-title{
  margin-bottom:25px;
}

.create-card{

  border:2px solid black;
  border-radius:12px;

  padding:30px;

  background:white;

  max-width:800px;
}

.input-row{

  display:flex;

  align-items:center;

  margin-bottom:20px;

  gap:20px;
}

.input-row label{

  width:120px;

  font-weight:bold;
}

.input-row input{

  flex:1;

  padding:10px;

  border:1px solid black;

  border-radius:4px;
}

.button-row{

  margin-top:25px;

  display:flex;

  gap:20px;
}

.cancel-btn{

  padding:10px 20px;

  border:1px solid black;

  background:#eee;

  font-weight:bold;

  cursor:pointer;
}

.create-btn{

  padding:10px 20px;

  border:1px solid black;

  background:#dff0d8;

  color:darkgreen;

  font-weight:bold;

  cursor:pointer;
}

</style>