-- Deletar DB: drop database (Banco de Dados)
drop database db_Academia
-- Criando banco de dados 
create database db_Academia;
-- Acessando o banco de dados
use db_Academia;
-- Visualizar o banco de dados
show databases;
-- Criando tabelas
create table tb_Usuarios(
    codigo int,
    nome varchar(50),
    senha varchar(50)
);

create table tb_Funcionarios(
    codigo int,
    nome varchar(100),
    email varchar(100),
    cpf char(14)
);

create table tb_Telefones(
    codigo int,
    nome varchar(50),
    telefone char(15)
);

-- Visualizar as tabelas
show tables;
-- Visualizar a estrutura da tabela
desc tb_Usuarios;
desc tb_Funcionarios;
desc tb_Telefones