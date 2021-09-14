use db_pizzaria_legal;

/**/
create database db_pizzaria_legal; 

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.*/

create table tb_categoria(
	id_categoria bigint(5) not null auto_increment primary key,
    tipo varchar(20) not null,
	tamanho char not null
);

/*Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos */
create table tb_pizza(
	id_pizza bigint(5) not null auto_increment primary key, 
    precoPizza int not null,
    ketchup boolean not null,
    praViagem boolean not null,
    
    id_CategoriaPizza bigint not null,
    foreign key (id_CategoriaPizza) references tb_categoria(id_categoria) 
)ENGINE=INNODB;

/*Popule esta tabela Categoria com até 5 dados.*/
insert into tb_categoria(tipo,tamanho) 
VALUES 
("muçarela",'G'),
("Calabre",'M'),
("frango e catupiry",'P'),
("Chocolate",'M'),
("Portuguesa",'G');

/*Popule esta tabela pizza com até 8 dados.*/
insert into tb_pizza(id_CategoriaPizza,precoPizza,ketchup,praViagem)
Values
(1,38.90,true,true),
(2,48.90,true,false),
(3,38.90,false,true),
(4,38.90,false,false),
(5,43.90,true,false),
(2,58.90,false,false),
(4,38.90,false,false),
(3,43.90,true,false);

/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.*/

Select precoPizza from tb_pizza where precoPizza  > 45.00;

/*Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.*/

Select precoPizza from tb_pizza where precoPizza between 29 and 60 ;

/*Faça um select  utilizando LIKE buscando os Produtos com a letra C.*/

Select * From tb_pizza inner join tb_categoria on tb_pizza.id_CategoriaPizza = tb_categoria.id_categoria where tb_categoria.tipo LIKE '%C%';

/*Faça um um select com Inner join entre  tabela categoria e pizza.*/

Select * from tb_pizza inner join tb_categoria on tb_pizza.id_CategoriaPizza = tb_categoria.id_categoria;

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).*/

Select * from tb_pizza inner join tb_categoria on tb_pizza.id_CategoriaPizza = tb_categoria.id_categoria where tb_pizza.id_CategoriaPizza = 3;