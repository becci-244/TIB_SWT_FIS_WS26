<script setup>

const emit = defineEmits([
  'close-edit',
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

  <!-- Bearbeitungsfenster -->

  <div class="edit-card">

    <h2>Termin 1</h2>

    <div class="row">
      <span>Raum: A101</span>

      <button class="action-button">
        Bearbeiten
      </button>
    </div>

    <div class="row">
      <span>09:45 - 13:00 Uhr</span>

      <button class="action-button">
        Bearbeiten
      </button>
    </div>

    <div class="row">
      <span>Dozent: Hr./Fr. Mustermann</span>

      <button class="action-button">
        Bearbeiten
      </button>
    </div>

    <div class="row">

      <span>
        Status:
        <span class="status-planned">
          Geplant
        </span>
      </span>

      <button class="action-button">
        Bearbeiten
      </button>

    </div>

    <div class="row">

      <span>Event: 2026-11-11</span>

      <button class="action-button">
        Bearbeiten
      </button>

    </div>

    <div class="warning-text">
      Diesen Termin absagen?
      Andere Termine bleiben unverändert
    </div>

    <div class="button-row">

      <button
        class="cancel-btn"
        @click="emit('close-edit')"
      >
        Abbrechen
      </button>

      <button class="delete-btn">
        Termin absagen
      </button>

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
  cursor:pointer;
}

.edit-card{

  width:100%;

  border:2px solid black;
  border-radius:12px;

  padding:30px;

  background:white;

  box-sizing:border-box;
}

.edit-card h2{
  margin-top:0;
}

.row{

  display:flex;
  justify-content:space-between;
  align-items:center;

  margin-bottom:15px;
}

.action-button{
  padding:8px 18px;
  border:1px solid black;
  background:#eee;
  cursor:pointer;
}

.warning-text{

  margin-top:40px;
  margin-bottom:20px;

  color:darkred;
  font-weight:bold;
}

.button-row{
  display:flex;
  gap:15px;
}

.cancel-btn{

  flex:1;

  padding:10px;

  border:1px solid black;

  background:#eee;

  font-weight:bold;

  cursor:pointer;
}

.delete-btn{

  flex:1;

  padding:10px;

  border:1px solid black;

  background:#ffdddd;

  color:darkred;

  font-weight:bold;

  cursor:pointer;
}

.status-planned{
  color:green;
  font-weight:bold;
}

</style>