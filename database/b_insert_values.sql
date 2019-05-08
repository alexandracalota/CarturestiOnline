insert into product_type (product_type_name) values("book");
insert into product_type (product_type_name) values("cd");
insert into product_type (product_type_name) values("pen");
insert into product_type (product_type_name) values("notebook");

call add_book("Harry Potter and The Philosopher's Stone", 50, 40,
	"First book in the Harry Potter series", "J.K. Rowling", 1997, "Fantasy");
call add_book("Harry Potter and The Chamber of Secrets", 50, 40,
	"Second book in the Harry Potter series", "J.K. Rowling", 1998, "Fantasy");
call add_book("Harry Potter and The Prisoner of Azkaban", 50, 40,
	"Third book in the Harry Potter series", "J.K. Rowling", 1999, "Fantasy");
call add_book("Harry Potter and The Goblet of Fire", 50, 40,
	"Fourth book in the Harry Potter series", "J.K. Rowling", 2000, "Fantasy");
call add_book("Harry Potter and The Order of the Pheonix", 50, 40,
	"Fifth book in the Harry Potter series", "J.K. Rowling", 2003, "Fantasy");
call add_book("Harry Potter and The Half Blood Prince", 50, 40,
	"Sixth book in the Harry Potter series", "J.K. Rowling", 2005, "Fantasy");
call add_book("Harry Potter and The Deathly Hallows", 50, 40,
	"Seventh book in the Harry Potter series", "J.K. Rowling", 2007, "Fantasy");

call add_cd("Youth", 20, 60, "One of the first albums by BTS", "BTS",
	2016, "Kpop");
call add_cd("Wings", 20, 20, "One of the first albums by BTS", "BTS",
	2016, "Kpop");
call add_cd("Love Yourself: Tear", 20, 50, "Last album by BTS", "BTS",
	2018, "Kpop");

call add_pen("Brush Pens", 70, 50, "Fabricolors Calligraphy Brush Pens", "Brush",
	10, "Fabricolors");
call add_pen("Gel Pens", 56, 50, "MUJI Style Gel Pens", "Gel",
	12, "MUJI");
call add_pen("Highlighters", 65, 50, "Zebra Midliner Double-Headed Highlighters", 
	"Highlighters", 5, "Zebra");

call add_notebook("Bright", 62, 70, "Bright Flowery Leather Planner", "Planner", 3);
call add_notebook("Vintage", 65, 70, "Vintage Flowery Leather Planner", "Planner", 3);
call add_notebook("Simple", 57, 70, "Simple spiral bound Notebook: Dotted",
	"Bullet Journal", 5);

call add_user("Jane", "Street", "jane.street@gmail.com", "strongpass");
call add_user("Tony", "Stark", "iron.man@gmail.com", "3thousand");
call add_user("Stella", "Willson", "stella.willson@gmail.com", "cistic");
