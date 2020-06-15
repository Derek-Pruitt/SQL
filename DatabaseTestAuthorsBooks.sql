create database readinISfun
use readinISfun
create table Authors (
	aID int  primary key not null identity(1,1),
	Aint varchar(2) unique not null,/* if not using primary key as references must be unique*/
	authorFname varchar(50)not null,
	authorLname varchar(50)not null,
	authorSex varchar(10)not null
);
insert into Authors (Aint, authorFname, authorLname, authorSex)
	values 
	('BW','Brent', 'Weeks', 'Male'),
	('JB','Jim', 'Butcher', 'Male'),
	('MP','Mary','Pearson','Female'),
	('SC','Susan','Collins','Female'),
	('JG','John','Grisham','Male');
select * from Authors

create table Books (
	aID int primary key not null identity(1,1),
	Aint varchar(2) constraint fk_AuthorsBooks foreign key  references Authors(Aint),/* must be the same value in the other tables*/
	Title varchar(50)not null,
	YearOut varchar(10)not null
);
insert into Books (Aint, Title, YearOut)
	values
	('sc','The hunger games','2008'),
	('sc','Catching fire','2009'),
	('sc','Mockingjay','2010'),
	('JG','The firm','1991'),
	('JG','The pelican brief','1992'),
	('JG','The client','1993'),
	('MP','The Heart Of Betrayal','2015'),
	('MP','The Beauty Of Darkness','2016'),
	('MP','The Kiss Of Deception','2014'),
	('BW','The way of shadows','2008'),
	('BW','Shadows edge','2008'),
	('BW','Beyond the shadows','2008'),
	('JB','Strom front','2000'),
	('JB ','Fool moon','2001'),
	('JB','Grave Peril','2001');

select Title, YearOut, authorLname, authorFname 
from Books
inner join Authors on Books.Aint=Authors.Aint