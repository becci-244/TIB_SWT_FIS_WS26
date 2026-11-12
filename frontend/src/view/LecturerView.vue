<template>

  <!-- Header -->
  <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 40px; width: 100%;">

    <div>
      <h2 style="text-decoration: underline; margin: 0 0 10px 0; font-size: 22px;">
        Verwaltungsmanager
      </h2>

      <h1 style="text-decoration: underline; margin: 0; font-size: 26px;">
        Studiengang: Technische Informatik (TIB)
      </h1>
    </div>

    <div style="display: flex; align-items: center; gap: 30px;">

      <div style="font-weight: bold; font-size: 18px; text-align: right;">
        {{ aktuelleUhrzeit }} &nbsp;&nbsp;&nbsp; {{ aktuellesDatum }}
      </div>

      <button
        @click="logout"
        style="
          padding: 8px 18px;
          border: 1px solid black;
          background: #ddd;
          font-weight: bold;
          cursor: pointer;
        "
      >
        Logout
      </button>

    </div>

  </div>

  <!-- Übersicht -->

  <div
    style="
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 25px;
      width: 100%;
    "
  >

    <div

      v-for="termin in termine"
      :key="termin.id"

      style="
        border: 2px solid black;
        border-radius: 12px;
        padding: 25px;
        background: white;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      "
    >

      <div>

        <h3 style="margin-top: 0; font-size: 20px;">
          {{ termin.title }}
        </h3>

        <p style="margin: 8px 0; font-size: 16px;">
          Raum: {{ termin.room.number }}
        </p>

        <p style="margin: 8px 0; font-size: 16px;">
          {{ termin.start }} - {{ termin.end }} Uhr
        </p>

        <p style="margin: 8px 0; font-size: 16px;">
          Dozent: {{ termin.lecturers[0].name }}
        </p>

        <p style="margin: 8px 0; font-size: 16px;">
          Status:

          <span
            :style="{
              color: termin.status === 'CANCELLED' ? 'red' : 'green',
              fontWeight: 'bold'
            }"
          >
            {{ termin.status === 'SCHEDULED' ? 'Geplant' : 'Entfall' }}
          </span>

        </p>

        <p style="margin: 8px 0; font-size: 15px;">
          Event: {{ termin.date }}
        </p>

        <p
          v-if="termin.imAbszessModus"
          style="
            margin: 15px 0 10px 0;
            font-size: 14px;
            color: #b00;
            font-weight: bold;
          "
        >
          Diesen Termin Absagen?
          Andere Termine bleiben unverändert
        </p>

      </div>

      <div
        style="
          display: flex;
          gap: 10px;
          margin-top: 15px;
        "
      >

        <button

          v-if="termin.imAbszessModus"

          @click="termin.imAbszessModus = false"

          style="
            flex: 1;
            padding: 8px;
            border: 1px solid black;
            background: #eee;
            cursor: pointer;
            font-weight: bold;
          "
        >
          Abbrechen
        </button>

        <button

          @click="terminabsageBestätigen(termin)"

          style="
            flex: 1;
            padding: 8px;
            border: 1px solid black;
            background: #ffdddd;
            cursor: pointer;
            font-weight: bold;
            color: darkred;
          "
        >
          Termin absagen
        </button>

      </div>

    </div>

  </div>

</template>

<script>
export default {

  emits: ['logout'],

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
          status: 'SCHEDULED',
          imAbszessModus: false,

          room: {
            number: 'F01.204'
          },

          lecturers: [
            {
              name: 'Hr./Fr. Mustermann'
            }
          ]
        },

        {
          id: 102,
          title: 'Termin 2',
          date: '2026-11-11',
          start: '14:00',
          end: '17:00',
          status: 'SCHEDULED',
          imAbszessModus: false,

          room: {
            number: 'F02.204'
          },

          lecturers: [
            {
              name: 'Hr./Fr. Mustermann'
            }
          ]
        }

      ]

    }
  },

  mounted() {

    this.updateZeit()

    this.timer = setInterval(
      this.updateZeit,
      1000
    )

  },

  beforeUnmount() {
    clearInterval(this.timer)
  },

  methods: {

    logout() {
      this.$emit('logout')
    },

    updateZeit() {

      const jetzt = new Date()

      this.aktuelleUhrzeit =
        jetzt.toLocaleTimeString('de-DE', {
          hour: '2-digit',
          minute: '2-digit'
        })

      this.aktuellesDatum =
        jetzt.toLocaleDateString('de-DE')

    },

    terminabsageBestätigen(termin) {

      if (!termin.imAbszessModus) {

        termin.imAbszessModus = true

      } else {

        termin.status = 'CANCELLED'
        termin.imAbszessModus = false

      }

    }

  }

}
</script>