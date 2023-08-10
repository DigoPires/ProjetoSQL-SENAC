drop database db_MercadoSA;

create database db_MercadoSA;

use db_MercadoSA;

create table tb_Funcionarios(
    id_Func int not null auto_increment,
    nome varchar(50) not null,
    email varchar(50),
    cpf char(14) not null unique,
    salario decimal(9,2) default 0 check(salario >= 0),
    sexo char(1) default 'F' check(sexo in('F','M')),

    primary key(id_Func)
);

create table tb_Clientes(
    id_Client int not null auto_increment,
    nome varchar(50) not null,
    email varchar(50),
    telefone char(11),

    primary key(id_Client)
);

create table tb_Fornecedores(
    id_Forn int not null auto_increment,
    nome varchar(50) not null,
    email varchar(50),
    cnpj char(18) not null unique,
    
    primary key(id_Forn)
);

create table tb_Usuarios(
    id_Usu int not null auto_increment,
    nome varchar(50) not null,
    senha varchar(20) not null,
    id_Func int not null,

    primary key(id_Usu),
    foreign key(id_Func) references tb_Funcionarios(id_Func)
);

create table tb_Produtos(
    id_Prod int not null auto_increment,
    descricao varchar(100),
    data_Entrada date,
    hora_Entrada time,
    quantidade decimal(9,2),
    valor_Unit decimal(9,2),
    id_Forn int not null,

    primary key(id_Prod),
    foreign key(id_Forn) references tb_Fornecedores(id_Forn)
);

create table tb_Vendas(
    id_Vend int not null auto_increment,
    id_Usu int not null,
    id_Client int not null,
    id_Prod int not null,
    data_Venda date,
    quantidade decimal(9,2),
    valor_Total decimal(9,2),

    primary key(id_Vend),
    foreign key(id_Usu) references tb_Usuarios(id_Usu),
    foreign key(id_Client) references tb_Clientes(id_Client),
    foreign key(id_Prod) references tb_Produtos(id_Prod)
);

desc tb_Funcionarios;
desc tb_Clientes;
desc tb_Fornecedores;
desc tb_Usuarios;
desc tb_Produtos;
desc tb_Vendas;

-- Inserir registros nas tabelas
insert into tb_Funcionarios(nome,email,cpf,salario,sexo) values('Pedro Antunes','pedro.a@gmail.com','404.231.567-24',1200.00,'M');

insert into tb_Clientes(nome,email,telefone) values('Marcos Pereira','marcos.p@gmail.com','11982342289');
insert into tb_Clientes(nome,email,telefone) values('Carlos Almeida','carlos.a@gmail.com','11982752381');

insert into tb_Fornecedores(nome,email,cnpj) values('CasaVendas','casa.vendas@gmail.com',' 23.456.789/0071-23');
insert into tb_Fornecedores(nome,email,cnpj) values('MarketPlace','market.place@gmail.com',' 27.856.459/0052-27');

insert into tb_Usuarios(nome,senha,id_Func) values('Pedro Antunes','pedro123',1);

insert into tb_Produtos(descricao,data_Entrada,hora_Entrada,quantidade,valor_Unit,id_Forn)values ('Arroz','2023/07/28','15:07:01',30,20.00,1);
insert into tb_Produtos(descricao,data_Entrada,hora_Entrada,quantidade,valor_Unit,id_Forn)values ('Feijão','2023/08/09','10:37:23',50,8.50,1);
insert into tb_Produtos(descricao,data_Entrada,hora_Entrada,quantidade,valor_Unit,id_Forn)values ('Bicicleta','2023/07/15','18:47:12',5,850.00,2);

insert into tb_Vendas(id_Usu,id_Client,id_Prod,data_Venda,quantidade,valor_Total) values(1,2,1,'2023/07/30',2,40.00);
insert into tb_Vendas(id_Usu,id_Client,id_Prod,data_Venda,quantidade,valor_Total) values(1,1,2,'2023/08/03',2,19.00);
insert into tb_Vendas(id_Usu,id_Client,id_Prod,data_Venda,quantidade,valor_Total) values(1,1,3,'2023/08/10',1,850.00);

select * from tb_Funcionarios;
select * from tb_Clientes;
select * from tb_Fornecedores;
select * from tb_Usuarios;
select * from tb_Produtos;
select * from tb_Vendas;
