use db_cidade_das_frutas;

/*Crie um banco de dados para um serviço de um açougue ou uma quitanda - Escolhida : Cidade*/
CREATE DATABASE db_cidade_das_frutas;

/*O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.*/

/*Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos */

create Table tb_categoria (
    id int Not null auto_increment Primary key,
    tipo Varchar(25) Not null,
    madura Boolean Not null
);

/*Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos */
Create Table tb_produto (
    id int Not null Auto_increment primary key,
    valor Decimal(4,2) Not null,
    nome Varchar(20) NOT NULL,
    estoque Int Not Null,
    id_categoria INT Not Null,

	/*FK*/
    Foreign key (id_categoria)
        references tb_categoria (id)
);

/*Popule esta tabela Categoria com até 5 dados.*/
INSERT INTO tb_categoria(tipo, madura) 
Values
("Legumes", false),
("Frutas", true),
("Frutas", true),
("Outros", false),
("Doces", false);
            
/*Popule esta tabela Produto com até 8 dados.*/
Insert into tb_produto(valor, nome, estoque, id_categoria)
Values
(3.50, "Alface", 40, 1),
(2.00, "Maça", 40, 2),
(5.60, "Melancia", 40, 2),
(8.50, "Sal", 40, 3),
(3.50, "Pé de moça", 40, 5),
(5.00, "Salgadinhos", 40, 4),
(1.70, "Coentro", 40, 1),
(20.50, "Lichia", 40, 2);
    
/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
Select * from tb_produto 
    Where valor > 50;

/*Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.*/
Select * from tb_produto 
    Where valor between 3 and 60;

/*Faça um select  utilizando LIKE buscando os Produtos com a letra C.*/
Select * from tb_produto 
    Where nome like "%C%";

/*Faça um um select com Inner join entre  tabela categoria e produto.*/    
Select * from tb_produto 
    Inner join tb_categoria 
        on tb_produto.id_categoria = tb_categoria.id;


/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são aves ou legumes).*/
Select * From tb_produto 
    Inner Join tb_categoria 
        on tb_produto.id_categoria = tb_categoria.id
            Where tb_produto.id_categoria = 3;
    