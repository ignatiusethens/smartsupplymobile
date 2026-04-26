"""
Smart Supply Sourcing China — FastAPI Backend
Deployed on Render (https://render.com)

Entry point: uvicorn main:app --host 0.0.0.0 --port $PORT
"""

from fastapi import FastAPI

app = FastAPI(
    title="Smart Supply Sourcing China API",
    description="Back-office API for order lifecycle, quotes, M-Pesa payments, and admin operations.",
    version="1.0.0",
)


@app.get("/")
def root():
    return {"message": "Smart Supply API is running"}


@app.get("/health")
def health_check():
    return {"status": "ok", "service": "smart-supply-api", "version": "1.0.1"}
