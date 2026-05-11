from fastapi import FastAPI

app = FastAPI(title="DriveCheck - Backend API")


@app.get("/health")
def health():
    return {"status": "ok", "service": "backend-api"}


@app.get("/")
def root():
    return {"message": "DriveCheck backend-api funcionando"}
