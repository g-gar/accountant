create table USERS(
	id int identity primary key,
	username varchar(255) not null unique,
	password varchar(255) not null,
	email varchar(255) not null unique
);

create table ACCOUNTS(
	id int identity primary key,
	iban varchar(34) not null unique,
	balance double(20,2) not null default 0.0,
	name varchar(255) not null 
);

create table TRANSACTIONS(
	id int identity primary key,
	ts datetime default GETDATE(),
	amount double(20,2) not null
);

-- OPTIONAL

create table DEPOSITS(
	id int identity primary key,
	id int not null unique references TRANSACTIONS(id)
);

create table TRANSFERS(
	id int identity primary key,
	id int not null unique references TRANSACTIONS(id),
	type int not null,
	description varchar(255) default "",
	orientation int not null,
	other_account_id int not null references ACCOUNTS(id)
);

create table PAYCHECKS(
	id int identity primary key,
	id int not null unique references TRANSACTIONS(id),
	company varchar(255) not null
);

create table BILLS(
	id int identity primary key,
	id int not null unique references TRANSACTIONS(id),
	stablishment varchar(255) not null,
);

CREATE TABLE ITEMS(
	id int identity primary key,
	name varchar(255) not null,
	description varchar(255) null,
	cost double(20,10) not null,
	type int not null,
	iva_percentage double(5,2) not null
);