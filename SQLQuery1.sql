
create procedure createZooDB
as
begin
	create table tbl_animalia (
		animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		animalia_type varchar(50) NOT NULL
	);

	insert into tbl_animalia
		(animalia_type)
		values
		('vertebrate'),
		('invertebrate')
	;

	create table tbl_class (
		class_id int primary key not null identity (100,1),
		class_type varchar(50) not null
	);
	insert into tbl_class
		(class_type)
		values
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('enchinoderm')
	;


	select REPLACE(class_type, 'birds', 'bird') from tbl_class;

	select count(class_type) from tbl_class where class_type = 'bird';

	create table tbl_order (
		order_id int primary key not null identity (1,1),
		order_type varchar(50)not null
	);
	create table tbl_care (
		care_id varchar(50) primary key not null,
		care_type varchar(50)not null,
		care_specialist int not null
	);
	create table tbl_nutrition (
		nutrition_id int primary key not null identity (2200,1),
		nutrition_type varchar(50) not null,
		nutrition_cost money not null
	);
	create table tbl_habitat (
		habitat_id int primary key not null identity (5000,1),
		habitat_type varchar(50)not null,
		habitat_cost money not null
	);

	create table tbl_specialist (
		specialist_id int primary key not null identity (1,1),
		specialist_fname varchar(50)not null,
		specialist_lname varchar(50)not null,
		specialist_contact varchar(50)not null
	);

	insert into tbl_order
		(order_type)
		values
		('carvivore'),
		('herbivore'),
		('omnivore')
	;
	select * from tbl_order;

	insert into tbl_care
		(care_id,care_type,care_specialist)
		values
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitimans', 1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)
	;
	select * from tbl_care;

	insert into tbl_nutrition
		(nutrition_type, nutrition_cost)
		values
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syring feed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;
	select *from tbl_nutrition;

	insert into tbl_habitat
		(habitat_type, habitat_cost)
		values
		('tundra', 40000),
		('grassy gnol with trees', 12000),
		('10 ft pound with rocks', 30000),
		('icy aquirium with snowy facade', 50000),
		('short grass, shade, and moat', 50000),
		('netted forest atrium', 10000),
		('jungle vines and winding branches', 15000),
		('cliff with shaded cave', 15000)
	;
	select *from tbl_habitat;

	insert into tbl_specialist
		(specialist_fname, specialist_lname, specialist_contact)
		values
		('margret', 'nyguen', '384-576-2899'),
		('mary', 'fisher', '307-356-9876'),
		('arnold', 'holden', '385-475-4855'),
		('kem', 'byesan', '384-485-4855'),
		('delm onte', 'fyedo', '768-288-3749')
	;
	
	select * from tbl_specialist;
	create table tbl_species (
		species_id int primary key not null identity (1,1),
		species_name varchar(50)not null,
		species_animalia int not null constraint fk_animalia_id foreign key references tbl_animalia(animalia_id) on update cascade on delete cascade,
		species_class int not null constraint fk_class_id foreign key references tbl_class(class_id) on update cascade on delete cascade,
		species_order int not null constraint fk_order_id foreign key references tbl_order(order_id) on update cascade on delete cascade,
		species_habitat int not null constraint fk_habitat_id foreign key references tbl_habitat(habitat_id) on update cascade on delete cascade,
		species_nutrition int not null constraint fk_nutrition_id foreign key references tbl_nutrition(nutrition_id) on update cascade on delete cascade,
		species_care varchar(50) not null constraint fk_care_id foreign key references tbl_care(care_id) on update cascade on delete cascade
	);
	insert into tbl_species
		(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
		values
		('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
		('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
		('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
		('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
		('panda', 1, 102, 3, 5006, 2202, 'care_4'),
		('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
		('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
	; 
	select * from tbl_species;

	select* from tbl_species where species_name = 'chicken';

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
	select
		a1.species_name, a2.habitat_type, a2.habitat_cost,
		a3.nutrition_type, a3.nutrition_cost
		from tbl_species a1
		inner join tbl_habitat a2 on a2.habitat_id = a1.species_habitat
		inner join tbl_nutrition a3 on a3.nutrition_id = a1.species_nutrition
		where species_name = 'ghost bat'
	;
	select * from tbl_nutrition
	select * from tbl_species

	select * from tbl_nutrition
	inner join tbl_species on tbl_species.species_nutrition = tbl_nutrition.nutrition_id
	;
end