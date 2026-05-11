import time
import os

REDIS_URL = os.getenv("REDIS_URL", "redis://localhost:6379/0")
BACKEND_API_URL = os.getenv("BACKEND_API_URL", "http://backend-api:8000")


def main():
    print(f"[worker] Iniciando.")
    print(f"[worker] Redis: {REDIS_URL}")
    print(f"[worker] Backend API: {BACKEND_API_URL}")
    print("[worker] Esperando jobs en cola 'clips_queue' ...")
    while True:
        print("[worker] ping - sin jobs aún")
        time.sleep(5)


if __name__ == "__main__":
    main()
