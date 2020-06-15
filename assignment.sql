use db_zoo_Test
go 

select * from tbl_habitat

select species_name
from tbl_species
where species_order = 3

select nutrition_type
from tbl_nutrition
where nutrition_cost <= 600

select species_name
from tbl_species
where species_nutrition between 2202 and 2206

select * from tbl_nutrition
select * from tbl_species

select Species_Name as [Species Name], Nutrition_Type as [Nutrition Type]
	from tbl_species 
	inner join tbl_nutrition  on  nutrition_id =  species_nutrition


select specialist_contact, specialist_fname, specialist_lname, species_name
from tbl_specialist
	inner join tbl_care on care_specialist = specialist_id
	inner join tbl_species on species_care = care_id
	where species_name='penguin'
					
	
