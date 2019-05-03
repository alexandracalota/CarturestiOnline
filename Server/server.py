import mysql.connector
import string
import random
from flask import Flask, render_template, request, redirect, url_for
from copy import deepcopy

server = Flask(__name__)

config = {
    'user': 'student',
    'password': 'student',
    'host': 'database',
    'port': '3306',
    'database': 'db_liceu'
}

@server.route('/teachers', methods = ['GET'], endpoint='teachersGetEndpoint')
def teachers_get():
	connection = mysql.connector.connect(**config)
	cursor = connection.cursor(buffered=True)

	cursor.execute('select teachers.prof_ID, teachers.surname, teachers.name, teachers.subject_ID, teachers.hiredate,' +
		' classes.class_ID from teachers, classes where classes.hometeacher_ID = teachers.prof_ID')
	result = str(cursor.fetchall())

	cursor.close()
	connection.commit()
	connection.close()

	return result



@server.route('/showgrades', methods = ['POST'], endpoint='showGradesGPostEndpoint')
def show_grades_post():
	connection = mysql.connector.connect(**config)
	cursor = connection.cursor(buffered=True)

	args = []

	args.append(request.form['surname'])
	args.append(request.form['father'])
	args.append(request.form['name'])
	args.append(request.form['subject'])

	cursor.execute('select get_grades(%s, %s, %s, %s)', tuple(args))
	result = cursor.fetchall()

	cursor.close()
	connection.commit()
	connection.close()

	return str(result[0][0]).replace('|', '\n')

@server.route('/showgrades', methods = ['GET'], endpoint='showGradesGetEndpoint')
def show_grades_get():
	return render_template('show_grades.html')



@server.route('/addgrade', methods = ['POST'], endpoint='addGradeGPostEndpoint')
def add_grade_post():
	connection = mysql.connector.connect(**config)
	cursor = connection.cursor(buffered=True)

	args = []

	args.append(request.form['surname'])
	args.append(request.form['father'])
	args.append(request.form['name'])
	args.append(request.form['subject'])
	args.append(int(request.form['grade']))

	cursor.callproc('add_grade', tuple(args))

	cursor.execute('select * from grades')
	result = str(cursor.fetchall())

	cursor.close()
	connection.commit()
	connection.close()

	return render_template('success_grade_added.html')

@server.route('/addgrade', methods = ['GET'], endpoint='addGradeGetEndpoint')
def add_grade_get():
	return render_template('add_grade.html')



@server.route('/enroll', methods = ['POST'], endpoint='enrollPostEndpoint')
def enroll_get():
	connection = mysql.connector.connect(**config)
	cursor = connection.cursor(buffered=True)

	args = []

	args.append(request.form['surname'])
	args.append(request.form['father'])
	args.append(request.form['name'])
	args.append(request.form['CNP'])
	args.append(request.form['field'])
	args.append(int(request.form['year']))

	cursor.callproc('enroll_student', tuple(args))

	cursor.execute('select * from students')
	result = str(cursor.fetchall())

	cursor.close()
	connection.commit()
	connection.close()

	return render_template('sucess_enrollment.html')

@server.route('/enroll', methods = ['GET'], endpoint='enrollGetEndpoint')
def enroll_get():
	return render_template('enroll.html')



@server.route('/classes', methods = ['GET'], endpoint='classesGetEndpoint')
def classes_get():
	connection = mysql.connector.connect(**config)
	cursor = connection.cursor(buffered=True)

	cursor.execute('select classes.class_ID, students.name, students.surname from students,' +
		' classes order by classes.class_ID')
	result = str(cursor.fetchall())
	result += '\n'

	cursor.close()
	connection.commit()
	connection.close()

	return result



@server.route('/menu', methods = ['POST'], endpoint='menuPostEndpoint')
def menu_post():
	global loggedin
	option = request.form['option']
	if option == "teachers":
		return redirect(url_for('teachersGetEndpoint'))
	elif option == "classes":
		return redirect(url_for('classesGetEndpoint'))
	elif option == "enroll":
		return redirect(url_for('enrollGetEndpoint'))
	elif option == "add_grade":
		return redirect(url_for('addGradeGetEndpoint'))
	elif option == "show_grades":
		return redirect(url_for('showGradesGetEndpoint'))


@server.route('/menu', methods = ['GET'], endpoint='menuGetEndpoint')
def menu_get():
	return render_template('menu.html')

@server.route('/', methods = ['POST'], endpoint='mainPost')
def main_page_post():
	global loggedin
	if request.form['username'] == "student":
		if request.form['password'] == "student":
			loggedin = True
			return redirect(url_for('menuGetEndpoint'))
		else:
			return redirect(url_for('mainGet'))
	elif request.form['username'] == "root":
		if request.form['password'] == "mypass":
			loggedin = True
			return redirect(url_for('menuGetEndpoint'))
		else:
			return redirect(url_for('mainGet'))
	else:
		return redirect(url_for('mainGet'))

@server.route('/', methods = ['GET'], endpoint='mainGet')
def main_page_get():
	return render_template('init_page.html')

loggedin = False

if __name__ == '__main__':
    server.run(host='0.0.0.0', debug=True)