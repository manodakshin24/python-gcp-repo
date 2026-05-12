from fastapi import FastAPI
import os

app = FastAPI(title="Python GCP Security Lab")

@app.get("/")
def read_root():
    return {
        "status": "Online",
        "environment": os.getenv("ENV", "development"),
        "message": "Securely deployed to Artifact Registry!"
    }

@app.get("/health")
def health_check():
    return {"status": "healthy"}