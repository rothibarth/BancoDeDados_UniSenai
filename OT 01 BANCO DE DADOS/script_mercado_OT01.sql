create database mercado;

use mercado;

CREATE TABLE categoria (
idcategoria int not null primary key auto_increment,
descricao varchar(45));

insert into `categoria` values (1, 'Higiene pessoal');
insert into `categoria` values (2, 'Limpeza');
insert into `categoria` values (3, 'Cama, mesa e banho');
insert into `categoria` values (4, 'Frios');
insert into `categoria` values (5, 'Bazar');