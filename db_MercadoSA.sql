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
    id_Cli int not null auto_increment,
    nome varchar(50) not null,
    email varchar(50),
    telefone char(11),

    primary key(id_Cli)
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
    id_Cli int not null,
    id_Prod int not null,
    data_Venda date,
    quantidade decimal(9,2),
    valor_Total decimal(9,2),

    primary key(id_Vend),
    foreign key(id_Usu) references tb_Usuarios(id_Usu),
    foreign key(id_Cli) references tb_Clientes(id_Cli),
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

insert into tb_Vendas(id_Usu,id_Cli,id_Prod,data_Venda,quantidade,valor_Total) values(1,2,1,'2023/07/30',2,40.00);
insert into tb_Vendas(id_Usu,id_Cli,id_Prod,data_Venda,quantidade,valor_Total) values(1,1,2,'2023/08/03',2,19.00);
insert into tb_Vendas(id_Usu,id_Cli,id_Prod,data_Venda,quantidade,valor_Total) values(1,1,3,'2023/08/10',1,850.00);

select * from tb_Funcionarios;
select * from tb_Clientes;
select * from tb_Fornecedores;
select * from tb_Usuarios;
select * from tb_Produtos;
select * from tb_Vendas;

-- Inner Join

select usu.nome as 'Nome do usuário', func.nome as 'Nome do funcionário', func.email as 'E-mail do funcionário' from tb_Usuarios as usu inner join tb_Funcionarios as func on usu.id_Func = func.id_Func;

select forn.nome, forn.cnpj, prod.descricao from tb_Produtos as prod inner join tb_Fornecedores as forn on prod.id_Forn = forn.id_Forn;

select cli.nome, cli.email, cli.telefone, vend.data_Venda, vend.valor_Total from tb_Vendas as vend inner join tb_Clientes as cli on vend.id_Cli = cli.id_Cli;

select cli.nome,cli.email, prod.descricao, vend.data_Venda from tb_Vendas as vend inner join tb_Clientes as cli on vend.id_Cli = cli.id_Cli inner join tb_Produtos as prod on vend.id_Prod = prod.id_Prod where vend.id_Vend = 1;

select cli.nome,cli.email, prod.descricao, vend.data_Venda from tb_Vendas as vend inner join tb_Clientes as cli on vend.id_Cli = cli.id_Cli inner join tb_Produtos as prod on vend.id_Prod = prod.id_Prod where prod.descricao like '%b%';

select prod.descricao,prod.quantidade from tb_Funcionarios as func left join tb_Produtos as prod on func.id_Func = prod.id_Prod;
select prod.descricao,prod.quantidade from tb_Funcionarios as func right join tb_Produtos as prod on func.id_Func = prod.id_Prod;
select prod.descricao,prod.quantidade from tb_Funcionarios as func inner join tb_Produtos as prod on func.id_Func = prod.id_Prod;