use mercado;

/* Exerc 1*/
SELECT COUNT(*) AS total_venda_escovas
FROM vendas_has_produto VP
JOIN Produto P ON VP.idproduto = P.idproduto
WHERE P.descricao = 'Escova dental';

/* Exerc 2 */

SELECT SUM(P.preco * VP.quantidade) AS valor_total_venda
FROM vendas_has_produto VP
JOIN Produto P ON VP.idproduto = P.idproduto
WHERE VP.idvenda = 2;

/* Exerc 3 */

SELECT P.*, C.descricao AS categoria_descricao
FROM Produto P
JOIN Categoria C ON P.idcategoria = C.idcategoria
WHERE C.descricao = 'Higiene pessoal' AND P.descricao LIKE '%dental';

/* Exerc 4 */

SELECT *
FROM Produto P
JOIN Categoria C ON P.idcategoria = C.idcategoria
WHERE C.descricao IN ('Higiene pessoal', 'Limpeza');

/* Exerc 5 */

SELECT AVG(P.preco) AS media_produtos
FROM Vendas V
JOIN vendas_has_produto VP ON V.idvenda = VP.idvenda
JOIN Produto P ON VP.idproduto = P.idproduto
WHERE V.data_venda = '2021-01-23';

/* Exerc 6 */

SELECT *
FROM Produto P
JOIN Categoria C ON P.idcategoria = C.idcategoria
WHERE C.descricao NOT IN ('Cama, mesa e banho', 'Limpeza');

/* Exerc 7 */

SELECT descricao, preco
FROM Produto
ORDER BY preco DESC
LIMIT 1;

/* Exerc 8 */

SELECT P.descricao, SUM(VP.quantidade) AS Total_de_Vendas
FROM Produto P
JOIN vendas_has_produto VP ON P.idproduto = VP.idproduto
GROUP BY P.descricao
ORDER BY Total_de_Vendas DESC
LIMIT 1;

/* Exerc 9 */

SELECT V.data_venda, SUM(VP.quantidade) AS total_vendidos
FROM Vendas V
JOIN vendas_has_produto VP ON V.idvenda = VP.idvenda
GROUP BY V.data_venda
ORDER BY total_vendidos ASC
LIMIT 1;

/* exerc 10 */ 

SELECT DISTINCT C.descricao
FROM Categoria C
JOIN Produto P ON C.idcategoria = P.idcategoria
JOIN vendas_has_produto VP ON P.idproduto = VP.idproduto;

/* exerc 11 */

SELECT SUM(VP.quantidade) AS total_produtos_vendidos
FROM Vendas V
JOIN vendas_has_produto VP ON V.idvenda = VP.idvenda
WHERE V.data_venda BETWEEN '2021-07-08' AND '2021-07-10';







