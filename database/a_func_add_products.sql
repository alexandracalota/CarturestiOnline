delimiter //

create procedure add_book(IN product_name varchar(200), IN price integer,
	IN items integer, IN description varchar(200), IN author varchar(40),
	IN year integer, IN genre varchar(20))
begin
	declare id integer default 0;
	declare type integer default 1;

	insert into product (product_type_code, product_name, price, items, description)
		values(type, product_name, price, items, description);

	select product_id into id
	from product
	where upper(product.product_name) = upper(product_name); 

	insert into book (product_id, product_type_code, author, year, genre)
		values(id, type, author, year, genre);
end//

create procedure add_cd(IN product_name varchar(200), IN price integer,
	IN items integer, IN description varchar(200), IN artist varchar(40),
	IN year integer, IN genre varchar(20))
begin
	declare id integer default 0;
	declare type integer default 2;

	insert into product (product_type_code, product_name, price, items, description)
		values(type, product_name, price, items, description);

	select product_id into id
	from product
	where upper(product.product_name) = upper(product_name);

	insert into cd (product_id, product_type_code, artist, year, genre)
		values(id, type, artist, year, genre);
end//

create procedure add_pen(IN product_name varchar(200), IN items integer,
	IN price integer, IN description varchar(200), IN type varchar(40),
	IN number_of_pens integer, IN manufacturer varchar(20))
begin
	declare id integer default 0;
	declare p_type integer default 3;

	insert into product (product_type_code, product_name, price, items, description)
		values(p_type, product_name, price, items, description);

	select product_id into id
	from product
	where upper(product.product_name) = upper(product_name);

	insert into pen (product_id, product_type_code, type, number_of_pens, manufacturer)
		values(id, p_type, type, number_of_pens, manufacturer);
end//

create procedure add_notebook(IN product_name varchar(200), IN items integer,
	IN price integer, IN description varchar(200), IN type varchar(40),
	IN size integer)
begin
	declare id integer default 0;
	declare p_type integer default 4;

	insert into product (product_type_code, product_name, price, items, description)
		values(p_type, product_name, price, items, description);

	select product_id into id
	from product
	where upper(product.product_name) = upper(product_name);

	insert into notebook (product_id, product_type_code, type, size)
		values(id, p_type, type, size);
end//

create procedure update_product(IN product_ID integer, IN add_items integer)
begin	
	update product set items = items + add_items where product.product_id = product_ID;

end//


delimiter ;