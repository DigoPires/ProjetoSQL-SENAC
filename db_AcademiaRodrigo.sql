-- RODRIGO PIRES FIGUEIREDO 

drop database db_AcademiaRodrigo;

create database db_AcademiaRodrigo;

use db_AcademiaRodrigo;

show databases;

create table tb_Turma(
    id int,
    quant_alunos int,
    horario_aula datetime,
    duracao_aula datetime,
    data_inicio date,
    data_fim date,
    atividade int,
    id_instrutor int,
    id_monitor int
);

create table tb_Aluno(
    matricula int,
    data_matricula date,
    nome varchar(45),
    endereco varchar(45),
    telefone varchar(45),
    nascimento date,
    altura float,
    peso float,
    id_turma int
);

create table tb_Instrutor(
    rg int,
    nome varchar(45),
    nascimento date,
    titulacao varchar(45),
    telefone varchar(45)
);

create table tb_Registro(
    id_aluno int,
    id_turma int,
    ausencia int,
    id_registro int
);

create table tb_Atividade(
    id int,
    atividade varchar(45)
);

create table tb_Monitor(
    id_aluno int
);

show tables;

desc tb_Turma;
desc tb_Aluno;
desc tb_Instrutor;
desc tb_Registro;
desc tb_Atividade;
desc tb_Monitor;