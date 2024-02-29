from flask import Flask # import the flask module we installed earlier 
import uuid # import the uuid module, this ships with python so we didn't need to install it

app = Flask(__name__) # Initialise the flask app as app

# TODO - pass text and call text to sql
@app.route('/') # Declare the '/' route for app using a route decorator 
def get_uuid(): # Define a function to respond to the route
    return str(uuid.uuid4()) # Return a uuid string as the response