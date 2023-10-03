drop database db_LojaABC;

create database db_LojaABC;

use db_LojaABC;

create table tb_Funcionarios(
    cod_func int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    cpf char(14) unique,
    d_Nasc date,
    endereco varchar(100),
    cep char(9),
    numero char(10),
    bairro varchar(100),
    estado char(2),
    cidade varchar(100),

    primary key(cod_func)
);
