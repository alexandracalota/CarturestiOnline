delimiter //

create procedure add_grade(IN surname varchar(20), IN father_init varchar(1),
	IN name varchar(20), IN subject varchar(20), IN grade integer)
begin

	declare grade1, grade2, grade3, grade4 integer default 0;
	declare st_ID, sb_ID integer;

	select grades.grade1, grades.grade2, grades.grade3, grades.grade4
	into grade1, grade2, grade3, grade4
	from grades, students, subjects
	where students.surname = surname and students.father_init = father_init and
	students.name = name and upper(subjects.subject_name) = upper(subject)
	and grades.subject_ID = subjects.subject_ID limit 1;

	select student_ID into st_ID from students
	where students.surname = surname and students.father_init = father_init 
	and students.name = name;

	select subject_ID into sb_ID from subjects where subject_name = subject;

	if grade1 = 0 then
		update grades set grade1 = grade where student_ID = st_ID and subject_ID = sb_ID;
	elseif grade2 = 0 then
		update grades set grade2 = grade where student_ID = st_ID and subject_ID = sb_ID;
	elseif grade3 = 0 then
		update grades set grade3 = grade where student_ID = st_ID and subject_ID = sb_ID;
	elseif grade4 = 0 then
		update grades set grade4 = grade where student_ID = st_ID and subject_ID = sb_ID;
	end if;

	
end//

delimiter ;