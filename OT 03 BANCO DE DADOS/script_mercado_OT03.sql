/* - aqui é só para criar a tabela vendas
create table vendas(
idvenda int not null primary key auto_increment,
data_venda date);*/

SELECT * FROM mercado.vendas;

use mercado;

insert into `vendas` values (1, '2021-01-23');
insert into `vendas` values (2, '2021-11-04');
insert into `vendas` values (3, '2021-07-07');
insert into `vendas` values (4, '2021-07-08');
insert into `vendas` values (5, '2021-07-09');
insert into `vendas` values (6, '2021-07-10');

create table vendas_has_produto(
idvenda int,
idproduto int,
quantidade int,
constraint fkvenda foreign key (idvenda)
references vendas (idvenda),
constraint fkproduto foreign key (idproduto)
references produto(idproduto),
primary key(idvenda, idproduto));

SELECT * FROM mercado.vendas_has_produto;
use mercado;

insert into vendas_has_produto values (1, 1, 5);
insert into vendas_has_produto values (1, 2, 2);
insert into vendas_has_produto values (1, 4, 6);
insert into vendas_has_produto values (2, 1, 2);
insert into vendas_has_produto values (3, 1, 4);
insert into vendas_has_produto values (3, 4, 1);
insert into vendas_has_produto values (4, 1, 3);
insert into vendas_has_produto values (4, 2, 2);
insert into vendas_has_produto values (5, 4, 4);
insert into vendas_has_produto values (6, 2, 1);

/* Exerc 1. */

select *
from vendas
JOIN produto ON vendas.idvenda = produto.idproduto
WHERE produto.descricao = 'Escova dental';




