insert into fields (field_name, max_students)
	values("Matematica-Informatica Bilingv-Engleza", 30);
insert into fields (field_name, max_students)
	values("Filologie Bilingv-Engleza", 30);
insert into fields (field_name, max_students)
	values("Stiintele Naturii", 15);
insert into fields (field_name, max_students)
	values("Stiinte Sociale", 15);

insert into subjects (subject_name) value("Mathematics");
insert into subjects (subject_name) value("Informatics");
insert into subjects (subject_name) value("Physics");
insert into subjects (subject_name) value("Biology");
insert into subjects (subject_name) value("Chemistry");
insert into subjects (subject_name) value("Romanian");
insert into subjects (subject_name) value("History");
insert into subjects (subject_name) value("Philosophy");

insert into subjects_fields (subject_ID, field_ID, hours) values(1, 1, 5);
insert into subjects_fields (subject_ID, field_ID, hours) values(2, 1, 7);
insert into subjects_fields (subject_ID, field_ID, hours) values(3, 1, 3);

insert into subjects_fields (subject_ID, field_ID, hours) values(6, 2, 5);
insert into subjects_fields (subject_ID, field_ID, hours) values(7, 2, 5);

insert into subjects_fields (subject_ID, field_ID, hours) values(3, 3, 4);
insert into subjects_fields (subject_ID, field_ID, hours) values(4, 3, 6);
insert into subjects_fields (subject_ID, field_ID, hours) values(5, 3, 5);

insert into subjects_fields (subject_ID, field_ID, hours) values(6, 4, 5);
insert into subjects_fields (subject_ID, field_ID, hours) values(8, 4, 5);

insert into teachers (surname, name, subject_ID, hiredate)
	values("PARK", "JIMIN", 1, STR_TO_DATE('2013-02-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("KIM", "TAEHYUNG", 2, STR_TO_DATE('2013-04-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("JEON", "JUNGKOOK", 3, STR_TO_DATE('2013-04-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("KIM", "SEOKJIN", 4, STR_TO_DATE('2013-05-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("KIM", "NAMJOON", 5, STR_TO_DATE('2013-05-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("JUNG", "HOSEOK", 6, STR_TO_DATE('2013-06-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("MIN", "YOONGI", 7, STR_TO_DATE('2013-06-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("KIM", "JENNIE", 8, STR_TO_DATE('2013-06-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("MANOBAN", "LALISA", 6, STR_TO_DATE('2013-07-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("KIM", "JISOO", 2, STR_TO_DATE('2013-07-11', '%Y-%m-%d'));
insert into teachers (surname, name, subject_ID, hiredate)
	values("PARK", "CHAE YOUNG", 3, STR_TO_DATE('2013-07-11', '%Y-%m-%d'));

insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 1, 1, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 2, 1, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 3, 1, 12);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 4, 1, 12);

insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 5, 2, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 6, 2, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 7, 2, 12);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 8, 2, 12);

insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 9, 3, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 10, 3, 12);

insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 11, 4, 11);
insert into classes (no_students, max_students, hometeacher_ID, field_ID, year)
	values(0, 15, 4, 4, 12);



call enroll_student("Dobrev", "T", "Nina", "2870109850178",
 "Matematica-Informatica Bilingv-Engleza", 11);

call add_grade("Dobrev", "T", "Nina", "Mathematics", 8);
call add_grade("Dobrev", "T", "Nina", "Mathematics", 9);
call add_grade("Dobrev", "T", "Nina", "Informatics", 9);

call enroll_student("Weasley", "W", "Paul", "1870109890013",
	"Matematica-Informatica Bilingv-Engleza", 12);

call enroll_student("Hugh", "S", "Jules", "2850109130116", "Filologie Bilingv-Engleza", 11);
call enroll_student("Laich", "B", "Brooks", "1830104100001", "Filologie Bilingv-Engleza", 12);

call enroll_student("Gaga", "E", "Lady", "2900912100009", "Stiintele Naturii", 11);
call enroll_student("Jackson", "T", "Michael", "1700912100009", "Stiintele Naturii", 12);

call enroll_student("Cooper", "T", "Bradley", "2870109890178", "Stiinte Sociale", 11);
call enroll_student("McAddams", "T", "Rachel", "2840114890178", "Stiinte Sociale", 12);