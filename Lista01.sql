--a) Criar a tabela Produtos
create table produtos
(
codProd int,
descricao varchar(20),
preco numeric(9,2),
qtde int,
cor char(20),
constraint pk_codP primary key (codProd)
);

select * from produtos;

--b) Inserir 10 registros
insert into produtos values
(1,'whiskey',200.00,5,'red'),
(2,'cantinho do vale',8.00,20,'roxo'),
(3,'corotinho',2.00,50,'free'),
(4,'suco mid',1.00,50,'free'),
(5,'guarana',3.50,30,'verde'),
(6,'redbull',10.00,20,'azul'),
(7,'litrao skol',9.00,100,'amarelo'),
(8,'gin',80.00,40,'branco'),
(9,'jagermeister',150.00,30,'verde'),
(10,'amarula',60.00,50,'amarelo');

--c) Quantos produtos temos no cadastro?
select count(*) as 'codProd' from produtos;

--d) Selecionar os produtos com preço entre 10 e 50 reais
select * from produtos where preco between 10 and 50;

--e) Qual o valor do produto mais caro?
select max(preco) as 'mais caro' from produtos;

--f) Qual o valor do produto mais barato?
select min(preco) as 'mais barato' from produtos;

--g) Qual a media dos precos?
select avg(preco) as 'media de precos' from produtos;

--h) Quantos produtos vermelhos temos no cadastro?
select * from produtos where cor = 'red';

--i) Atualizar o preco dos produtos com preco abaixo de 10.00 acrescentando 15%
update produtos set preco = preco * 1.15 where preco < 10;

--j) Atualizar o preco dos produtos com preco acima de 100.000 com um desconto de 5% 
update produtos set preco = preco * 0.95 where preco > 100;

--k) Excluir todos os produtos com qtde abaixo de 5 
delete from produtos where qtde <= 5;

--l) Listar as cores sem duplicidade
select distinct cor from produtos;

--m) Selecionar todos os produtos de cor azul, vermelho, branco e preto
select * from produtos where cor in ('azul','vermelho','branco','preto');

--n) Qual o somatório das quantidades?
select sum(qtde) as 'total estoque' from produtos;

--o) Listar todos os produtos que tem descricao iniciado em 'A'
select * from produtos where descricao like 'A%';
