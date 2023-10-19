-- Sistema de produtos da Apple.

-- drop database db_Apple;

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