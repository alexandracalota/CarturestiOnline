create table fields (
	field_ID integer auto_increment primary key,
	field_name varchar(40) unique not null,
	max_students integer
);

create table subjects (
	subject_ID integer auto_increment primary key,
	subject_name varchar(20) 
);

create table subjects_fields (
	subject_ID varchar(20),
	field_ID integer,
	hours integer
);

create table teachers (
	prof_ID integer auto_increment primary key,
	surname varchar(20),
	name varchar(20),
	subject_ID integer not null,
	hiredate date,
	FOREIGN KEY (subject_ID) REFERENCES subjects(subject_ID)
);

create table classes (
	class_ID integer auto_increment primary key,
	no_students integer,
	max_students integer,
	hometeacher_ID integer,
	field_ID integer,
	year integer,
	FOREIGN KEY (field_ID) REFERENCES fields(field_ID),
	FOREIGN KEY (hometeacher_ID) REFERENCES teachers(prof_ID)
);

create table students (
	student_ID integer primary key auto_increment,
	surname varchar(20) not null,
	father_init varchar(1) not null,
	name varchar(20) not null,
	CNP varchar(20) unique,
	class_ID integer,
	FOREIGN KEY (class_ID) REFERENCES classes(class_ID)
);

create table grades (
	student_ID integer not null,
	subject_ID integer not null,
	grade1 integer DEFAULT 0,
	grade2 integer DEFAULT 0,
	grade3 integer DEFAULT 0,
	grade4 integer DEFAULT 0,
	FOREIGN KEY (subject_ID) REFERENCES subjects(subject_ID),
	FOREIGN KEY (student_ID) REFERENCES students(student_ID)
);
