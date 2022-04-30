from flask import Flask
from flask import render_template
from flask import request
import mysql.connector
import pandas as pd

app = Flask(__name__) 

db_user = 'user'
db_password = 'Hackaton'
db_name = 'product'
db_connection_name = 'lastminutecoders-ghack:us-central1:bdd-main'

def open_connection():
    conn = mysql.connector.connect(host= '35.202.234.243', user = 'root', password = 'Hackaton', database = 'product')
    return conn

    
def getObjects():
    conn = open_connection()
    with conn.cursor() as cursor:
        result = cursor.execute("SELECT * FROM objects,Picture where Picture.img_id = objects.UniqueID LIMIT 100 ;")
        products = pd.DataFrame(cursor.fetchall())
        frame = pd.DataFrame(products)
    conn.close()
    return frame

def getFilteredObjects(filter = None):
    conn = open_connection()
    with conn.cursor() as cursor:
        query = """SELECT * FROM objects, Picture where Picture.img_id = objects.UniqueID"""
        if filter != None:
            query += """ AND (TypeOfObject = %s or Marque = %s or RefObject = %s) LIMIT 100;"""
            result = cursor.execute(query, (filter,filter, filter))
        else:
            result = cursor.execute(query)
        products = pd.DataFrame(cursor.fetchall())
        frame = pd.DataFrame(products)
    conn.close()
    return frame
    
#@app.route('/')
@app.route('/')
@app.route('/about/')
def home():
    return render_template('about.html')

@app.route('/search/')
def search():
    #requete totale
    obj = getObjects()
    numbers = range(len(obj[0]))
    return render_template('search.html', flag = True, nums = numbers, object1 = obj[0], object2= obj[1], object3 = obj[2], object4 = obj[3], object5 = obj[4], object6 = obj[5], object7 = obj[6], object8 = obj[7], object9 = obj[8], object10 = obj[9], object11 = obj[10], object12 = obj[11], object13 = obj[12], object16 = obj[15])

@app.route('/fetch/', methods=['GET', 'POST'])
def fetch():
    filterValue = request.form['search']
    obj = getFilteredObjects(filterValue)
    if(len(obj) > 0):
        numbers = range(len(obj[0]))
        isResult = True
    else:
        numbers = 0
        isResult = False
        obj = [0] * 20
    return render_template('search.html', flag = isResult, nums = numbers, object1 = obj[0], object2= obj[1], object3 = obj[2], object4 = obj[3], object5 = obj[4], object6 = obj[5], object7 = obj[6], object8 = obj[7], object9 = obj[8], object10 = obj[9], object11 = obj[10], object12 = obj[11], object13 = obj[12], object16 = obj[15])




