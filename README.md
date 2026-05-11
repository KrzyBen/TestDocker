# TestDocker de Drivecheck

## Arquitectura

El proyecto está compuesto por los siguientes servicios Docker:

| Servicio | Descripción |
|---|---|
| `db` | Base de datos PostgreSQL |
| `backend-api` | API principal en FastAPI |
| `backend-ia` | Worker de procesamiento IA |
| `frontend` | Frontend React + Vite |
| `storage` | Volumen compartido para clips y reportes |

---

# Configuración inicial

## 1. Clonar repositorio

```bash
git clone https://github.com/KrzyBen/TestDocker
cd TestDocker
```

---

## 2. Crear archivo `.env` o modificar el ya existente.

```env
POSTGRES_USER=drivecheck
POSTGRES_PASSWORD=drivecheck123
POSTGRES_DB=drivecheck_db
SECRET_KEY=clave_super_secreta
```

---

# Build y ejecución

## Levantar todos los servicios

```bash
docker compose up --build
```

---

## Levantar en segundo plano

```bash
docker compose up -d --build
```

---

# Detener servicios

```bash
docker compose down
```

---

# Reinicio limpio

Eliminar contenedores, redes y volúmenes:

```bash
docker compose down -v
```

Luego reconstruir:

```bash
docker compose up --build
```

---

# Accesos principales

| Servicio | URL |
|---|---|
| Frontend | http://localhost:5173 |
| Backend API | http://localhost:8000 |
| Healthcheck API | http://localhost:8000/health |

---

# Estructura general

```text
.
├── backend-api/
├── backend-ia/
├── frontend/
├── db/
├── docker-compose.yml
├── .env
└── env.example
```
