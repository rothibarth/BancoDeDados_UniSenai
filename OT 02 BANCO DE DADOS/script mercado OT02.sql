create table produto(

idproduto int NOT null primary key auto_increment,
descricao varchar(45),
preco decimal(5,2) null,
idcategoria int,

constraint fkcategoria foreign key (idcategoria)
references categoria (idcategoria));

use mercado;

SELECT * FROM mercado.produto;

insert into `produto` values (2, 'Creme dental', 2.90 , 1);
insert into `produto` values (3, 'Presunto', 4.99 , 4);
insert into `produto` values (4, 'Lençol 180 fios', 85.80 , 3);
insert into `produto` values (5, 'Desinfetante', 6.99 , 2);

/* atvd 1 */
SELECT produto.*
FROM produto
JOIN categoria ON produto.idcategoria = categoria.idcategoria
WHERE categoria.descricao = 'Higiene pessoal';

/*atvd 2 */

SELECT produto.preco, categoria.descricao
FROM produto
JOIN categoria ON produto.idcategoria = categoria.idcategoria
WHERE categoria.descricao = 'Limpeza';

/* atvd 3*/

SELECT produto.descricao AS descricao, produto.preco, categoria.descricao AS descricao
FROM produto
JOIN categoria ON produto.idcategoria = categoria.idcategoria;

/* atvd 4 */

SELECT produto.*
FROM produto
JOIN categoria ON produto.idcategoria = categoria.idcategoria
WHERE categoria.descricao != 'Frios';

/* atvd 5 */ 

SELECT categoria.descricao AS descricao, produto.descricao AS descricao
FROM categoria
LEFT JOIN produto ON produto.idcategoria = categoria.idcategoria;
