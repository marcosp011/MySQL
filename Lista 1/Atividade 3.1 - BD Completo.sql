use ESCOLA

create database db_escola;

create table tb_estudante (
id_matricula bigint (50) auto_increment not null,
nomeDoAluno varchar(50),
notaDoAluno double,
enderecoDoAluno varchar(100),
generoDoAluno char
);

select id_matricula,nomeDoAluno,notaDoAluno from tb_estudante; 

insert into tb_estudante(nomeDoAluno,notaDoAluno,enderecoDoAluno,generoDoAluno) VALUES
("Marcos Vinicius Coutinho", 10.00, "Capão Redondo","M"),
("Cleiton Silva", 8.00, "Capão Redondo","M"),
("Andressa Maria da Costa", 7.00, "Itapecerica da Serra","F"),
("Carla Diaz", 10.00, "Vila Sonia","F"),
("Keite Antunes da Moda", 6.00, "Morumbi","F"),
("Regina Silveira", 10.00, "Morumbi","F"),
("Carlos Antunes Costa", 9.00, "Morumbi","M"),
("Anderson da Silva", 10.00, "Capão Redondo","M");

select nomeDoAluno, notaDoAluno from tb_estudantes where notaDoAluno < 7.00; 

select nomeDoAluno, notaDoAluno from tb_estudantes where notaDoAluno > 7.00; 

update tb_estudantes set notaDoAluno = 7.00 where id_matricula = 5;