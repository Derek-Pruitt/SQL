
create proc getANIMAL_INFO

@animalName varchar(50)
as	
begin	
	select
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		from tbl_species a1
		inner join tbl_animalia a2 on a2. animalia_id = a1. species_animalia
		inner join tbl_class a3 on a3. class_id = a1. species_class
		inner join tbl_order a4 on a4. order_id = a1. species_order
		inner join tbl_habitat a5 on a5. habitat_id = a1 .species_habitat
		inner join tbl_nutrition a6 on a6. nutrition_id = a1. species_nutrition
		inner join tbl_care a7 on a7. care_id = a1. species_care
		where species_name = 'ghost bat' 
	;
end