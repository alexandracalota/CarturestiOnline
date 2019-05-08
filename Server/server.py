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

@server.route('/users', methods = ['GET', 'POST'], endpoint='users')
def users():
	if request.method == 'GET':		
		query = 'select customer_id, customer_name, customer_surname, email '
		query += 'from customer'
		df = pd.read_sql(query, mysql.connection)

		return render_template('users.html', data=df)


@server.route('/add_book', methods = ['GET', 'POST'], endpoint='add_book')
def add_book():
	if request.method == 'GET':
		return render_template('add_book.html')
	else:
		product_name = request.form['name']
		items = request.form['items']
		price = request.form['price']
		description = request.form['description']
		author = request.form['author']
		year = request.form['year']
		genre = request.form['genre']

		args = [product_name, price, items, description, author, year, genre]

		cur = mysql.connection.cursor()
		
		cur.callproc('add_book', tuple(args))

		mysql.connection.commit()
		cur.close()

		return redirect(url_for('books'))

@server.route('/add_cd', methods = ['GET', 'POST'], endpoint='add_cd')
def add_cd():
	if request.method == 'GET':
		return render_template('add_cd.html')
	else:
		product_name = request.form['name']
		items = request.form['items']
		price = request.form['price']
		description = request.form['description']
		artist = request.form['artist']
		year = request.form['year']
		genre = request.form['genre']

		args = [product_name, price, items, description, artist, year, genre]

		cur = mysql.connection.cursor()
		
		cur.callproc('add_cd', tuple(args))

		mysql.connection.commit()
		cur.close()

		return redirect(url_for('cds'))


@server.route('/add_pen', methods = ['GET', 'POST'], endpoint='add_pen')
def add_pen():
	if request.method == 'GET':
		return render_template('add_pen.html')
	else:
		product_name = request.form['name']
		items = request.form['items']
		price = request.form['price']
		description = request.form['description']
		p_type = request.form['type']
		number_of_pens = request.form['number']
		manufacturer = request.form['manufacturer']

		args = [product_name, price, items, description, p_type, number_of_pens, manufacturer]

		cur = mysql.connection.cursor()
		
		cur.callproc('add_pen', tuple(args))

		mysql.connection.commit()
		cur.close()

		return redirect(url_for('pens'))


@server.route('/add_notebook', methods = ['GET', 'POST'], endpoint='add_notebook')
def add_notebook():
	if request.method == 'GET':
		return render_template('add_notebook.html')
	else:
		product_name = request.form['name']
		items = request.form['items']
		price = request.form['price']
		description = request.form['description']
		p_type = request.form['type']
		size = request.form['size']

		args = [product_name, items, price, description, p_type. size]

		cur = mysql.connection.cursor()
		
		cur.callproc('add_notebook', tuple(args))

		mysql.connection.commit()
		cur.close()

		return redirect(url_for('notebooks'))


@server.route('/update', methods = ['GET', 'POST'], endpoint='update')
def update():
	if request.method == 'GET':
		return render_template('update.html')
	else:
		p_id = request.form['p_id']
		quantity = request.form['quantity']

		args = [int(p_id), quantity]

		cur = mysql.connection.cursor()
		
		cur.callproc('update_product', tuple(args))

		mysql.connection.commit()
		cur.close()

		return render_template("update.html", id=p_id)



@server.route('/books', methods = ['GET', 'POST'], endpoint='books')
def books():
	if request.method == 'GET':		
		query = 'select product.product_id, product.product_name, book.author, book.year, book.genre, '
		query += 'product.price, product.items from product, book where product.product_id = book.product_id'
		df = pd.read_sql(query, mysql.connection)

		return render_template('books.html', data=df)

@server.route('/cds', methods = ['GET', 'POST'], endpoint='cds')
def cds():
	if request.method == 'GET':
		query = 'select product.product_id, product.product_name, cd.artist, cd.year, cd.genre, '
		query += 'product.price, product.items from product, cd where product.product_id = cd.product_id'
		df = pd.read_sql(query, mysql.connection)

		return render_template('cds.html', data=df)

@server.route('/pens', methods = ['GET', 'POST'], endpoint='pens')
def pens():
	if request.method == 'GET':
		query = 'select product.product_id, product.product_name, pen.type, pen.number_of_pens, pen.manufacturer, '
		query += 'product.price, product.items from product, pen where product.product_id = pen.product_id'
		df = pd.read_sql(query, mysql.connection)
		
		return render_template('pens.html', data=df)

@server.route('/notebooks', methods = ['GET', 'POST'], endpoint='notebooks')
def notebooks():
	if request.method == 'GET':
		query = 'select product.product_id, product.product_name, notebook.type, notebook.size, '
		query += 'product.price, product.items from product, notebook where product.product_id = notebook.product_id'
		df = pd.read_sql(query, mysql.connection)
		
		return render_template('notebooks.html', data=df)

@server.route('/login', methods = ['GET', 'POST'], endpoint='login')
def login():
	if request.method == 'GET':
		return render_template("login.html")
	else:
		user = request.form['user']
		password = request.form['psw']

		if user == 'admin' and password == 'admin':
			session['admin'] = 'admin'

		return redirect(url_for('home'))

@server.route('/logout', methods= ['GET', 'POST'], endpoint='logout')
def logout():
	session['admin'] = None

	return redirect(url_for('home'))

@server.route('/menu', methods = ['GET', 'POST'], endpoint='menu')
def menu():
	if request.method == 'GET':
		return render_template("menu.html")

@server.route('/home', methods = ['GET', 'POST'], endpoint='home')
def home():
	if 'admin' in session and session['admin']:
		return redirect(url_for('menu'))
	else:
		return redirect(url_for('login'))

@server.route('/', methods = ['GET'], endpoint='admin')
def main_page():
	return redirect(url_for('home'))

if __name__ == '__main__':	
	server.secret_key = "\xf0?a\x9a\\\xff\xd4;\x0c\xcbHi"
	server.run(host='0.0.0.0', debug=True, port=5050)
