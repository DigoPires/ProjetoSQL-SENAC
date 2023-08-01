drop database db_Loteria;

create database db_Loteria;

use db_Loteria;

create table tb_Jogo(
    id_jogo int,
    nome varchar(50),
    valor decimal(5,2),
    data_entrada date
);

desc tb_Jogo;

insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(1,'Mega-Sena', 4.50,'2023/07/21');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(2,'Quina', 2.50,'2023/07/11');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(3,'Lotofácil', 2.50,'2023/07/27');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(4,'Lotomania', 3.00,'2023/07/31');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(5,'Dupla Sena', 4.00,'2023/08/01');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(6,'Dia de Sorte', 2.50,'2023/07/10');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(7,'Super Sete', 5.00,'2023/07/14');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(8,'+Milionária', 1.50,'2023/07/03');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(9,'Timemania', 3.50,'2023/08/01');
insert tb_Jogo(id_jogo,nome,valor,data_entrada) values(10,'Federal', 2.00,'2023/07/11');

select * from tb_Jogo;

update tb_Jogo set valor = 5.00 where id_jogo = 1;
update tb_Jogo set valor = 3.00, data_entrada = '2023/07/28'  where id_jogo = 3;

select * from tb_Jogo;

delete from tb_Jogo where id_jogo = 8;
delete from tb_Jogo where id_jogo = 9;
delete from tb_Jogo where id_jogo = 10;

select * from tb_Jogo;