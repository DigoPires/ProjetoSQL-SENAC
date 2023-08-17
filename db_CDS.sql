drop database db_CDS;

create database db_CDS;

use db_CDS;

create table tb_Artistas(
    cod_art int not null auto_increment,
    nome_art varchar(100) not null unique,

    primary key(cod_art)
);

create table tb_Gravadoras(
    cod_grav int not null auto_increment,
    nome_grav varchar(50) not null unique,

    primary key(cod_grav)
);

create table tb_Categorias(
    cod_cat int not null auto_increment,
    nome_cat varchar(50) not null unique,

    primary key(cod_cat)
);

create table tb_Estados(
    sigla_est char(2) not null,
    nome_est varchar(50) not null unique,

    primary key(sigla_est)
);

create table tb_Cidades(
    cod_cid int not null auto_increment,
    sigla_est char(2) not null,
    nome_cid varchar(50) not null,

    primary key(cod_cid),
    foreign key(sigla_est) references tb_Estados(sigla_est)
);

create table tb_Clientes(
    cod_cli int not null auto_increment,
    cod_cid int not null,
    nome_cli varchar(50) not null,
    end_cli varchar(100) not null,
    renda_cli decimal(9,2) not null default 0 check(renda_cli>=0),
    sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),

    primary key(cod_cli),
    foreign key(cod_cid) references tb_Cidades(cod_cid)
);

create table tb_Conjuge(
    cod_conj int not null,
    nome_conj varchar(50) not null,
    renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
    sexo_conj char(1) not null default 'F' check(sexo_conj in('F','M')),

    primary key(cod_conj)
);

create table tb_Funcionarios(
    cod_func int not null auto_increment,
    nome_func varchar(50) not null,
    end_func varchar(100) not null,
    sal_func decimal(9,2) not null default 0 check(sal_func>=0),
    sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),

    primary key(cod_func)
);

create table tb_Dependentes(
    cod_dep int not null auto_increment,
    cod_func int not null,
    nome_dep varchar(100) not null,
    sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),

    primary key(cod_dep),
    foreign key(cod_func) references tb_Funcionarios(cod_func)
);

create table tb_Titulos(
    cod_tit int not null auto_increment,
    cod_cat int not null,
    cod_grav int not null,
    nome_cd varchar(50) not null unique,
    val_cd decimal(9,2) not null check(val_cd>0),
    qtd_estq int not null check(qtd_estq>=0),

    primary key(cod_tit),
    foreign key(cod_cat) references tb_Categorias(cod_cat),
    foreign key(cod_grav) references tb_Gravadoras(cod_grav)
);

create table tb_Pedidos(
    num_ped int not null auto_increment,
    cod_cli int not null,
    cod_func int not null,
    data_ped datetime not null,
    val_ped decimal(9,2) not null default 0 check(val_ped>=0),

    primary key(num_ped),
    foreign key(cod_cli) references tb_Clientes(cod_cli),
    foreign key(cod_func) references tb_Funcionarios(cod_func)
);

create table tb_Titulos_Pedido(
    num_ped int not null,
    cod_tit int not null,
    qtd_cd int not null check(qtd_cd>=1),
    val_cd decimal(9,2) not null check(val_cd>0),

    foreign key(num_ped) references tb_Pedidos(num_ped),
    foreign key(cod_tit) references tb_Titulos(cod_tit)
);

create table tb_Titulos_Artista(
    cod_tit int not null,
    cod_art int not null,

    foreign key(cod_tit) references tb_Titulos(cod_tit),
    foreign key(cod_art) references tb_Artistas(cod_art)
);

desc tb_Artistas;
desc tb_Categorias;
desc tb_Cidades;
desc tb_Clientes;
desc tb_Pedidos;
desc tb_Conjuge;
desc tb_Dependentes;
desc tb_Cidades;

-- Artistas
insert into tb_Artistas(nome_art) values('Marisa Monte');
insert into tb_Artistas(nome_art) values('Gilberto Gil');
insert into tb_Artistas(nome_art) values('Caetano Veloso');
insert into tb_Artistas(nome_art) values('Milton Nascimento');
insert into tb_Artistas(nome_art) values('Legião Urbana');
insert into tb_Artistas(nome_art) values('The Beatles');
insert into tb_Artistas(nome_art) values('Rita Lee');

-- Gravadoras
insert into tb_Gravadoras(nome_grav) values('Polygram');
insert into tb_Gravadoras(nome_grav) values('Emi');
insert into tb_Gravadoras(nome_grav) values('Som Livre');
insert into tb_Gravadoras(nome_grav) values('Som Music');

-- Categorias
insert into tb_Categorias(nome_cat) values('MPB');
insert into tb_Categorias(nome_cat) values('Trilha Sonora');
insert into tb_Categorias(nome_cat) values('Rock Internacional');
insert into tb_Categorias(nome_cat) values('Rock Nacional');

-- Estados
insert into tb_Estados(sigla_est, nome_est) values('SP','São Paulo');
insert into tb_Estados(sigla_est, nome_est) values('MG','Minas Gerais');
insert into tb_Estados(sigla_est, nome_est) values('RJ','Rio de Janeiro');
insert into tb_Estados(sigla_est, nome_est) values('ES','Cachoeira Do Itapemirim');

-- Cidades
insert into tb_Cidades(sigla_est,nome_cid) values('SP','São Paulo');
insert into tb_Cidades(sigla_est,nome_cid) values('SP','Sorocaba');
insert into tb_Cidades(sigla_est,nome_cid) values('SP','Jundiaí');
insert into tb_Cidades(sigla_est,nome_cid) values('SP','Americana');
insert into tb_Cidades(sigla_est,nome_cid) values('SP','Araraquara');
insert into tb_Cidades(sigla_est,nome_cid) values('MG','Ouro Preto');
insert into tb_Cidades(sigla_est,nome_cid) values('ES','Cachoeira Do Itapemirim');

-- Clientes
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(1,'José Nogueira','Rua A',1500.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(1,'Ângelo Pereira','Rua B',2000.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(1,'Catarina Souza','Rua D',892.00,'F');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(1,'Vagner Costa','Rua E',950.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(2,'Antenior da Costa','Rua F',1582.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(2,'Maria Amélia de Souza','Rua G',1500.00,'F');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(3,'Fátima Souza','Rua I',1632.00,'F');
insert into tb_Clientes(cod_cid,nome_cli,end_cli,renda_cli,sexo_dep) values(3,'Joel da Rocha','Rua J',2000.00,'M');

-- Conjuge
insert into tb_Conjuge(cod_conj, nome_conj, renda_conj, sexo_conj) values(1,'Carla Nogueira',2500.00,'F');
insert into tb_Conjuge(cod_conj, nome_conj, renda_conj, sexo_conj) values(2,'Emilia Pereira',5500.00,'F');
insert into tb_Conjuge(cod_conj, nome_conj, renda_conj, sexo_conj) values(6,'Altiva da Costa',3000.00,'F');
insert into tb_Conjuge(cod_conj, nome_conj, renda_conj, sexo_conj) values(7,'Carlos de Souza',3250.00,'M');

-- Funcionarios
insert into tb_Funcionarios(nome_func,end_func,sal_func,sexo_func) values('Vânia Gabriela Pereira', 'Rua A', 2500.00, 'F');
insert into tb_Funcionarios(nome_func,end_func,sal_func,sexo_func) values('Norberto Pereira da Silva', 'Rua B', 300.00, 'M');
insert into tb_Funcionarios(nome_func,end_func,sal_func,sexo_func) values('Olavo Linhares', 'Rua C', 580.00, 'M');
insert into tb_Funcionarios(nome_func,end_func,sal_func,sexo_func) values('Paulo da Silva', 'Rua D', 3000.00, 'F');
insert into tb_Funcionarios(nome_func,end_func,sal_func,sexo_func) values('Rolando Rocha', 'Rua E', 2000.00, 'M');

-- Dependentes
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(1,'Ana Pereira','F');
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(1,'Roberto Pereira','M');
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(1,'Celso Pereira','M');
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(3,'Brisa Linhares','F');
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(3,'Mari Sol Linhares','F');
insert into tb_Dependentes(cod_func,nome_dep,sexo_dep) values(4,'Sonia da Silva','F');

-- Titulos
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,1,'Tribalistas',30.00,1500);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,2,'Tropicália',50.00,500);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,1,'Aquele Abraço',50.00,600);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,2,'Refazenda',60.00,1000);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,3,'Totalmente Demais',50.00,2000);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,3,'Travessia',55.00,500);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(1,2,'Courage',30.00,200);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(4,3,'Legião Urbana',20.00,100);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(3,2,'The Beatles',30.00,300);
insert into tb_Titulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values(4,1,'Rita Lee',30.00,500);

-- Pedidos
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(1,2,'02/05/02',1500.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(3,4,'02/05/02',50.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(4,5,'02/06/02',100.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(1,4,'02/02/03',200.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(7,5,'02/03/03',300.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(4,4,'02/03/03',100.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(5,5,'02/03/03',50.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(8,2,'02/03/03',50.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(2,2,'02/03/03',2000.00);
insert into tb_Pedidos(cod_cli,cod_func,data_ped,val_ped) values(7,1,'02/03/03',3000.00);

-- Titulos Artista
insert into tb_Titulos_Artista(cod_tit,cod_art) values(1,1);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(2,2);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(3,2);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(4,2);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(5,3);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(6,4);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(7,4);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(8,5);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(9,6);
insert into tb_Titulos_Artista(cod_tit,cod_art) values(10,7);

-- Titulos Pedido
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(1,1,2,30.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(1,2,3,20.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(2,1,1,50.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(2,2,3,30.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(3,1,2,40.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(4,2,3,20.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(5,1,2,25.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(6,2,3,30.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(6,3,1,35.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(7,4,2,55.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(8,1,4,60.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(9,2,3,15.00);
insert into tb_Titulos_Pedido(num_ped,cod_tit,qtd_cd,val_cd) values(10,7,2,15.00);

-- Mostrando dados das tabelas
select * from tb_Artistas order by cod_art;
select * from tb_Gravadoras order by cod_grav;
select * from tb_Categorias order by cod_cat;
select * from tb_Estados;
select * from tb_Cidades order by cod_cid;
select * from tb_Clientes order by cod_cli;
select * from tb_Conjuge order by cod_conj;
select * from tb_Funcionarios order by cod_func;
select * from tb_Dependentes order by cod_dep;
select * from tb_Titulos order by cod_tit;
select * from tb_Pedidos order by num_ped;
select * from tb_Titulos_Artista;
select * from tb_Titulos_Pedido;