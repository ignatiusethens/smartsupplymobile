"""
Smart Supply Sourcing China — Flask Backend
Deployed on Render (https://render.com)

Entry point: gunicorn main:app --bind 0.0.0.0:$PORT
"""

from flask import Flask, jsonify, request
import os
import json
import firebase_admin
from firebase_admin import credentials, auth, firestore
from dotenv import load_dotenv
from functools import wraps

# Load environment variables
load_dotenv()

app = Flask(__name__)

# Initialize Firebase Admin SDK
def initialize_firebase():
    try:
        # Get Firebase service account from environment variable
        firebase_creds = os.getenv('FIREBASE_SERVICE_ACCOUNT_JSON')
        if firebase_creds:
            # Parse JSON string to dict
            cred_dict = json.loads(firebase_creds)
            cred = credentials.Certificate(cred_dict)
            firebase_admin.initialize_app(cred)
            print("Firebase Admin SDK initialized successfully")
        else:
            print("Warning: FIREBASE_SERVICE_ACCOUNT_JSON not found in environment")
    except Exception as e:
        print(f"Error initializing Firebase: {e}")

# Initialize Firebase on startup
initialize_firebase()

# Middleware to verify Firebase ID token
def verify_token(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return jsonify({'error': 'No authorization token provided'}), 401
        
        try:
            # Remove 'Bearer ' prefix if present
            if token.startswith('Bearer '):
                token = token[7:]
            
            # Verify the token
            decoded_token = auth.verify_id_token(token)
            request.user = decoded_token
            return f(*args, **kwargs)
        except Exception as e:
            return jsonify({'error': 'Invalid token', 'details': str(e)}), 401
    
    return decorated_function

@app.route("/")
def root():
    return jsonify({"message": "Smart Supply API is running"})

@app.route("/health")
def health_check():
    return jsonify({
        "status": "ok", 
        "service": "smart-supply-api", 
        "version": "1.0.1"
    })

# Protected route example
@app.route("/api/user/profile")
@verify_token
def get_user_profile():
    user = request.user
    return jsonify({
        "uid": user['uid'],
        "email": user.get('email'),
        "name": user.get('name'),
        "message": "Profile retrieved successfully"
    })

# Test Firebase connection
@app.route("/api/test/firebase")
def test_firebase():
    try:
        # Try to access Firestore
        db = firestore.client()
        # Create a test document
        test_ref = db.collection('test').document('connection')
        test_ref.set({'timestamp': firestore.SERVER_TIMESTAMP, 'status': 'connected'})
        
        return jsonify({
            "status": "success",
            "message": "Firebase connection working",
            "firestore": "connected"
        })
    except Exception as e:
        return jsonify({
            "status": "error",
            "message": "Firebase connection failed",
            "error": str(e)
        }), 500

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
