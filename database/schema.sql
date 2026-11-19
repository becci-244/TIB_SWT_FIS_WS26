-- ============================================
-- FIS Datenbank V1
-- ============================================

DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Lecturer;
DROP TABLE IF EXISTS Room;

-- ============================================
-- Räume
-- ============================================

CREATE TABLE Room (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    number TEXT NOT NULL,

    floor INTEGER,

    description TEXT
);

-- ============================================
-- Dozenten
-- ============================================

CREATE TABLE Lecturer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    name TEXT NOT NULL,

    email TEXT
);

-- ============================================
-- Termine
-- ============================================

CREATE TABLE Appointment (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    title TEXT NOT NULL,

    date TEXT NOT NULL,

    start TEXT NOT NULL,

    end TEXT NOT NULL,

    type TEXT NOT NULL,

    status TEXT NOT NULL DEFAULT 'SCHEDULED',

    room_id INTEGER NOT NULL,

    lecturer_id INTEGER NOT NULL,

    FOREIGN KEY (room_id)
        REFERENCES Room(id),

    FOREIGN KEY (lecturer_id)
        REFERENCES Lecturer(id)
);

-- ============================================
-- Testdaten Räume
-- ============================================

INSERT INTO Room (
    number,
    floor,
    description
)
VALUES
    ('F01.204', 1, 'Hörsaal'),
    ('F02.204', 2, 'Labor'),
    ('F01.022', 1, 'Seminarraum');

-- ============================================
-- Testdaten Dozenten
-- ============================================

INSERT INTO Lecturer (
    name,
    email
)
VALUES
    (
        'Prof. Dr. Mirko Sonntag',
        'mirko.sonntag@hs-esslingen.de'
    ),
    (
        'Prof. Scharf',
        'scharf@hs-esslingen.de'
    ),
    (
        'Prof. Jaeger',
        'jaeger@hs-esslingen.de'
    );

-- ============================================
-- Testdaten Termine
-- ============================================

INSERT INTO Appointment (
    title,
    date,
    start,
    end,
    type,
    status,
    room_id,
    lecturer_id
)
VALUES

(
    'Softwaretechnik',
    '2026-11-11',
    '14:00',
    '19:00',
    'LECTURE',
    'SCHEDULED',
    1,
    1
),

(
    'Rechnernetze',
    '2026-11-11',
    '09:45',
    '13:00',
    'LECTURE',
    'SCHEDULED',
    2,
    2
),

(
    'Elektronik',
    '2026-11-11',
    '08:00',
    '11:15',
    'LECTURE',
    'SCHEDULED',
    3,
    3
);