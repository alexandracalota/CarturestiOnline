create table customer (
	customer_id 		integer auto_increment primary key,
	customer_name 		varchar(20),
	customer_surname 	varchar(20),
	email 				varchar(20),
	password 			varchar(20),
	phone_number 		varchar(20),
	address_line_1 		varchar(20),
	address_line_2 		varchar(20),
	city 				varchar(20),
	country 			varchar(20)
);

create table product_type (
	product_type_code 	integer auto_increment primary key,
	parent_type_code	integer,
	product_type_name	varchar(20),
	description			varchar(200)
);

create table product (
	product_id 			integer auto_increment primary key,
	product_type_code 	integer,
	product_name		varchar(20),
	price				integer,
	items				integer,
	description			varchar(200),
	FOREIGN KEY (product_type_code) REFERENCES product_type(product_type_code)
);

create table cart (
	cart_id				integer auto_increment primary key,
	customer_id			integer,
	status				varchar(20),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table cart_item (
	cart_id				integer,
	customer_id			integer,
	number_of_items		integer,
	total_price			integer,
	PRIMARY KEY (cart_id, customer_id),
	FOREIGN KEY (cart_id) REFERENCES cart(cart_id),	
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

create table book (
	product_id			integer,
	product_type_code	integer,
	author				varchar(40),
	year				integer,
	genre				varchar(20),
	PRIMARY KEY (product_id, product_type_code),
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (product_type_code) REFERENCES product_type(product_type_code)
);

create table cd (
	product_id			integer,
	product_type_code	integer,
	artist				varchar(40),
	year				integer,
	genre				varchar(20),
	PRIMARY KEY (product_id, product_type_code),
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (product_type_code) REFERENCES product_type(product_type_code)
);

create table notebook (
	product_id			integer,
	product_type_code	integer,
	type				varchar(40),
	size				integer,
	PRIMARY KEY (product_id, product_type_code),
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (product_type_code) REFERENCES product_type(product_type_code)
);

create table pen (
	product_id			integer,
	product_type_code	integer,
	type				varchar(40),
	number_of_pens		integer,
	manufacturer		varchar(20),
	PRIMARY KEY (product_id, product_type_code),
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (product_type_code) REFERENCES product_type(product_type_code)
);