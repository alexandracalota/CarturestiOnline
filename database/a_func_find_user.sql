delimiter //

create function find_user(email varchar(40)) returns varchar(20)
	NOT DETERMINISTIC READS SQL DATA
begin
	declare pasw varchar(20) default "";

	select password into pasw
	from customer
	where customer.email = email;

	return pasw;
end//

delimiter ;