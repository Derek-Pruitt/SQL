use db_zoo_Test
go

declare @animalName varchar(50)
declare @errorString varchar(100)
declare @results varchar(5)

set @animalName = 'jaguar'
set @errorString = 'There is no ' +@animalName+'''s found at this zoo.'

begin try
	set @results = (select count(tbl_species.species_name) from tbl_species where species_name = @animalName)
		if @results = 0
			begin
			/*logic to follow if condition is true*/
				raiserror(@errorString, 16, 1)
				return
			end
		else if @results = 1
			begin
				select
				a1.species_name, a2.animalia_type,
				a3.class_type, a4.order_type,
				a5.habitat_type, a6.nutrition_type, a7.care_type
				from tbl_species a1
				inner join tbl_animalia a2 on a2. animalia_id = a1. species_animalia
				inner join tbl_class a3 on a3. class_id = a1. species_class
				inner join tbl_order a4 on a4. order_id = a1. species_order
				inner join tbl_habitat a5 on a5. habitat_id = a1 .species_habitat
				inner join tbl_nutrition a6 on a6. nutrition_id = a1. species_nutrition
				inner join tbl_care a7 on a7. care_id = a1. species_care
				where a1.species_name = @animalName 
			;
			end
end try

begin catch
	/*some logic to follow if any errors occur*/
	select @errorString = ERROR_MESSAGE()
	raiserror (@errorString, 10, 1)
end catch