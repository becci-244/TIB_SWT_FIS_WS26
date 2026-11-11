<script setup>

const emit = defineEmits(['close-create'])

</script>

<template>

  <div class="create-container">

    <h2>Erstellen von Terminen (Admin):</h2>

    <div class="header-row">

      <div>
        <h1>Erstellung eines Termins (Admin)</h1>
        <h2>Studiengang: XY</h2>
      </div>

      <div class="date-time">
        <span>Uhrzeit</span>
        <span>Datum</span>
      </div>

    </div>

    <div class="create-card">

      <h2>Termin name:</h2>

      <p>Raum:</p>

      <p>Uhrzeit:</p>

      <p>Dozent:</p>

      <p>Event: von - bis</p>

    </div>

    <div class="button-row">

      <button @click="emit('close-create')">
        Abbrechen
      </button>

      <button>
        Termin erstellen
      </button>

    </div>

  </div>

</template>

<style scoped>

.create-container{
  padding:20px;
}

.header-row{
  display:flex;
  justify-content:space-between;
  align-items:flex-start;
}

.date-time{
  display:flex;
  gap:40px;
  margin-top:25px;
}

.create-card{
  margin-top:40px;

  width:350px;
  height:300px;

  padding:20px;

  border:1px solid gray;
  border-radius:50px;
}

.button-row{
  margin-top:30px;
  display:flex;
  gap:20px;
}

</style>