<template>
  <div style="padding: 40px; font-family: Arial; width: 100%; box-sizing: border-box;">
    <!-- Header -->
    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 40px; width: 100%;">
      <div>
        <h2 style="text-decoration: underline; margin: 0 0 10px 0; font-size: 22px;">Verwaltungsmanager</h2>
        <h1 style="text-decoration: underline; margin: 0; font-size: 26px;">Studiengang: Technische Informatik (TIB)</h1>
      </div>
      <div style="display: flex; align-items: center; gap: 30px;">
        <div style="font-weight: bold; font-size: 18px; text-align: right;">
          {{ aktuelleUhrzeit }} &nbsp;&nbsp;&nbsp; {{ aktuellesDatum }}
        </div>
        <button style="padding: 8px 18px; border: 1px solid black; background: #ddd; font-weight: bold; cursor: default;">
          Logout
        </button>
      </div>
    </div>

    <!-- Raster für Dozenten-Verwaltung -->
    <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 25px; width: 100%;">
      <div 
        v-for="termin in termine" 
        :key="termin.id" 
        style="border: 2px solid black; border-radius: 12px; padding: 25px; background: white; display: flex; flex-direction: column; justify-content: space-between;"
      >
        <div>
          <h3 style="margin-top: 0; font-size: 20px;">{{ termin.title }}</h3>
          <p style="margin: 8px 0; font-size: 16px;">Raum: {{ termin.room.number }}</p>
          <p style="margin: 8px 0; font-size: 16px;">{{ termin.start }} - {{ termin.end }} Uhr</p>
          <p style="margin: 8px 0; font-size: 16px;">Dozent: {{ termin.lecturers[0].name }}</p>
          <p style="margin: 8px 0; font-size: 16px;">
            Status: 
            <span :style="{ color: termin.status === 'CANCELLED' ? 'red' : 'green', fontWeight: 'bold' }">
              {{ termin.status === 'SCHEDULED' ? 'Geplant' : 'Entfall' }}
            </span>
          </p>
          <p style="margin: 8px 0; font-size: 15px;">Event: {{ termin.date }}</p>
          
          <p v-if="termin.imAbszessModus" style="margin: 15px 0 10px 0; font-size: 14px; color: #b00; font-weight: bold;">
            Diesen Termin Absagen? Andere Termine bleiben unverändert
          </p>
        </div>

        <!-- Aktions-Buttons -->
        <div style="display: flex; gap: 10px; margin-top: 15px;">
          <button v-if="termin.imAbszessModus" @click="termin.imAbszessModus = false" style="flex: 1; padding: 8px; border: 1px solid black; background: #eee; cursor: pointer; font-weight: bold;">
            Abbrechen
          </button>
          <button @click="terminabsageBestätigen(termin)" style="flex: 1; padding: 8px; border: 1px solid black; background: #ffdddd; cursor: pointer; font-weight: bold; color: darkred;">
            Termin absagen
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      aktuelleUhrzeit: '',
      aktuellesDatum: '',
      timer: null,
      termine: [
        { 
          id: 101, 
          title: 'Termin 1', 
          date: '2026-11-11', 
          start: '09:45', 
          end: '13:00', 
          type: 'LECTURE', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 7, number: 'F01.204', floor: 1, description: 'Hörsaal' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        },
        { 
          id: 102, 
          title: 'Termin 2', 
          date: '2026-11-11', 
          start: '14:00', 
          end: '17:00', 
          type: 'LAB', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 8, number: 'F02.204', floor: 2, description: 'Labor' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        },
        { 
          id: 103, 
          title: 'Termin 3', 
          date: '2026-11-11', 
          start: '08:00', 
          end: '11:15', 
          type: 'LECTURE', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 9, number: 'F01.022', floor: 1, description: 'Seminarraum' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        },
        { 
          id: 104, 
          title: 'Termin 4', 
          date: '2026-11-11', 
          start: '09:45', 
          end: '13:00', 
          type: 'LECTURE', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 10, number: 'F03.105', floor: 3, description: 'Hörsaal' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        },
        { 
          id: 105, 
          title: 'Termin 5', 
          date: '2026-11-11', 
          start: '14:00', 
          end: '17:00', 
          type: 'OTHER', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 11, number: 'F01.112', floor: 1, description: 'Raum' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        },
        { 
          id: 106, 
          title: 'Termin 6', 
          date: '2026-11-11', 
          start: '08:00', 
          end: '11:15', 
          type: 'LECTURE', 
          status: 'SCHEDULED', 
          imAbszessModus: false,
          room: { id: 12, number: 'F04.201', floor: 2, description: 'Raum' }, 
          lecturers: [{ id: 3, name: 'Hr./Fr. Mustermann', email: 'mustermann@hs-esslingen.de' }] 
        }
      ]
    }
  },
  mounted() {
    this.updateZeit();
    this.timer = setInterval(this.updateZeit, 1000);
  },
  beforeUnmount() {
    clearInterval(this.timer);
  },
  methods: {
    updateZeit() {
      const jetzt = new Date();
      this.aktuelleUhrzeit = jetzt.toLocaleTimeString('de-DE', { hour: '2-digit', minute: '2-digit' });
      this.aktuellesDatum = jetzt.toLocaleDateString('de-DE');
    },
    terminabsageBestätigen(termin) {
      if (!termin.imAbszessModus) {
        termin.imAbszessModus = true;
      } else {
        termin.status = 'CANCELLED';
        termin.imAbszessModus = false;
      }
    }
  }
}
</script>