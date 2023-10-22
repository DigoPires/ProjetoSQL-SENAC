-- Sistema de produtos da Apple.

drop database db_Apple;

create database db_Apple;

use db_Apple;

create table tb_Produtos(
    cod_prod int not null auto_increment,
    descricao varchar(100) not null,
    data_Entrada date not null,
    quantidade decimal(9,2) not null default 0,
    valor decimal(9,2) not null default 0,

    primary key(cod_prod)
);

-- insert into tb_Produtos(descricao,data_Entrada,quantidade,valor) values(@descricao,@data_Entrada,@quantidade,@valor);

insert into tb_Produtos(descricao,data_Entrada,quantidade,valor) values("iPhone 13","2023/10/20","10","5499");
insert into tb_Produtos(descricao,data_Entrada,quantidade,valor) values("Air Pods Pro","2023/10/20","10","1499");
insert into tb_Produtos(descricao,data_Entrada,quantidade,valor) values("MacBook Air de 15 polegadas","2023/10/20","10","12499");

-- update tb_Produtos set descricao = @descricao, data_Entrada = @data_Entrada, quantidade = @quantidade, valor = @valor where cod_prod = @cod_prod;

-- delete from tb_Produtos where cod_prod = @cod_prod;