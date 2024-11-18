use mercado;

create table vendedor(
idvendedor int not null  primary key auto_increment,
nome varchar(45),
salario float(50),
data_nasc varchar(45));

create table endereco(
idendereco int not null primary key auto_increment,
rua varchar(45),
bairro varchar(45),
numero int(50),
cidade varchar(45));

/* atvd 2*/

CREATE VIEW vendasDia AS
SELECT 
    V.data_venda AS DataVenda,
    P.descricao AS Produto
FROM 
    Vendas V
JOIN 
    vendas_has_produto VP ON V.idvenda = VP.idvenda
JOIN 
    Produto P ON VP.idproduto = P.idproduto
ORDER BY 
    V.data_venda DESC;
    
SELECT * FROM vendasDia;

/* atvd 3*/

CREATE VIEW QtdVendas AS
SELECT 
    COUNT(*) AS TotalVendas
FROM 
    Vendas;

select * from QtdVendas;