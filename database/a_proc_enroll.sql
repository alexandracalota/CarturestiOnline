delimiter //

create procedure enroll_student(IN surname varchar(20), IN father_init varchar(1),
	IN name varchar(20), IN CNP varchar(20), IN field varchar(40), IN year integer)
begin

	declare v_finished integer default 0;
	declare class integer default 0;

	declare class_aux, n_stud, m_stud integer;

	declare class_cursor cursor for
	select a.class_ID, a.no_students, a.max_students from classes a, fields b
	where a.year = year and a.field_ID = b.field_ID and upper(b.field_name) = upper(field);

	declare continue handler for not found
	set v_finished = 1;

	open class_cursor;

	get_class: loop

		fetch class_cursor into class_aux, n_stud, m_stud;

		if v_finished = 1 then 
			leave get_class;
		end if;

		if n_stud < m_stud then
			insert into students (surname, father_init, name, CNP, class_ID)
				values(surname, father_init, name, CNP, 1);
			leave get_class;
		end if;

	end loop get_class;

	close class_cursor;

end//

delimiter ;
