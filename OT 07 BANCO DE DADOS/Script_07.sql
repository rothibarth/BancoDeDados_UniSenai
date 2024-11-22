DELIMITER // 
/*atvd 1*/

CREATE PROCEDURE AtualizarPrecoProduto (
    IN produtoID INT,
    IN novoPreco DECIMAL(10, 2)
)
BEGIN
    UPDATE produto
    SET preco = novoPreco
    WHERE idproduto = produtoID;
END //

DELIMITER ;

CALL AtualizarPrecoProduto(1, 25.50);

/*atvd 2*/

DELIMITER //

CREATE PROCEDURE AumentarPrecoTodosProdutos ()
BEGIN
    UPDATE produto
    SET preco = preco * 1.10; -- Multiplica o preço atual por 1.10 (10% de aumento)
END //

DELIMITER ;

CALL AumentarPrecoTodosProdutos();

/*atvd 3*/

DELIMITER //

CREATE PROCEDURE AumentarPrecoPorQuantidadeVendida (
    IN produtoID INT
)
BEGIN
    DECLARE quantidadeVendida INT;
    DECLARE aumentoPercentual DECIMAL(5, 2);

    -- Soma a quantidade total vendida do produto
    SELECT SUM(quantidade) INTO quantidadeVendida
    FROM vendas_has_produto
    WHERE idproduto = produtoID;

    -- Calcula o aumento percentual (em formato decimal)
    SET aumentoPercentual = 1 + (quantidadeVendida / 100.00);

    -- Atualiza o preço do produto
    UPDATE produto
    SET preco = preco * aumentoPercentual
    WHERE idproduto = produtoID;
END //

DELIMITER ;

CALL AumentarPrecoPorQuantidadeVendida(1);
