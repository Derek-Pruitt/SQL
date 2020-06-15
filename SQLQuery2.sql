

print 'hellow world'


declare @myvariable int
set @myvariable = 6
print @myvariable

declare @var1 int, @var2 int
set @var1 =4
set @var2 =5
print 'variable 1 = ' +convert(varchar(5),@var1) + char(13) + 'variable 2 = ' +convert(varchar(5),@var2) + char(13) + 'total: '
print @var1 + @var2

IF @var1 < 2
	BEGIN
	PRINT '@VAR1 1 < 2'
	END
else IF @var1 >1 AND @var1 < 3
	begin
	print '@VAR 1 > 1 AND @VAR1 <3'
	end
else IF @var1 = 4 OR @var1 <6
	begin
	print '@VAR1 = 4 OR @VAR1 <6'
	end
else
	begin
	print '@VAR1 DOES NOT QUALIFY!'
	end


/* this is a silent message */