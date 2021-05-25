from flask import Flask, request
from flask_restful import Resource, Api
import socket
import random

app = Flask(__name__)
api = Api(app)

class Home (Resource):
    def get(self):
        return "/greetings or /square"

class Greeting (Resource):
    def get(self):
        ip = get_ip()
        hostname = socket.gethostname()
        result = 'Hello World from ' + hostname
        return result

class Square (Resource):
    def get(selft):
        number = random.randrange(99)
        result = pow(number,2)
        return 'number: ' + str(number) + ', square: ' + str(result)

def get_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except Exception:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

api.add_resource(Home,  '/') # Route_0
api.add_resource(Greeting, '/greetings') # Route_1
api.add_resource(Square, '/square') # Route_2

if __name__ == '__main__':
    app.run('0.0.0.0','6666')
