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

create table tb_Usuarios(
    cod_Usu int not null auto_increment,
    usuario varchar(30) not null,
    senha varchar(10) not null,
    cod_func int not null,
    
    primary key (cod_Usu),
    foreign key (cod_func) references tb_Funcionarios (cod_func)
);

-- select usu.usuario, usu.senha, func.cod_func from tb_Funcionarios as func inner join tb_Usuarios as usu on func.cod_func = usu.cod_func where func.nome = "Rodrigo Pires";

-- select * from tb_Usuarios where usuario = 'admin' and senha = 'admin';

-- select * from tb_Funcionarios where cod_func = 1;

-- select * from tb_Funcionarios where nome like "%R%";

-- select cod_func+1 from tb_Funcionarios order by cod_func desc;

-- select * from tb_Funcionarios where nome = "";

-- Backup

-- INSERT INTO `tb_funcionarios` (`cod_func`, `nome`, `email`, `cpf`, `d_Nasc`, `endereco`, `cep`, `numero`, `bairro`, `estado`, `cidade`) VALUES
-- (1, 'Rodrigo Pires', 'rodrigo.pfigueiredo1@senacsp.edu.br', '192.824.982-09', '2023-10-05', 'Rua João Batista Franco', '04842-230', '384', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (2, 'Rafaela Alves', 'rafaela.alves@senacsp.edu.br', '294.526.186-29', '2023-10-05', 'Rua João Batista Franco', '04842-230', '362', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (3, 'Vitor Teixeira', 'vitor.teixeira@senacsp.edu.br', '420.124.529-67', '2023-10-05', 'Rua João Batista Franco', '04842-230', '323', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (4, 'Julio Machado', 'julio.machado@gmail.com', '342.512.509-79', '2023-10-05', 'Rua João Batista Franco', '04842-230', '462', 'Parque Grajaú', 'SP', 'São Paulo');

-- insert into tb_Usuarios (usuario,senha,cod_func)values('admin','admin',1);