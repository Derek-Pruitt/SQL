use db_zoo_Test
go

/*convert (varchar(5),@totalHab) = this is converting the data type from money to string characters
*char(9) = line break
*char(13) = tab key
*/
declare @totalHab money;
declare @totalNut money
declare @results money;
set @totalHab = (select sum(habitat_cost) from tbl_habitat);
set @totalNut = (select sum(nutrition_cost) from tbl_nutrition);
set @results = (@totalHab + @totalNut)
print (
	convert(varchar(50),@totalHab) + char(9) + ' -the total habitat cost' + char(13) +
	convert(varchar(50),@totalNut) + char(9) + char(9) + ' -the total nutrition cost ' + char(13) + '-----------' + char(13) +
	convert(varchar(50),@results)
);