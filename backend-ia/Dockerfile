# DriveCheck - Backend IA (Worker)
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libgomp1 \
    ffmpeg \
    curl \
    procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/models \
             /storage/clips \
             /storage/reportes

HEALTHCHECK --interval=30s --timeout=10s --start-period=20s --retries=3 \
    CMD ps aux | grep "python worker.py" | grep -v grep || exit 1

CMD ["python", "worker.py"]
