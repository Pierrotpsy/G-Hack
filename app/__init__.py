from flask import Flask
from flask import render_template
from flask import request
import os
import pymysql
import sqlite3
#from google.cloud import storage
import mysql.connector
from mysql.connector import errorcode
import pandas as pd
from flask import jsonify

app = Flask(__name__) 

#db_user = os.environ.get('CLOUD_SQL_USERNAME')
#db_password = os.environ.get('CLOUD_SQL_PASSWORD')
#db_name = os.environ.get('CLOUD_SQL_DATABASE_NAME')
#db_connection_name = os.environ.get('CLOUD_SQL_CONNECTION_NAME')

db_user = 'user'
db_password = 'Hackaton'
db_name = 'product'
db_connection_name = 'lastminutecoders-ghack:us-central1:bdd-main'

def open_connection():
    #unix_socket = '/cloudsql/{}'.format(db_connection_name)
        
    #conn = pymysql.connect(host = '35.202.234.243',user=db_user, password=db_password,
    #                       unix_socket=unix_socket, db=db_name,
    #                        cursorclass=pymysql.cursors.DictCursor)
    print("not good")
    
    
    conn = mysql.connector.connect(host= '35.202.234.243', user = 'root', password = 'Hackaton', database = 'product')
    return conn

    
def getObjects():
    conn = open_connection()
    
    print("success")
    with conn.cursor() as cursor:
        result = cursor.execute("SELECT * FROM objects;")
        products = pd.DataFrame(cursor.fetchall())
        #if result > 0:
        frame = pd.DataFrame(products)
        print(frame)
        #else:
        #    got_prods = 'No products in DB'
    conn.close()
    return frame

def getFilteredObjects(filter = None):
    conn = open_connection()
    with conn.cursor() as cursor:
        query = """SELECT * FROM objects"""
        if filter != None:
            query += """ WHERE TypeOfObject = %s or Marque = %s or RefObject = %s;"""
            print(query, (filter,))
            result = cursor.execute(query, (filter,filter, filter))
        else:
            result = cursor.execute(query)
            
        #result = cursor.execute('SELECT * FROM objects where TypeOfObject = filter;')
        products = pd.DataFrame(cursor.fetchall())
        #if result > 0:
        frame = pd.DataFrame(products)
        #else:
        #    got_prods = 'No products in DB'
    conn.close()
    return frame
    
#@app.route('/')
@app.route('/')
@app.route('/about/')
def home():
    return render_template('about.html')#, title = 'Test', user = 'Raphaël', post = 'Demare'  )

@app.route('/search/')
def search():
    #requete totale
    obj = getObjects()
    numbers = range(len(obj[0]))
    return render_template('search.html', nums = numbers, object1 = obj[0], object2= obj[1], object3 = obj[2], object4 = obj[3], object5 = obj[4], object6 = obj[5], object7 = obj[6], object8 = obj[7], object9 = obj[8], object10 = obj[9], object11 = obj[10], object12 = obj[11], object13 = obj[12])

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
        obj = [0] * 13
    return render_template('search.html', flag = isResult, nums = numbers, object1 = obj[0], object2= obj[1], object3 = obj[2], object4 = obj[3], object5 = obj[4], object6 = obj[5], object7 = obj[6], object8 = obj[7], object9 = obj[8], object10 = obj[9], object11 = obj[10], object12 = obj[11], object13 = obj[12])




