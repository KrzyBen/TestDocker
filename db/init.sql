-- DriveCheck - Inicialización de base de datos

CREATE TABLE IF NOT EXISTS usuarios (
    id          SERIAL PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE NOT NULL,
    password    VARCHAR(255) NOT NULL,
    rol         VARCHAR(20) NOT NULL CHECK (rol IN ('administrador', 'validador', 'usuario')),
    activo      BOOLEAN DEFAULT TRUE,
    creado_en   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS eventos (
    id              SERIAL PRIMARY KEY,
    ruta_clip       VARCHAR(500) NOT NULL,
    latitud         DECIMAL(9,6),
    longitud        DECIMAL(9,6),
    fecha_evento    TIMESTAMP NOT NULL,
    estado          VARCHAR(20) DEFAULT 'pendiente'
                        CHECK (estado IN ('pendiente', 'procesando', 'procesado', 'descartado')),
    creado_en       TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS reportes (
    id              SERIAL PRIMARY KEY,
    evento_id       INTEGER REFERENCES eventos(id) ON DELETE CASCADE,
    ruta_reporte    VARCHAR(500),
    clasificacion   VARCHAR(100),
    infraccion      VARCHAR(200),
    confianza       DECIMAL(5,2),
    validado_por    INTEGER REFERENCES usuarios(id),
    estado          VARCHAR(20) DEFAULT 'pendiente'
                        CHECK (estado IN ('pendiente', 'aprobado', 'descartado')),
    creado_en       TIMESTAMP DEFAULT NOW()
);
