use AdventureWorks2017
go
create proc dbo.uspGetAddress4 @cityName nvarchar(30) output
as
select city from person.Address
where AddressID=38 and PostalCode=48226
go
declare @cityName nvarchar(30)
exec dbo.uspGetAddress4 @cityName = @cityName output
print @cityName

select distinct city from Person.Address;--selecting citys that are difrent.

select top 20* from Person.Address;--selecting all col up to first 20 rows.

select MIN(PasswordHash) as Minamalpassword --selecting the smallest password length in existance.
from Person.Password;

select MAX(PasswordHash) as Maxiumpassword--selecting maxium password length in existance.
from Person.Password;

select EmailAddress--selecting all emails that start with r using like.
from Person.EmailAddress
where EmailAddress like 'R%';

select EmailAddress--selecting all emails that start with a through f using like.
from Person.EmailAddress
where EmailAddress like '[a-f]%';

select * from Person.EmailAddress--selecting all email address by ID from 20 to 40 using between.
where EmailAddressID between 20 and 40;

--creating a school database.
create database School
go
use School;
go

create table Classes (
	Class_ID int primary key identity (1,1) not null,
	Class_Name varchar(30) not null
);

select * from Classes;

create table Instructors (
	Instructor_ID int primary key identity (20,1) not null,
	Instructor_name varchar(50) not null
);

select * from Instructors;

create table Students (
	Student_ID int primary key identity (30,1) not null,
	Student_Name varchar(50) not null,
	Class_ID int foreign key references Classes(Class_ID),
	Instructor_ID int foreign key references Instructors(Instructor_ID)
);

select * from Students;

insert into Classes(Class_Name)
	values
	('Software Developer Boot Camp'),
	('C# Boot Camp');
select * from Classes;

insert into Students(Student_Name, Class_ID)
	values
	('Jamie Waters','1'),
	('Roman Pierce','1'),
	('Kathy Bates','1'),
	('Namoi Milton','2'),
	('Patricia Johnston','2'),
	('Lee O''Coner','2');
select * from Students;

insert into Instructors(Instructor_name)
	values
	('Alaxander Maxuimis'),
	('James Holden');
select * from Instructors;
select * from Classes;
select * from Students;

update Students
set Instructor_ID = 20
where Class_ID=1;

update Students
set Instructor_ID = 21
where Class_ID =2;
select * from Students;

select Instructor_Name from Instructors;

select Student_Name from Students order by Student_Name asc;

select Students.Student_Name, Classes.Class_Name, Instructors.Instructor_name
from Students
inner join Classes on Students.Class_ID=Classes.Class_ID
inner join Instructors on Students.Instructor_ID=Instructors.Instructor_ID;


--Library management system.
create database Library_Management_System
go
use Library_Management_System
go
create table LIBRARY_BRANCH (
	BranchID int primary key not null identity (1,1),
	BranchName Varchar(50) not null,
	Address varchar(50) NOT NULL
);
SELECT * FROM LIBRARY_BRANCH;
CREATE TABLE BORROWER (
	CardNo int primary key identity(1,1) not null,
	Name varchar(25) not null,
	Address varchar(50) not null,
	Phone varchar(10) not null                                   --need to fix so it shows whole number.
);
select * from BORROWER;
create table BOOKS (
	BookID int primary key not null identity(1000,1),
	Title varchar(50) not null,
	PublisherName varchar(50) foreign key references PUBLISHER(PublisherName)
);
select * from BOOKS;
create table PUBLISHER (
	PublisherName varchar(50) primary key not null,
	Address varchar(50) not null,
	Phone varchar(20) not null								--need to fix so it shows whole number.
);
select * from PUBLISHER;
create table BOOK_LOANS (
	BookID int foreign key references BOOKS(BookID),
	BranchID int foreign key references LIBRARY_BRANCH(BranchID),
	CardNo int foreign key references BORROWER(CardNo),
	DateOut date default Getdate() not null,
	DateDue varchar(20) not null
);
select * from BOOK_LOANS;
create table BOOK_COPIES (
	BookID int foreign key references BOOKS(BookID),
	BranchID int foreign key references LIBRARY_BRANCH(BranchID),
	Number_Of_Copies int not null
);
select * from BOOK_COPIES;
create table BOOK_AUTHORS (
	BookID int foreign key references BOOKS(BookID),
	AuthorName varchar(50) NOT NULL
);
SELECT * FROM BOOK_AUTHORS;select * from BOOKS;
select * from BOOK_COPIES;
select * from BOOK_LOANS;
select * from PUBLISHER;
select * from BOOKS;
select * from BORROWER;
SELECT * FROM LIBRARY_BRANCH;

INSERT INTO LIBRARY_BRANCH(BranchName, Address)
	values
	('Sharpstown','123 main st'),
	('Learning','124 huckablery'),
	('OldWest','1212 HighNoon'),
	('Mc''Neals','4516 Scottsdale'),
	('Tabbys','9090 Purrrfect lane'),
	('Valley','5638 belmont ave');
insert into BORROWER( Name, Address, Phone)
	values
	('Derek Justin','1233 Mc''cue', '3073435650'),
	('Johnathan Finnagenn','1234 Mc''cue', '3073435651'),
	('Justin Finnagenn','1235 Mc''cue', '3073435652'),
	('Cecillia Kiggans','1236 Mc''cue', '3073435653'),
	('Kimberly Johnston','1237 Mc''cue', '3073435654'),
	('Robert Johnston','1238 Mc''cue', '3073435655'),
	('Patricia Winchester','1239 Mc''cue', '3073435656'),
	('Clay Dawson','1240 Mc''cue', '3073435657');
insert into PUBLISHER(PublisherName,Address,Phone)
	Values
	('Value Books','2989 lane','5214654468'),
	('Ready Set...','2222 lane','5214651122'),
	('Index RX','2333 lane','5214651199'),
	('RenDincky','2340 lane','5214654090'),
	('Saranelly','2341 lane','5214650000'),
	('Brookrasin','2342 lane','5214650001'),
	('Brock Bradly','2343 lane','5214651001'),
	('Josphivehill','2344 lane','5214654444'),
	('Markspank','2345 lane','5294654455'),
	('Star Bright','2346 lane','5214654777');
insert into BOOKS(Title,PublisherName)
	values
	('The Lost Tribe','Value Books'),
	('Harry Potter and the Sorcerer''s Stone','Ready Set...'),
	('Pride and Prejudice','Index RX'),
	('To Kill a Mockingbird','Index RX'),
	('1984','Index RX'),
	('The Lord of the Rings','Value Books'),
	('ULYSSES','Ready Set...'),
	('THE GREAT GATSBY','Brookrasin'),
	('A PORTRAIT OF THE ARTIST AS A YOUNG MAN','Saranelly'),
	('LOLITA','Saranelly'),
	('BRAVE NEW WORLD','RenDincky'),
	('THE SOUND AND THE FURY','Brock Bradly'),
	('All the light she couldnt see','Josphivehill'),
	('CATCH-22','Brock Bradly'),
	('DARKNESS AT NOON','Brock Bradly'),
	('THE HEART IS A LONELY HUNTER','Star Bright'),
	('TO THE LIGHTHOUSE','Markspank'),
	('AN AMERICAN TRAGEDY','Josphivehill'),
	('INVISIBLE MAN','Value Books'),
	('LORD OF THE FLIES','RenDincky');
insert into BOOK_AUTHORS(BookID,AuthorName)
	values
	(1000,'James Holden'),
	(1010,'Sally Smith'),
	(1009,'Cecillia Hackett'),
	(1019,'James Holden'),
	(1005,'James Dean'),
	(1008,'Hally Bartholamew'),
	(1001,'Mewoo Purrty'),
	(1015,'James Holden'),
	(1013,'Gimmy Jones'),
	(1002,'Sally Smith');
insert into BOOK_COPIES(BookID,Number_Of_Copies,BranchID)
	values
	(1000 ,16 ,1),
	(1001 ,3 , 10),
	(1002 ,15 ,10),
	(1003 ,6 , 9),
	(1004 ,2 , 9),
	(1005 ,2 , 3),
	(1006 ,2 , 4),
	(1007 ,5 , 5),
	(1008 ,4 , 6),
	(1009 ,3 , 6),
	(1010 ,10 ,6 ),
	(1011 ,8 , 5),
	(1012 ,5, 4),
	(1013 ,5 ,9 ),
	(1014 ,6 ,3 ),
	(1015 ,4 ,7 ),
	(1016 ,10 ,5 ),
	(1017 ,2 ,4 ),
	(1018 ,4, 8),
	(1019 ,5 ,7 );
select * from BOOK_LOANS;select * from BORROWER;

insert into BOOK_LOANS(BookID,BranchID,CardNo,DateDue)
	values
	(1000,1,6,'06/23/20'),
	(1019,2,3,'06/23/20'),
	(1018,3,5,'06/30/20'),
	(1014,3,4,'08/01/20'),
	(1017,4,10,'06/16/20'),
	(1016,5,9,'06/22/20'),
	(1016,5,8,'06/22/20'),
	(1014,3,7,'08/01/20'),
	(1000,1,5,'07/01/20'),
	(1017,4,5,'06/16/20');
select * from BOOK_LOANS
full outer join BORROWER on BOOK_LOANS.CardNo=BORROWER.CardNo
full outer join BOOKS on BOOK_LOANS.BookID=BOOKS.BookID;


--query that returns all book titles and the authors name.
select BOOK_AUTHORS.AuthorName, BOOKS.Title 
from BOOK_AUTHORS
inner join BOOKS on BOOKS.BookID=  BOOK_AUTHORS.BookID;


--part four.
create procedure spBookN_Number_borrower
as
begin
select BOOK_COPIES.Number_Of_Copies, BOOKS.Title, LIBRARY_BRANCH.BranchName
from BOOK_COPIES
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.BranchID=BOOK_COPIES.BranchID
inner join BOOKS on BOOKS.BookID=BOOK_COPIES.BookID
select BORROWER.Name, BOOK_LOANS.DateDue
from BOOK_LOANS
inner join BORROWER on BORROWER.CardNo=BOOK_LOANS.CardNo
where DateDue = null
end
exec [dbo].[spBookN_Number_borrower]