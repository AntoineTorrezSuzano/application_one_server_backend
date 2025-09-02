from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/deploy', methods=['POST'])
def deploy_killer_move():
    try:
        data = request.json
        html_content = data['html_content']

        result = subprocess.run(
            # ['./new_host.sh'],
            ['./new_host.sh', html_content],
            capture_output=True,
            text=True,
            check=True
        )

        container_url = result.stdout.strip()

        return jsonify({"status": "success", "url": container_url}), 200
        # return jsonify({"status": "success"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5999)