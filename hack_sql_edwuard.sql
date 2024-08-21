-------------------------------------------- HACK 3 -----------------------------------------
-- table countries
CREATE TABLE countries(
  id_country serial primary key,
  name varchar(50) not null  
);

CREATE TABLE priorities (
  id_priority serial primary key,
  type_name varchar(25) not null
);

CREATE TABLE contact_request (
  id_email integer primary key,
  id_country integer references countries,
  id_priority integer references priorities,
  name varchar(45) not null,
  detail varchar(100),
  physical_address text
);

-------------------------------------------- HACK 4 -----------------------------------------
-- insert 5 record in countries
  INSERT into countries (name) values ('Brasil'),('Rep. Dominicana'),('Perú'),('Uruguay'),('Venezuela');

-- insert 3 record in priorities
  INSERT into priorities (type_name) values ('Alta'),('Cero'),('Baja');

-- insert 3 record in contact_request
  INSERT into contact_request (id_email,id_country,id_priority,name,physical_address) values 
  (1,1,2,'Abogado','Urb. lomas del Avila'),
  (2,12,3,'Padre','Urb. Terrazas'),
  (3,10,1,'Jefe','Av. los mangos sector 4');

✔delete;
-- delete last user:
  DELETE FROM users WHERE id_users = (SELECT MAX(id_userS) FROM users);

✔update:
-- update first user:
  UPDATE users SET id_country=13, email='EDWUARD@GMAIL.COM', NAME='Edwuard Castañeda' WHERE id_users = (SELECT MIN(id_users) FROM users)

-------------------------------------------- HACK 5 -----------------------------------------
tables:
-- table countries
CREATE TABLE countries(
  id_country serial primary key,
  name varchar(50) not null  
);

	
-- table roles
CREATE TABLE roles (
  id_role serial primary key,
  name varchar(25) not null  
);

-- table taxes
CREATE TABLE taxes (
  id_tax serial primary key,
  percentage decimal not null  
);


-- table offers
CREATE TABLE offers (
  id_offer serial primary key,
  status integer not null  
);

-- table discounts
CREATE TABLE discounts (
  id_discount serial primary key,
  status integer not null,
  percentage decimal not null    
);


-- table payments
CREATE TABLE payments (
  id_payment serial primary key,
  type varchar(45) not null
);

-- table customers
CREATE TABLE customers (
  email varchar(50) primary key,
  id_country integer references countries,
  id_role integer references roles,
  name varchar(45) not null,
  age integer not null,
  password varchar(64) not null,
  physical_address text
);

-- table invoice_status
CREATE TABLE invoice_status (
  id_invoice_status serial primary key,
  status varchar(45) not null
);

-- table products
CREATE TABLE products (
  id_product serial primary key,
  id_discount integer references discounts,
  id_offer integer references offers,
  id_tax integer references taxes,
  name varchar(50) not null,
  details varchar(100) not null,
  minimum_stock integer not null,
  maximum_stock integer not null,
  current_stock integer not null,
  price decimal not null,
  price_with_tax decimal not null
);

-- table product_customers
CREATE TABLE product_customers (
  id_product integer references products,
  id_customer varchar(50) references customers
);


-- table invoices
CREATE TABLE invoices (
  id_invoice serial primary key,
  id_customer varchar(50) references customers,
  id_payment integer references payments,
  id_invoice_status integer references invoice_status,
  date_inv date not null,
  total_to_pay decimal not null
);

-- table orders
CREATE TABLE orders (
  id_order serial primary key,
  id_invoice integer references invoices,
  id_product integer references products,
  details varchar(100),
  amount integer not null, 
  price decimal not null
);

 --------------- HACK 6 ---------------------------
✔insert:
-- insert 3 record in all tables
	INSERT INTO countries (name) VALUES ('Argentina'),('Chile'),('Venezuela');
	INSERT INTO roles (name) VALUES ('Admin'),('Analista'),('Supervisor');
	INSERT INTO taxes (percentage) VALUES (100.00),(75.20),(40.50);
	INSERT INTO offers (status) VALUES (1),(2),(3);
	INSERT INTO discounts (status,percentage) VALUES (1,10.15),(2,10.2),(2,20.6);
	INSERT INTO payments (type) VALUES ('Cash'),('Card'),('Bitcoint');
	INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES 
	('edwuard@gmail.com',1,10,'Edwuard','47','123Abc','Lomas del Avila'),
	('kmarquez@hotmail.com',1,11,'Keibis','30','Zxw46562','El paraiso'),
	('agomez@yahoo.com',2,12,'Ana','18','Cashio2019','La california');
	INSERT INTO invoice_status (status) VALUES ('Pendiente'),('En via'),('Entregado');
	INSERT INTO products (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) VALUES 
	(11,10,11,'Jabón','25Kg con suavizante',10,25,15,10.98,15.98),
	(12,10,12,'Arroz','10Kg, blanco, granos completos',20,55,40,4.50,7.99),	
	(11,12,10,'Vitaminas','10 Cajas de 25 unidades',5,15,11,1.99,3.50);
	INSERT INTO product_customers (id_product, id_customer) VALUES (19,'edwuard@gmail.com'),(19,'agomez@yahoo.com'),(21,'kmarquez@hotmail.com');
	INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date_inv, total_to_pay) VALUES 
	('edwuard@gmail.com',11,21,now(),25.50),
	('edwuard@gmail.com',12,19,'2024-08-21',10.20),
	('kmarquez@hotmail.com',10,20,'2024-08-20',11.45);
	INSERT INTO orders (id_invoice, id_product, details, amount, price) VALUES 
	(19,20,'Entregar en domicilio',10,25.50),
	(21,21,'Entregar en domicilio luego de las 5pm',12,85.50),
	(20,19,'Recibirá un familiar',11,35.75); 

✔delete:
-- delete last first user:
	DELETE FROM users WHERE id_users = (SELECT MAX(id_userS) FROM users);
	DELETE FROM users WHERE id_users = (SELECT MIN(id_userS) FROM users);

   ✔update:
-- update last user:
	UPDATE users SET id_country=11, email='EMMASUC@GMAIL.COM', NAME='Emmanuel Sucre' WHERE id_users = (SELECT MAX(id_users) FROM users)	

-- update all taxes:
	UPDATE taxes set percentage = percentage+(percentage*0.10);

-- update all prices
	UPDATE products set price = price+(price*0.15);
    
