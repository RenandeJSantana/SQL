create table clientes
(
codcli int,
nome varchar(40),
idade int,
data_cad datetime,
valor_inv numeric(10,2),
constraint pk_cod primary key (codcli)
);

--selecionar todos os registros
select * from clientes;

--selecionar código e nome dos clientes
select codcli, nome from clientes;

--inserir 1 registro
insert into clientes values
(1,'RENAN',24,'20220310',150.50);

insert into clientes values
(2,'KAREN',24,'20220310',1000),
(3,'JOAO',33,'20220310',650.4),
(4,'MARIA',52,'20220310',4500.00);

insert into clientes (codcli,nome) values
(5,'FELIPE');

--excluir estrutura da tabela e registros
drop table clientes;

--funcoes de agregacao
--qtos clientes temos no cadastro?
select count(*) as 'qtde cli' from clientes;

--qual o total de valores investidos?
select sum(valor_inv) as 'total inv' from clientes;

--qual a media de idade dos clientes
select avg(idade) as 'media idade' from clientes;

--qual o maior valor investido?
select max(valor_inv) as 'maior valor' from clientes;

--qual o menor valor investido?
select min(valor_inv) as 'menor valor' from clientes;

--atualizar o valor investido acrescentando 10%
update clientes set valor_inv = valor_inv * 1.10;

--atualizar com debito de 5%
update clientes set valor_inv = valor_inv * 0.95;

--reajustar em 10% os valores abaixo de 1000
update clientes set valor_inv = valor_inv * 1.10 where valor_inv < 1000;

--selecionar todos com idade > 30
select * from clientes where idade > 30;

--selecionar todos com idade entre 20 e 40 inclusive
select * from clientes where idade >= 20 and idade <=40;

--ou usando between
select * from clientes where idade between 20 and 40;

--selecionar todos de nome 'MARIA' ou 'JOAO'
select * from clientes where nome = 'MARIA' or nome = 'JOAO';

--ou usando clausula in
select * from clientes where nome in ('MARIA','JOAO');

--excluir o cliente de codigo 5
delete from clientes where codcli = 5;

insert into clientes values
(5,'MARIA',67,'20220310',1500.50);

--listar os nome sem repeticao
select distinct nome from clientes;

--listar todos com o nome iniciado pela letra 'M'
select * from clientes where nome like 'M%';

--listar todos com o nome terminado pela letra 'A'
select * from clientes where nome like '%A';
