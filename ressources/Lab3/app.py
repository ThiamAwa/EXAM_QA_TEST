from flask import Flask, request

app = Flask(__name__)

@app.route('/callback')
def callback():
    code = request.args.get('code')
    return f"Code OAuth reçu : {code}"

if __name__ == '__main__':
    app.run(port=2000)
# This is a simple Flask application that listens for OAuth callback requests.
# It defines a single route '/callback' that retrieves the 'code' parameter from the request