-- RODRIGO PIRES FIGUEIREDO

drop database db_ClinicaMedica;

create database db_ClinicaMedica;

use db_ClinicaMedica;

show databases;

create table tb_Medico(
    idMedico int,
    nmMedico varchar(45),
    telefoneMedico varchar(9)
);

create table tb_Consulta(
    idConsulta int,
    dt_consulta datetime,
    Medico_idMedico int,
    Paciente_idPaciente int,
    ReceitaMedica_idReceitaMedica int
);

create table tb_ReceitaMedica(
    idReceitaMedica int,
    descricao varchar(500)
);

create table tb_Paciente(
    idPaciente int,
    nmPaciente varchar(45),
    telefonePaciente varchar(9),
    convenio varchar(45)
);

show tables;

desc tb_Medico;
desc tb_Consulta;
desc tb_ReceitaMedica;
desc tb_Paciente;