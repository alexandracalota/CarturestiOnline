delimiter //

create trigger enrollTrigger after insert on students
for each row
begin
	declare subject integer;
	declare v_finished integer default 0;

	declare subject_cursor cursor for
	select a.subject_ID from subjects_fields a, classes c
	where a.field_ID = c.field_ID and new.class_ID = c.class_ID;

	declare continue handler for not found
	set v_finished = 1;

	update classes set no_students = no_students + 1 where class_ID = new.class_ID;

	open subject_cursor;

	insert_grade: loop

		fetch subject_cursor into subject;
		if v_finished = 1 then 
			leave insert_grade;
		end if;

		insert into grades (student_ID, subject_ID) values(new.student_ID, subject);

	end loop insert_grade;
	
end//