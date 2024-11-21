USE mercado;

DELIMITER //

-- Trigger para verificar salário ao atualizar
CREATE TRIGGER check_salario_vendedor
BEFORE UPDATE ON vendedor
FOR EACH ROW
BEGIN
    IF NEW.salario < OLD.salario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O salário não pode ser menor do que o já cadastrado.';
    END IF;
END; //

-- Trigger para verificar salário mínimo ao inserir
CREATE TRIGGER check_new_vendedor
BEFORE INSERT ON vendedor
FOR EACH ROW
BEGIN 
    IF NEW.salario < 1200.00 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O salário inicial do vendedor não pode ser menor que R$1200,00.';
    END IF;
END; //

-- Trigger para mover vendedor excluído para a tabela `Vendedores_desligados`
CREATE TRIGGER before_delete_vendedor
BEFORE DELETE ON vendedor
FOR EACH ROW
BEGIN
    -- Certifique-se de que o endereço correspondente ao vendedor seja excluído
    DELETE FROM endereco WHERE vendedor_idvendedor = OLD.idvendedor;

    -- Insere os dados do vendedor excluído na tabela `Vendedores_desligados`
    INSERT INTO Vendedores_desligados (idvendedor, nome, salario, data_nasc)
    VALUES (OLD.idvendedor, OLD.nome, OLD.salario, OLD.data_nasc);
END; //

DELIMITER ;

-- Ajuste de chave estrangeira (caso necessário)
ALTER TABLE endereco
DROP FOREIGN KEY fk_endereco_vendedor;  -- Certifique-se de usar o nome correto da chave estrangeira

ALTER TABLE endereco
ADD CONSTRAINT fk_endereco_vendedor
FOREIGN KEY (vendedor_idvendedor)
REFERENCES vendedor(idvendedor)
ON DELETE CASCADE;

-- Exibição de triggers no banco de dados
SHOW TRIGGERS;

-- Testando as triggers:
-- 1. Atualizando salário
UPDATE vendedor
SET salario = 2500.00
WHERE idvendedor = 2;

-- 2. Inserindo um vendedor com salário abaixo de R$1200,00 (deve falhar)
INSERT INTO vendedor (nome, salario, data_nasc)
VALUES ('Silvao Damassa', 1100.00, '1950-02-12');

-- 3. Deletando um vendedor e movendo para `Vendedores_desligados`
DELETE FROM vendedor WHERE idvendedor = 1;
