from flask import Flask, jsonify

app = Flask(__name__)
SERVICE_NAME = "fraud-service"

@app.route('/health')
def health():
    return jsonify({"service": SERVICE_NAME, "status": "healthy"})

@app.route('/')
def home():
    return jsonify({"message": f"Welcome to {SERVICE_NAME}"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
