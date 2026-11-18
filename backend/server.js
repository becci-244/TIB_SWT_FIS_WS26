const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const PORT = 3000;

// ============================================
// Datenbank Verbindung
// ============================================

const dbPath = path.join(
  __dirname,
  '..',
  'database',
  'fis.db'
);

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error('Fehler beim Verbinden der Datenbank:', err.message);
  } else {
    console.log('✅ SQLite verbunden');
  }
});

// ============================================
// Test Route
// ============================================

app.get('/', (req, res) => {
  res.send('FIS Backend läuft');
});

// ============================================
// Alle Termine laden
// ============================================

app.get('/api/v1/appointments', (req, res) => {

  const sql = `
    SELECT
      Appointment.id,
      Appointment.title,
      Appointment.date,
      Appointment.start,
      Appointment.end,
      Appointment.status,
      Room.number AS room,
      Lecturer.name AS lecturer

    FROM Appointment

    JOIN Room
      ON Appointment.room_id = Room.id

    JOIN Lecturer
      ON Appointment.lecturer_id = Lecturer.id
  `;

  db.all(sql, [], (err, rows) => {

    if (err) {

      res.status(500).json({
        error: err.message
      });

      return;
    }

    res.json(rows);

  });

});

// ============================================
// Server starten
// ============================================

app.listen(PORT, () => {
  console.log(
    `Backend läuft auf http://localhost:${PORT}`
  );
});