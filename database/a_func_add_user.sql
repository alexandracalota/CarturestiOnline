delimiter //

create procedure add_user(IN customer_name varchar(20), IN customer_surname varchar(20),
	IN email varchar(40), IN password varchar(20))
begin
	declare id integer default 0;
	declare type integer default 1;

	insert into customer (customer_name, customer_surname, email, password)
		values(customer_name, customer_surname, email, password);

	select customer_id into id
	from customer
	where upper(customer.email) = upper(email); 

	insert into cart (customer_id, status)
		values(id, "notfinal");
end//

delimiter ;