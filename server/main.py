import os
from flask import Flask, request, Response, send_from_directory

app = Flask(__name__)
SWF_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "static")

@app.route('/game.swf')
def return_swf_file():
    return send_from_directory(SWF_DIR, "game.swf",
                               mimetype="application/x-shockwave-flash")

@app.route('/linklevel', methods=['POST'])
def link_level():
    level = request.form.get('level')
    if not level:
        return Response("error", mimetype='text/plain')
    return Response(f"http://localhost:5000/play?lvl={level[:8]}",
                    mimetype='text/plain')

@app.route('/crossdomain.xml')
def crossdomain():
    xml = '''<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM
  "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd">
<cross-domain-policy>
  <allow-access-from domain="*" to-ports="*" secure="false"/>
</cross-domain-policy>'''
    return Response(xml, mimetype='text/x-cross-domain-policy')

app.run(host='0.0.0.0', port=5000, debug=True)