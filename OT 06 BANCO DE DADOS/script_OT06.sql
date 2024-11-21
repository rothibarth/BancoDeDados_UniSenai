use mercado;

DELIMITER //

CREATE TRIGGER check_salario_vendedorw
BEFORE UPDATE ON vendedor
FOR EACH ROW
BEGIN
    IF NEW.salario < OLD.salario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O salário não pode ser menor do que o já cadastrado.';
    END IF;
END; //


CREATE TRIGGER check_new_vendedor
BEFORE INSERT ON vendedor
FOR EACH ROW
BEGIN 
	IF NEW.salario < 1200.00 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'O salário inicial do vendedor não pode ser menor que R$1200,00.';
	END IF;
END; //

CREATE TRIGGER before_delete_vendedor
BEFORE DELETE ON vendedor
FOR EACH ROW
BEGIN
    DELETE FROM endereco WHERE vendedor_idvendedor = OLD.idvendedor;
    INSERT INTO Vendedores_desligados (idvendedor, nome, salario, data_nasc)
    VALUES (OLD.idvendedor, OLD.nome, OLD.salario, OLD.data_nasc);
END; //

DELIMITER ;

DROP TRIGGER check_delete_vendedor;




/*
Explicação
DELIMITER: Altera o delimitador padrão para //, permitindo a 
definição de múltiplas instruções dentro da trigger.
CREATE TRIGGER: Cria a trigger chamada check_salario_vendedor 
que será acionada antes de uma atualização na tabela vendedores.
BEFORE UPDATE: Especifica que a trigger é executada antes de 
qualquer operação de atualização.
FOR EACH ROW: Indica que a trigger é aplicada a cada linha 
afetada pela atualização.
IF NEW.salario < OLD.salario: Verifica se o novo salário 
(NEW.salario) é menor que o salário atual (OLD.salario).
SIGNAL SQLSTATE '45000': Gera um erro personalizado se a 
condição for verdadeira, com a mensagem especificada.*/

SHOW TRIGGERS;

UPDATE vendedor
SET salario = 2500.00
WHERE idvendedor = 2;  -- Supondo que o ID do vendedor seja 1

INSERT INTO `vendedor` (`nome`, `salario`, `data_nasc`) VALUES
('Silvao Damassa', 1100.00, '1950-02-12');

ALTER TABLE endereco
DROP FOREIGN KEY fk_endereco_vendedor;  -- Altere para o nome correto da chave estrangeira

ALTER TABLE endereco
ADD CONSTRAINT fk_endereco_vendedor
FOREIGN KEY (vendedor_idvendedor)
REFERENCES vendedor(idvendedor)
ON DELETE CASCADE;


DELETE FROM vendedor WHERE idvendedor = 1;

