import string
import random
import pandas as pd
from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from copy import deepcopy

server = Flask(__name__)

server.config['MYSQL_HOST'] = 'database'
server.config['MYSQL_USER'] = 'student'
server.config['MYSQL_PASSWORD'] = 'student'
server.config['MYSQL_DB'] = 'db_carturesti'
server.config['MYSQL_PORT'] = 3306

mysql = MySQL(server)

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

		if password == rep_password:
			args = [name, surname, email, password]

			cur = mysql.connection.cursor()
			
			cur.callproc('add_user', tuple(args))

			mysql.connection.commit()
			cur.close()

			session['email'] = email

			return redirect(url_for('home'))

		return redirect(url_for('signup'))

@server.route('/login', methods = ['GET', 'POST'], endpoint='login')
def login():
	if request.method == 'GET':
		return render_template("login.html")
	else:
		email = request.form['email']
		password = request.form['psw']

		args = [email]

		cur = mysql.connection.cursor()
		
		cur.execute('select find_user(%s)', tuple(args))

		result = cur.fetchall()
		mysql.connection.commit()
		cur.close()

		if result[0][0] == password:
			session['email'] = email

			return redirect(url_for('home'))

		return render_template('login.html')

@server.route('/logout', methods= ['GET', 'POST'], endpoint='logout')
def logout():
	session['email'] = None

	return redirect(url_for('home'))

@server.route('/cart', methods= ['GET', 'POST'], endpoint='cart')
def cart():
	if request.method == 'GET':		
		query = 'select product.product_name, cart_item.number_of_items, cart_item.total_price '
		query += 'from product, customer, cart, cart_item '
		query += 'where product.product_id = cart_item.product_id and '
		query += 'customer.email = "' + session['email']
		query += '" and customer.customer_id = cart.customer_id'

		df = pd.read_sql(query, mysql.connection)

		return render_template('cart.html', data=df)

@server.route('/books', methods = ['GET', 'POST'], endpoint='books')
def books():
	if request.method == 'GET':		
		query = 'select product.product_name, book.author, book.year, book.genre, '
		query += 'product.price from product, book where product.product_id = book.product_id'
		df = pd.read_sql(query, mysql.connection)

		return render_template('cart.html', data=df)

@server.route('/cds', methods = ['GET', 'POST'], endpoint='cds')
def cds():
	if request.method == 'GET':
		query = 'select product.product_name, cd.artist, cd.year, cd.genre, '
		query += 'product.price from product, cd where product.product_id = cd.product_id'
		df = pd.read_sql(query, mysql.connection)

		return render_template('cds.html', data=df)

@server.route('/pens', methods = ['GET', 'POST'], endpoint='pens')
def pens():
	if request.method == 'GET':
		query = 'select product.product_name, pen.type, pen.number_of_pens, pen.manufacturer, '
		query += 'product.price from product, pen where product.product_id = pen.product_id'
		df = pd.read_sql(query, mysql.connection)
		
		return render_template('pens.html', data=df)

@server.route('/notebooks', methods = ['GET', 'POST'], endpoint='notebooks')
def notebooks():
	if request.method == 'GET':
		query = 'select product.product_name, notebook.type, notebook.size, '
		query += 'product.price from product, notebook where product.product_id = notebook.product_id'
		df = pd.read_sql(query, mysql.connection)
		
		return render_template('notebooks.html', data=df)

@server.route('/contact', methods = ['GET'], endpoint='contact')
def contact():
	return render_template('contact.html')

@server.route('/home', methods = ['GET'], endpoint='home')
def home():
	return render_template('home.html')

@server.route('/', methods = ['GET'], endpoint='user')
def main_page():
	return render_template('home.html')

if __name__ == '__main__':
	server.secret_key = "\xf0?a\x9a\\\xff\xd4;\x0c\xcbHi"
	server.run(host='0.0.0.0', debug=True, port=5000)
