# Smart Supply Sourcing China

B2B industrial equipment sourcing platform for the Kenyan market.

## Repository Structure

```
smartsupplymobile/
├── smart_supply/        # Flutter mobile app (Android & iOS)
│   ├── lib/
│   │   ├── features/    # Screen modules (auth, catalog, orders, requests, account)
│   │   └── core/        # Theme, colors, text styles
│   └── pubspec.yaml
│
├── backend/             # Python FastAPI — deployed on Render
│   ├── main.py          # App entry point
│   ├── requirements.txt # Python dependencies
│   ├── render.yaml      # Render deployment config
│   └── .env.example     # Environment variable template
│
├── COMPLETE_RESEARCH_DOCUMENTATION.md
└── DIAGRAMS_MERMAID.md
```

## Flutter App

```bash
cd smart_supply
flutter pub get
flutter run
```

## Python API (Render)

```bash
cd backend
python -m venv venv
source venv/bin/activate      # Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env          # Fill in your secrets
uvicorn backend.main:app --reload
```

API runs at `http://localhost:8000`. Health check: `GET /health`

## Deployment

- **Flutter**: Build with `flutter build apk` or `flutter build ios`
- **Python API**: Connected to Render via `render.yaml` in `/backend`. Render auto-deploys on push to `main`.

## Environment Variables (Render)

Set these in the Render dashboard under Environment:

| Variable | Description |
|----------|-------------|
| `FIREBASE_SERVICE_ACCOUNT_JSON` | Firebase Admin SDK service account JSON |
| `DARAJA_CONSUMER_KEY` | Safaricom Daraja API consumer key |
| `DARAJA_CONSUMER_SECRET` | Safaricom Daraja API consumer secret |
| `DARAJA_SHORTCODE` | M-Pesa business shortcode |
| `DARAJA_PASSKEY` | M-Pesa Lipa Na M-Pesa passkey |
| `DARAJA_CALLBACK_URL` | Public URL for M-Pesa STK push callbacks |
| `FCM_SERVER_KEY` | Firebase Cloud Messaging server key |
| `PYTHON_API_BASE_URL` | Your Render service URL |
