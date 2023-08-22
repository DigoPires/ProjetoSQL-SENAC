-- RODRIGO PIRES FIGUEIREDO

drop database db_Livraria;

create database db_Livraria;

use db_Livraria;

create table tb_autor(
    id_autor int not null auto_increment,
    nome_autor varchar(100) not null,
    email_autor varchar(100) not null,

    primary key(id_autor)
);

create table tb_genero(
    id_genero int not null auto_increment,
    descricao varchar(100) not null,

    primary key(id_genero)
);

create table tb_cliente(
    id_cliente int not null auto_increment,
    nome_cliente varchar(100) not null,
    telefone_cliente varchar(45) not null,

    primary key(id_cliente)

);

create table tb_livro(
    id_livro int not null auto_increment,
    titulo_livro varchar(100) not null,
    preco_livro decimal(9,2) not null default 0 check(preco_livro >= 0),
    estoque_livro int not null default 0 check(estoque_livro >= 0),
    id_genero int not null,

    primary key(id_livro),
    foreign key(id_genero) references tb_genero(id_genero)
);

create table tb_venda(
    id_venda int not null auto_increment,
    data_venda date not null,
    total_venda decimal(9,2) not null default 0 check(total_venda >= 0),
    id_cliente int not null,

    primary key(id_venda),
    foreign key(id_cliente) references tb_cliente(id_cliente)
);

create table tb_itens_da_venda(
    id_venda int not null,
    id_livro int not null,
    qtd_idv int not null default 0 check(qtd_idv >= 0),
    subtotal_idv varchar(50) not null default 0 check(subtotal_idv >= 0),

    foreign key(id_venda) references tb_venda(id_venda),
    foreign key(id_livro) references tb_livro(id_livro)
);

create table tb_escreve(
    id_livro int not null,
    id_autor int not null,

    foreign key(id_livro) references tb_livro(id_livro),
    foreign key(id_autor) references tb_autor(id_autor)
);

desc tb_autor;
desc tb_genero;
desc tb_cliente;
desc tb_livro;
desc tb_venda;
desc tb_itens_da_venda;
desc tb_escreve;


-- AUTOR

insert into tb_autor(nome_autor,email_autor) values('William Shakespeare','shakespeare@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Mark Twain','twain@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Machado de Assis','assis@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Miguel de Cervantes','cervantes@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('F. Scott Fitzgerald','scott@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Gabriel García Márquez','garcia@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Herman Melville','melville@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Lev Tolstói','tolstoi@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Vladimir Nabokov','nabokov@gmail.com');
insert into tb_autor(nome_autor,email_autor) values('Jane Austen','austen@gmail.com');

select * from tb_autor order by id_autor;

update tb_autor set nome_autor = 'Jeff Kinney', email_autor = 'kinney@gmail.com' where id_autor = 2;
update tb_autor set nome_autor = 'Rita Lee', email_autor = 'lee@gmail.com' where id_autor = 3;
update tb_autor set nome_autor = 'Clarice Lispector', email_autor = 'lispector@gmail.com' where id_autor = 10;
update tb_autor set email_autor = 'fitzgerald@gmail.com' where id_autor = 5;
update tb_autor set email_autor = 'marquez@gmail.com' where id_autor = 6;

select * from tb_autor order by id_autor;

delete from tb_autor where id_autor = 6;
delete from tb_autor where nome_autor = 'Herman Melville';
delete from tb_autor where id_autor = 8;
delete from tb_autor where email_autor = 'nabokov@gmail.com';
delete from tb_autor where id_autor = 10;

select * from tb_autor order by id_autor;


-- GENERO

insert into tb_genero(descricao) values('Romance');
insert into tb_genero(descricao) values('Biografia');
insert into tb_genero(descricao) values('Conto');
insert into tb_genero(descricao) values('Poesia');
insert into tb_genero(descricao) values('Motivacional');
insert into tb_genero(descricao) values('Fábula');
insert into tb_genero(descricao) values('Novela');
insert into tb_genero(descricao) values('Canção');
insert into tb_genero(descricao) values('Acadêmico');
insert into tb_genero(descricao) values('Religioso');

select * from tb_genero order by id_genero;

update tb_genero set descricao = 'Autobiografia' where id_genero = 2;
update tb_genero set descricao = 'Autoajuda' where id_genero = 5;
update tb_genero set descricao = 'Reportagem' where id_genero = 6;
update tb_genero set descricao = 'Horror' where id_genero = 8;
update tb_genero set descricao = 'Científico' where id_genero = 9;

select * from tb_genero order by id_genero;

delete from tb_genero where id_genero = 6;
delete from tb_genero where id_genero = 7;
delete from tb_genero where id_genero = 8;
delete from tb_genero where id_genero = 9;
delete from tb_genero where id_genero = 10;

select * from tb_genero order by id_genero;


-- CLIENTE

insert into tb_cliente(nome_cliente, telefone_cliente) values('Rodrigo P.', '(11) 99364-8032');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Jhonatan M.','(13) 92564-2092');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Ryan C.', '(11) 93764-8237');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Matheus G.', '(11) 98364-1042');
insert into tb_cliente(nome_cliente, telefone_cliente) values('João G.', '(21) 99368-8931');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Vítor T.', '(11) 97764-8332');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Giulia C.', '(81) 99894-8002');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Anderson S.', '(11) 90384-8133');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Nicoly S.', '(11) 91124-8952');
insert into tb_cliente(nome_cliente, telefone_cliente) values('Ana C.', '(92) 95365-3632');

select * from tb_cliente order by id_cliente;

update tb_cliente set nome_cliente = 'Giulia C.' where id_cliente = 4;
update tb_cliente set nome_cliente = 'Reinaldo J.' where id_cliente = 8;
update tb_cliente set nome_cliente = 'Allan S.' where id_cliente = 3;
update tb_cliente set nome_cliente = 'Lorena P.' where id_cliente = 9;
update tb_cliente set nome_cliente = 'Anna C.' where id_cliente = 10;

select * from tb_cliente order by id_cliente;

delete from tb_cliente where id_cliente = 6;
delete from tb_cliente where id_cliente = 7;
delete from tb_cliente where id_cliente = 8;
delete from tb_cliente where id_cliente = 9;
delete from tb_cliente where id_cliente = 10;

select * from tb_cliente order by id_cliente;


-- LIVRO

insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Romeu e Julieta',50.00,12,2);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Dom Quixote',25.00,20,1);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('O Grande Gatsby ',23.90,3,1);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Diário de um Banana',35.50,10,3);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Rita Lee: uma autobiografia',15.50,15,2);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Toda Poesia',28.50,13,4);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Sentimento do Mundo',8.90,20,4);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Como fazer amigos e influenciar pessoas.',7.50,7,1);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('Guerra e Paz',10.99,5,1);
insert into tb_livro(titulo_livro, preco_livro, estoque_livro, id_genero) values('A Hora da Estrela',13.90,10,3);

select * from tb_livro order by id_livro;

update tb_livro set id_genero = 1 where titulo_livro = 'Romeu e Julieta'; 
update tb_livro set estoque_livro = 8 where id_livro = 3;
update tb_livro set preco_livro = 9.90 where titulo_livro = 'Sentimento do Mundo';
update tb_livro set preco_livro = 7.99 where titulo_livro = 'Guerra e Paz';
update tb_livro set id_genero = 1 where id_livro = 10;

select * from tb_livro order by id_livro;

delete from tb_livro where id_livro = 6;
delete from tb_livro where id_livro = 7;
delete from tb_livro where id_livro = 8;
delete from tb_livro where id_livro = 9;
delete from tb_livro where id_livro = 10;

select * from tb_livro order by id_livro;


-- VENDA

insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/20', 50.00, 1);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/12', 23.90, 2);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/09', 35.00, 1);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/21', 15.00, 3);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/21', 50.00, 4);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/22', 50.00, 5);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/20', 50.00, 3);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/20', 71.50, 2);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/16', 35.00, 1);
insert into tb_venda(data_venda, total_venda, id_cliente) values('2023/08/17', 40.00, 4);

select * from tb_venda order by id_venda;

update tb_venda set data_venda = '2023/08/21' where id_venda = 1; 
update tb_venda set data_venda = '2023/08/22' where id_venda = 2; 
update tb_venda set data_venda = '2023/08/11' where id_venda = 3; 
update tb_venda set data_venda = '2023/08/22' where id_venda = 4; 
update tb_venda set data_venda = '2023/08/01' where id_venda = 5;

select * from tb_venda order by id_venda;

delete from tb_venda where id_venda = 6;
delete from tb_venda where id_venda = 7;
delete from tb_venda where id_venda = 8;
delete from tb_venda where id_venda = 9;
delete from tb_venda where id_venda = 10;

select * from tb_venda order by id_venda;


-- ITENS DA VENDA

insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(1, 1, 1, 20.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(2, 3, 1, 23.90);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(3, 4, 3, 106.50);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(4, 2, 1, 35.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(5, 5, 1, 20.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(2, 1, 0, 50.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(1, 1, 4, 50.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(3, 2, 1, 50.00);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(5, 4, 2, 71.50);
insert into tb_itens_da_venda(id_venda, id_livro, qtd_idv, subtotal_idv) values(1, 4, 1, 35.50);

select * from tb_itens_da_venda;

update tb_itens_da_venda set subtotal_idv = 50.00 where id_livro = 1 and qtd_idv = 1; 
update tb_itens_da_venda set subtotal_idv = 24.90 where id_livro = 3 and qtd_idv = 1; 
update tb_itens_da_venda set qtd_idv = 2, subtotal_idv = 71.00 where id_livro = 4 and qtd_idv = 3; 
update tb_itens_da_venda set subtotal_idv = 15.00 where id_livro = 5 and qtd_idv = 1;
update tb_itens_da_venda set subtotal_idv = 25.00 where id_livro = 2 and qtd_idv = 1;

select * from tb_itens_da_venda;

delete from tb_itens_da_venda where id_livro = 4 and subtotal_idv = 71.50;
delete from tb_itens_da_venda where id_livro = 5;
delete from tb_itens_da_venda where subtotal_idv < 20.00;
delete from tb_itens_da_venda where qtd_idv > 3;
delete from tb_itens_da_venda where qtd_idv = 0;

select * from tb_itens_da_venda;


-- ESCREVE

insert into tb_escreve(id_livro, id_autor) values(1,1);
insert into tb_escreve(id_livro, id_autor) values(2,4);
insert into tb_escreve(id_livro, id_autor) values(3,5);
insert into tb_escreve(id_livro, id_autor) values(4,2);
insert into tb_escreve(id_livro, id_autor) values(5,3);
insert into tb_escreve(id_livro, id_autor) values(1,2);
insert into tb_escreve(id_livro, id_autor) values(2,3);
insert into tb_escreve(id_livro, id_autor) values(3,1);
insert into tb_escreve(id_livro, id_autor) values(4,5);
insert into tb_escreve(id_livro, id_autor) values(5,4);

select * from tb_escreve;

delete from tb_escreve where id_livro = 1 and id_autor = 2;
delete from tb_escreve where id_livro = 2 and id_autor = 3;
delete from tb_escreve where id_livro = 3 and id_autor = 4;
delete from tb_escreve where id_livro = 4 and id_autor = 5;
delete from tb_escreve where id_livro = 5 and id_autor = 1;

select * from tb_escreve;

update tb_escreve set id_autor = 1 where id_livro = 1;
update tb_escreve set id_autor = 2 where id_livro = 4;
update tb_escreve set id_autor = 3 where id_livro = 5;
update tb_escreve set id_autor = 4  where id_livro = 2;
update tb_escreve set id_autor = 5 where id_livro = 3;

select * from tb_escreve;


select * from tb_autor where id_autor > 1;
select * from tb_autor where id_autor < 5;
select * from tb_autor where nome_autor = 'William Shakespeare';
select * from tb_autor where id_autor = 3 or id_autor = 5;
select * from tb_autor where id_autor = 3 and id_autor = 4;
select * from tb_autor where id_autor in(3,4);
select * from tb_autor where id_autor >= 1;
select * from tb_autor where id_autor <= 5;
select * from tb_autor where not nome_autor = 'William Shakespeare';
select nome_autor as 'Nome do Autor' from tb_autor;
select distinct id_cliente from tb_venda;