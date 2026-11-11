<script setup>

const emit = defineEmits([
  'open-edit',
  'open-create'
])

function openEdit() {
  console.log("Termin geöffnet")
  emit('open-edit')
}

function openCreate() {
  console.log("Termin erstellen")
  emit('open-create')
}

</script>

<template>

  <h2>Verwaltung von Terminen (Admin)</h2>

  <h3>Studiengang: XY</h3>

  <button @click="openCreate">
    Termin erstellen
  </button>

  <div class="card-container">

    <div
      class="card"
      @dblclick="openEdit"
    >
      <h3>Termin 1</h3>
      <p>Raum</p>
      <p>9:45 - 13:00</p>
      <p>Dozent: Hr./Fr Mustermann</p>
      <p>Status: Entfall/Geplant</p>
      <p>Event: von - bis</p>
    </div>

    <div
      class="card"
      @dblclick="openEdit"
    >
      <h3>Termin 2</h3>
      <p>Raum</p>
      <p>9:45 - 13:00</p>
      <p>Dozent: Hr./Fr Mustermann</p>
      <p>Status: Entfall/Geplant</p>
      <p>Event: von - bis</p>
    </div>

    <div
      class="card"
      @dblclick="openEdit"
    >
      <h3>Termin 3</h3>
      <p>Raum</p>
      <p>9:45 - 13:00</p>
      <p>Dozent: Hr./Fr Mustermann</p>
      <p>Status: Entfall/Geplant</p>
      <p>Event: von - bis</p>
    </div>

  </div>

</template>

<style scoped>

.card-container{
  display:flex;
  gap:20px;
  flex-wrap:wrap;
}

.card{
  width:220px;
  padding:20px;
  border:1px solid black;
  border-radius:20px;
  cursor:pointer;
}

.card:hover{
  background-color:#f5f5f5;
}

</style>