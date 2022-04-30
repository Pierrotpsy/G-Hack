from flask import Flask
from flask import render_template
import os
import pymysql
import sqlite3
#from google.cloud import storage
import mysql.connector

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
    print("half-success")
    return conn

    
def getObjects():
    conn = open_connection()
    
    print("success")
    with conn.cursor() as cursor:
        result = cursor.execute('SELECT * FROM objects;')
        products = cursor.fetchall()
        if result > 0:
            got_prods = jsonify(products)
        else:
            got_prods = 'No products in DB'
    conn.close()
    return got_prods
    
#@app.route('/')
@app.route('/')
@app.route('/about/')
def home():
    return render_template('about.html')#, title = 'Test', user = 'Raphaël', post = 'Demare'  )

@app.route('/search/')
def search():
    #requete totale
    print(getObjects())
    return render_template('search.html')

@app.route('/fetch/')
def fetch():
    pass



