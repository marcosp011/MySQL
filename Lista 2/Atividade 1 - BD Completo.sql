use db_generation_game_online;

/*Crie um banco de dados para um serviço de um game Online ,
 o nome do banco deverá ter o seguinte nome db_generation_game_online, onde, o
 sistema trabalhará com as informações dos personagens desse game. */
 
create database db_generation_game_online;

/*O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.*/

/*Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine
 5 atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online (não esqueça de criar a foreign key de tb_classe nesta tabela).*/
 
 /*Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da classe para se trabalhar com o serviço desse  game Online.*/

create table tb_classe(

	id_classe bigint(8) not null auto_increment primary key,
    nomeClasse varchar(50) not null,
    estiloClasse varchar(50) not null,
    danoFisico boolean not null,
    danoMagico boolean not null

);

create table tb_personagem(

	id_personagem bigint(8) not null auto_increment primary key,
    nomePersonagem varchar(50) not null, 
    habPrincipal varchar(50) not null,
    habSecundaria varchar(50) not null,
    habUltimate varchar(50),
    danoDeAtaque int not null, 
	resDefesa int not null,
    
	-- Criando a FK com a Tabela Classe
	id_ClassePersonagem bigint not null,
	foreign key (id_ClassePersonagem) references tb_classe(id_classe)
);

/*Popule esta tabela classe com até 5 dados.*/
insert into tb_classe(nomeClasse,estiloClasse,danoFisico,danoMagico)
VALUE("ASSASSINO","Corpo a Corpo",true,false),
("MAGO","A Distancia|Corpo a Corpo",false,true),
("TANQUE","Corpo a Corpo",true,false),
("ATIRADOR","A Distancia",true,false),
("SUPORTE","LUTADOR|DISTANCIA",true,true),
("LUTADOR","TANQUE|DISTANCIA",true,true);


/*Popule esta tabela personagem com até 8 dados.*/
insert into tb_personagem(nomePersonagem,habPrincipal,habSecundaria,habUltimate,danoDeAtaque,resDefesa,id_ClassePersonagem)
VALUE("Rengar","Servageria","Rugido de Batalha","Furor da Caçada",6000,4800,1),
("Ekko","Giratempo","Convergência Paralela","Cronoquebra",10000,1000,1),
("Hecarim","Enfurecido","Espírito do Pavor","Massacre das Sombras",1900,8000,3),
("Pantheon","Lança Meteórica","Escudo-Cometa","Constelação Cadente",5100,3800,5),
("Lee Sin","Onda Sônica","Proteger","Furia do Dragão",1700,4900,6),
("Kha'Zix","Sabor do Medo","Espinho do Vazio","Massacre do Vazio",9000,3200,1),
("Kayn","Corte Ceifador","Alcance da Lâmina","Transfressão do Umbral",4000,6000,3),
("Samira","Talento Natural","Voragem Afiada","Gatilho Infernal",4000,1800,4),
("Ryze","Sobrecarregar","Prisão de Runa","Portal Reinos",4000,1800,2);

/*Faça um select que retorne os personagens com o poder de ataque maior do que 2000.*/
select nomePersonagem,danoDeAtaque from tb_personagem where danoDeAtaque > 2000;

/*
Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.*/
select nomePersonagem,resDefesa from tb_personagem where resDefesa >= 1000 && resDefesa <= 2000;

/*Faça um um select com Inner join entre  tabela classe e personagem.*/
Select tb_personagem.nomePersonagem, tb_Personagem.habUltimate, tb_classe.nomeClasse from tb_personagem
inner join tb_classe on tb_classe.id_classe;

/*Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).*/
select nomePersonagem,nomeClasse from tb_personagem,tb_classe where nomeClasse like "%ASSA%"; 