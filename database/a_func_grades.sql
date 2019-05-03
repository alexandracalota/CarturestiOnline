delimiter //

create function get_grades(surname varchar(20), father_init varchar(1),
	name varchar(20), subject varchar(20)) returns varchar(70)
	NOT DETERMINISTIC READS SQL DATA
begin
	declare grade1, grade2, grade3, grade4 integer default 0;
	declare ret_value varchar(70);


	select grades.grade1, grades.grade2, grades.grade3, grades.grade4
	into grade1, grade2, grade3, grade4
	from grades, students, subjects
	where students.surname = surname and students.father_init = father_init and
	students.name = name and upper(subjects.subject_name) = upper(subject)
	and grades.subject_ID = subjects.subject_ID limit 1;

	select concat(upper(subject), CHAR(13), '|Grade1: ', grade1,
		'|Grade2: ', grade2, '|Grade3: ', grade3,
		'|Grade4: ', grade4) into ret_value;
	
	return ret_value;
end//

delimiter ;