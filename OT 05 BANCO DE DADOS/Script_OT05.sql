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
