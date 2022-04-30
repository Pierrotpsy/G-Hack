from pickle import TRUE
from flask import Flask
from flask import render_template
import db 

app = Flask(__name__) 

#@app.route('/')
@app.route('/')
@app.route('/about/')
def home():
    return render_template('about.html')#, title = 'Test', user = 'Raphaël', post = 'Demare'  )

@app.route('/search/')
def search():
    return render_template('search.html')




