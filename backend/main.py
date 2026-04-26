"""
Smart Supply Sourcing China — FastAPI Backend
Deployed on Render (https://render.com)

Entry point: uvicorn backend.main:app --host 0.0.0.0 --port $PORT
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Smart Supply Sourcing China API",
    description="Back-office API for order lifecycle, quotes, M-Pesa payments, and admin operations.",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Tighten in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
def health_check():
    return {"status": "ok", "service": "smart-supply-api"}
