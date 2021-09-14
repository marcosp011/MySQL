use db_construindo_a_nossa_vida;

/*Crie um banco de dados para um serviço de uma loja de produtos de construção*/
Create Database db_construindo_a_nossa_vida;

/*O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.*/

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos */
Create Table tb_categoria(
    id Int Not Null auto_increment Primary Key,
    tipo Varchar(25) Not Null,
    peso Varchar(25) Not Null
);

/*Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos */
CREATE TABLE tb_produto (
    id Int Not Null AUTO_INCREMENT,
    valor Decimal(5,2) Not Null,
    nome Varchar(20) Not Null,
    estoque Int Not Null,
    id_categoria Int Not Null,
    Primary Key (id),
    
    /*FK*/
    foreign Key (id_categoria)
        references tb_categoria (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
Insert Into tb_categoria(tipo, peso) 
VALUES 
("Ferramentas", "Médio"),
("Construção", "Médio/Pesado"),
("Hidraulica", "Leve/Médio");

/*Popule esta tabela Produto com até 8 dados.*/
Insert Into tb_produto(valor, nome, estoque, id_categoria)
VALUES 
(10.00, "Tês", 50, 1),
(18.00, "Luvas", 50, 1),
(32.00, "Marreta", 50, 2),
(28.00, "Martelo", 50, 2),
(124.00, "Massa Pronta", 50, 3);



/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
Select * from tb_produto 
    Where valor > 50;

/*Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.*/
Select * from tb_produto 
    Where valor between 3 and 60;

/*Faça um select  utilizando LIKE buscando os Produtos com a letra C.*/
Select * from tb_produto 
    Where nome Like "%c%";
    
/*Faça um select  utilizando LIKE buscando os Produtos com a letra C.*/
Select * from tb_produto 
    Inner Join tb_categoria 
        ON tb_produto.id_categoria = tb_categoria.id;
        
/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria hidráulica).*/
Select * from tb_produto 
    Inner Join tb_categoria 
        On tb_produto.id_categoria = tb_categoria.id
            Where tb_produto.id_categoria = 1;