"""
Smart Supply Sourcing China — Flask Backend
Deployed on Render (https://render.com)

Entry point: gunicorn main:app --bind 0.0.0.0:$PORT
"""

from flask import Flask, jsonify
import os

app = Flask(__name__)


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


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
