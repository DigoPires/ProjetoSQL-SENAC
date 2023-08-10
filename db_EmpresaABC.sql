-- select * from tb_produtos where tipo in ('informatica', 'digitais');  in = or.
-- select * from tb_produtos where tipo not in ('informatica', 'digitais');

-- select * from tb_produtos where valor between 400.00 and 600.00;
-- select * from tb_produtos where valor not between 400.00 and 600.00;

-- select * from tb_produtos where nome like '%t' - buscar pela ultima letra.
-- select * from tb_produtos where nome like 't%' - buscar pela primeria letra.
-- select * from tb_produtos where nome like '%t%' - começo, meio e fim.

drop database db_EmpresaABC;

create database db_EmpresaABC;

use db_EmpresaABC;


CREATE TABLE tb_PRODUTOS(
CODIGO INT,
NOME VARCHAR(50),
TIPO VARCHAR(25),
QUANTIDADE INT,
VALOR DECIMAL(10,2)
);

INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,'IMPRESSORA', 'INFORMATICA', 200, 600.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3,'DVD PLAYER', 'ELETRONICOS', 250, 500.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,'MONITOR', 'INFORMATICA', 400, 900.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,'TELEVISOR', 'ELETRONICOS', 350, 650.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,'CELULAR', 'TELEFONE', 450, 850.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,'TECLADO', 'INFORMATICA', 300, 450.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 );
INSERT INTO tb_PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,'MOUSE', 'INFORMATICA', 400, 60.00 );

desc tb_PRODUTOS;

select * from tb_PRODUTOS;

-- Atividade 1

-- 1 - Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F'
update tb_PRODUTOS set valor = valor * 1.12 where nome like 'f%';
select * from tb_PRODUTOS;

-- 2 - Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 600 
update tb_PRODUTOS set QUANTIDADE = QUANTIDADE + 50 where valor > 400 and valor < 600;
select * from tb_PRODUTOS;

-- 3 - Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque sejam maiores que 300 
update tb_PRODUTOS set valor = valor*0.5 where QUANTIDADE > 300;
select * from tb_PRODUTOS;

-- 4 - Exiba o produto de CODIGO = 4
select * from tb_PRODUTOS where CODIGO = 4;

-- 5 - Exibir todos os produtos que não tenham a letra 'Y' 
select * from tb_PRODUTOS where nome not like '%y%';

-- 6 - Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras 'MA'
select * from tb_PRODUTOS where nome like 'mo%'and tipo like '%ma%';

-- Atividade 2

-- 1 - Escreva uma consulta que exiba os dados da tabela PRODUTOS na forma crescente pelo campo NOME.
select * from tb_PRODUTOS order by nome asc;

-- 2 - Escreva uma consulta que exiba o NOME dos produtos ordenado de forma decrescente e o VALOR de forma crescente. 
select * from tb_PRODUTOS order by nome desc; 
select * from tb_PRODUTOS order by valor asc;

-- 3 - Escreva uma consulta que exiba os três produtos mais caros.
select * from tb_PRODUTOS order by valor desc limit 3; 

-- 4 - Escreva uma consulta que exiba o VALOR do produto mais barato.
select valor from tb_PRODUTOS order by valor desc limit 1; 