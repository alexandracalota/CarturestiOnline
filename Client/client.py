import string
import random
from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from copy import deepcopy

server = Flask(__name__)

server.config['MYSQL_HOST'] = 'localhost'
server.config['MYSQL_USER'] = 'user'
server.config['MYSQL_PASSWORD'] = 'student'
server.config['MYSQL_DB'] = 'db_carturesti'

mysql = MySQL(server)

# config = {
#     'user': 'student',
#     'password': 'student',
#     'host': 'database',
#     'port': '3306',
#     'database': 'db_liceu'
# }

@server.route('/signup', methods = ['GET', 'POST'], endpoint='signup')
def signup():
	if request.method == 'GET':
		return render_template("signup.html")
	else:
		name = request.form['name']
		surname = request.form['surname']
		email = request.form['email']
		password = request.form['psw']
		rep_password = request.form['psw-repeat']

		session['email'] = email

		return redirrect(url_for('home'))

@server.route('/login', methods = ['GET', 'POST'], endpoint='login')
def login():
	if request.method == 'GET':
		return render_template("login.html")
	else:
		email = request.form['email']
		password = request.form['psw']

		session['email'] = email

		return redirrect(url_for('home'))

@server.route('/contact', methods = ['GET'], endpoint='contact')
def contact():
	return render_template('contact.html')

@server.route('/about', methods = ['GET'], endpoint='about')
def about():
	return render_template('about.html')

@server.route('/home', methods = ['GET'], endpoint='home')
def home():
	return render_template('home.html')

@server.route('/', methods = ['GET'], endpoint='user')
def main_page():
	return render_template('home.html')

loggedin = False

if __name__ == '__main__':
    server.run(host='0.0.0.0', debug=True, port=5050)
