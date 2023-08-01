-- Apagar Banco de Dados
drop database db_Manicure;

-- Criar Banco de Dados
create database db_Manicure;

-- Acessar o Banco de Dados
use db_Manicure;

-- Visualizar Bancos de Dados
show databases;

-- Criar tabelas
create table tb_Produtos(
    id_prod int,
    descricao varchar(100),
    quantidade decimal(9,2),
    data_entrada date,
    valor_unit decimal(9,2)
);

-- Vizualiazar tabelas
show tables;

-- Visualizar a estrutura da tabela
desc tb_Produtos;

-- Inserindo registros das tabelas
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(1,'Alicate de Unha',10,'2023/08/01',19.99);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(2,'Algodão',100,'2023/07/31',2.99);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(3,'Esmalte',50,'2023/07/21',14.99);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(4,'Acetona',30,'2023/07/22',16.90);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(5,'Unha Postiça',10,'2023/08/01',9.99);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(6,'Unha',15,'2023/07/30',9.99);
insert into tb_Produtos(id_prod,descricao,quantidade,data_entrada,valor_unit) values(7,'Postiça',20,'2023/07/30',9.99);

-- Visualizar os registros das tabelas
select * from tb_Produtos;

-- Alterar registros das tabelas
update tb_Produtos set descricao = 'Palito De Unha', valor_unit = 1.35 where id_prod = 6;
update tb_Produtos set descricao = 'Mascara De Proteção', valor_unit = 6.50 where id_prod = 7;

select * from tb_Produtos;

-- Apagar resgistros das tabelas
delete from tb_Produtos where id_prod = 7;

select * from tb_Produtos;