<template>

  <!-- Header -->

  <div
    style="
      display:flex;
      justify-content:space-between;
      align-items:flex-start;
      margin-bottom:40px;
      width:100%;
    "
  >

    <div>

      <h1
        style="
          text-decoration:underline;
          margin:0;
          font-size:28px;
        "
      >
        Studiengang: Technische Informatik (TIB)
      </h1>

    </div>

    <div
      style="
        display:flex;
        align-items:center;
        gap:30px;
      "
    >

      <div
        style="
          font-weight:bold;
          font-size:18px;
          text-align:right;
        "
      >
        {{ aktuelleUhrzeit }}
        &nbsp;&nbsp;&nbsp;
        {{ aktuellesDatum }}
      </div>

      <button

        @click="logout"

        style="
          padding:8px 18px;
          border:1px solid black;
          background:#ddd;
          font-weight:bold;
          cursor:pointer;
        "
      >
        Logout
      </button>

    </div>

  </div>

  <!-- Übersicht Raster -->

  <div
    v-if="!aktivTermin"
    style="
      display:grid;
      grid-template-columns:repeat(3,1fr);
      gap:25px;
      width:100%;
    "
  >

    <div

      v-for="termin in termine"
      :key="termin.id"

      @click="zeigeDetails(termin)"

      style="
        border:2px solid black;
        border-radius:12px;
        padding:30px;
        cursor:pointer;
        background:white;
        min-height:140px;

        display:flex;
        flex-direction:column;
        justify-content:space-between;
      "
    >

      <h3
        style="
          margin-top:0;
          font-size:20px;
        "
      >
        {{ termin.title }}
      </h3>

      <p style="margin:5px 0;font-size:16px;">
        Raum: {{ termin.room.number }}
      </p>

      <p
        style="
          margin:5px 0;
          font-size:16px;
          font-weight:bold;
        "
      >
        {{ termin.start }} - {{ termin.end }} Uhr
      </p>

    </div>

  </div>

  <!-- Detailansicht -->

  <div

    v-if="aktivTermin"

    style="
      display:flex;
      gap:30px;

      border:2px solid black;
      border-radius:12px;

      padding:40px;

      background:white;

      align-items:flex-start;

      width:100%;
      box-sizing:border-box;
    "
  >

    <div

      style="
        flex:1;

        border:2px solid black;
        border-radius:8px;

        padding:30px;

        background:#fafafa;
      "
    >

      <h2
        style="
          margin-top:0;
          font-size:24px;
        "
      >
        {{ aktivTermin.title }}
      </h2>

      <p style="font-size:18px;margin:15px 0;">
        <strong>Raum:</strong>
        {{ aktivTermin.room.number }}
        ({{ aktivTermin.room.description }})
      </p>

      <p style="font-size:18px;margin:15px 0;">
        <strong>Uhrzeit:</strong>
        {{ aktivTermin.start }} - {{ aktivTermin.end }}
      </p>

      <p style="font-size:18px;margin:15px 0;">
        <strong>Dozent:</strong>
        {{ aktivTermin.lecturers[0].name }}
      </p>

      <p style="font-size:18px;margin:15px 0;">

        <strong>Status:</strong>

        <span
          :style="{
            color: aktivTermin.status === 'CANCELLED'
              ? 'red'
              : 'green'
          }"
        >
          {{
            aktivTermin.status === 'SCHEDULED'
              ? 'Geplant'
              : 'Entfall'
          }}
        </span>

      </p>

      <p style="font-size:18px;margin:15px 0;">
        <strong>Event (Datum):</strong>
        {{ aktivTermin.date }}
      </p>

      <div
        style="
          margin-top:25px;
          display:flex;
          gap:15px;
        "
      >

        <button

          @click="zeigeRoute"

          style="
            padding:10px 25px;
            border:1px solid black;
            background:#eee;
            cursor:pointer;
            font-weight:bold;
            font-size:16px;
          "
        >
          Route
        </button>

        <button

          @click="schliesseDetails"

          style="
            padding:10px 25px;
            border:1px solid black;
            background:#ddd;
            cursor:pointer;
            font-weight:bold;
            font-size:16px;
          "
        >
          Zurück zur Übersicht
        </button>

      </div>

    </div>

    <div

      v-if="zeigWegbeschreibung"

      style="
        flex:1;

        border:2px solid black;
        border-radius:8px;

        padding:30px;

        min-height:280px;

        background:#fafafa;

        display:flex;
        flex-direction:column;
        justify-content:space-between;
      "
    >

      <div>

        <h3
          style="
            margin-top:0;
            font-size:22px;
          "
        >
          Wegbeschreibung:
        </h3>

        <p
          style="
            font-size:18px;
            line-height:1.6;
          "
        >
          Textuelle Beschreibung
          (Links, Rechts, Aufzug,
          1.Stock, ...)
        </p>

      </div>

    </div>

  </div>

</template>

<script>
export default {

  emits: ['logout'],

  data() {

    return {

      aktivTermin: null,
      zeigWegbeschreibung: false,

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

          room: {
            number: 'F01.204',
            description: 'Hörsaal'
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

          room: {
            number: 'F02.204',
            description: 'Labor'
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
        jetzt.toLocaleTimeString(
          'de-DE',
          {
            hour: '2-digit',
            minute: '2-digit'
          }
        )

      this.aktuellesDatum =
        jetzt.toLocaleDateString(
          'de-DE'
        )

    },

    zeigeDetails(termin) {
      this.aktivTermin = termin
      this.zeigWegbeschreibung = false
    },

    zeigeRoute() {
      this.zeigWegbeschreibung = true
    },

    schliesseDetails() {
      this.aktivTermin = null
      this.zeigWegbeschreibung = false
    }

  }

}
</script>