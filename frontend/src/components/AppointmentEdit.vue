<script setup>

const emit = defineEmits(['close-edit'])

</script>

<template>

  <div class="edit-container">

    <h2>Verwaltung von Termine (Admin)</h2>

    <h3>Studiengang: XY</h3>

    <div class="edit-card">

      <h2>Termin 1</h2>

      <div class="row">
        <span>Raum: A101</span>
        <button>Bearbeiten</button>
      </div>

      <div class="row">
        <span>9:45 - 13:00</span>
        <button>Bearbeiten</button>
      </div>

      <div class="row">
        <span>Dozent: Hr./Fr Mustermann</span>
        <button>Bearbeiten</button>
      </div>

      <div class="row">
        <span>Status: Entfall/Geplant</span>
        <button>Bearbeiten</button>
      </div>

      <div class="row">
        <span>Event: von - bis</span>
        <button>Bearbeiten</button>
      </div>

      <div class="warning-text">
        Diesen Termin absagen?
        Andere Termine bleiben unverändert
      </div>

      <div class="button-row">

        <button @click="emit('close-edit')">
          Abbrechen
        </button>

        <button class="cancel-button">
          Termin absagen
        </button>

      </div>

    </div>

  </div>

</template>

<style scoped>

.edit-container{
  padding:20px;
}

.edit-card{
  max-width:700px;
  padding:30px;
  border:1px solid gray;
  border-radius:40px;
}

.row{
  display:flex;
  align-items:center;
  gap:15px;
  margin-bottom:15px;
}

.warning-text{
  margin-top:40px;
  margin-bottom:30px;
}

.button-row{
  display:flex;
  gap:20px;
}

.cancel-button{
  background-color:#f0d0d0;
}

</style>