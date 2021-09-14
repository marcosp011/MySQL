Use db_farmacia_do_bem;

/*Crie um banco de dados para um serviço de farmácia */
Create Database db_farmacia_do_bem;


/*O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.*/
Create Table tb_categoria (
    id int Auto_increment,
    tipo Varchar(25) Not null,
    prescricao BOOLEAN Not null
);

Create Table tb_produto (
    id int auto_increment primary key,
    valor decimal(10,2) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    id_categoria int NOT NULL,
    estoque int NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id)
);



/*Popule esta tabela Categoria com até 5 dados.*/
Insert into tb_categoria(tipo, prescricao) 
VALUES("TARJA PRETA", true), 
("TARJA VERMELHA", true), 
("TARJA AMARELA", false), 
("TARJA VERMELHA", true), 
("COMESTICOS", false);
    


/*Popule esta tabela Produto com até 8 dados.*/
Insert into tb_produto(valor, nome, id_categoria, estoque) 
VALUES( 120.00, "Fluoxetina", 1, 50),
( 75.00, "Mupirocina", 2, 50), 
( 70, "Antialergico", 3, 50), 
( 75.00, "Respiridona", 4, 50),
( 5.00, "Desodorante", 5, 50), 
( 100.00, "Colecaciferol", 4, 50), 
( 90.00, "Kit para Cabelo", 5, 50), 
( 234.00, "Escitalopram", 1, 50);


/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/
Select * from tb_produto
    WHERE valor > 50;
    
    
/*Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.*/
Select * From tb_produto 
    Where valor between 3 and 60;


/*Faça um select  utilizando LIKE buscando os Produtos com a letra B.*/
Select * From tb_produto 
    Where nome Like "%b%";
    
    
/*Faça um um select com Inner join entre  tabela categoria e produto.*/
Select * From tb_produto Inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id;


/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).*/
Select * from tb_produto Inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id Where tb_produto.id_categoria = 5;