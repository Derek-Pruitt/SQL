create schema [ACADEMY_HR] authorization [dbo]

drop schema if exists [ACADEMY_HR]

--begin try and begin catch.
begin try
	select 1000/0 as result;
end try

begin catch
	select
		ERROR_NUMBER() as [error_code],
		ERROR_PROCEDURE() as [invalid_proc],
		ERROR_MESSAGE() as [error_details];
end catch

--stored proc
use AdventureWorks2017
go
create proc dbo.uspGetAddress2 @city nvarchar(30)
as
select * from person.Address
where city like @city + '%'
go

exec dbo.uspGetAddress2 @city = 'new'