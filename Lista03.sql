create table CLIENTE 
(Codcli int, 
Nome varchar(30), 
Ender varchar(40), 
Bairro varchar(20), 
Cidade varchar(20), 
Idade int, 
CONSTRAINT PK_CLIENTE PRIMARY KEY(Codcli)); 

select * from CLIENTE 

insert into CLIENTE values 
(001,'JOSE','RUA XAVANTES','ESQUISITO PERIGOSO','SANTO ANDRE',20), 
(002,'MARIA','RUA DOS PERDIDOS','NINGUEM CONHECE','MAUA',40), 
(003,'FREDERICO','RUA DOS CHAVES','VILA DOS CHAVES','SBC',28), 
(004,'FLORINDA','RUA DOS MACACOS','FLORESTA','SCS',17), 
(005,'JAIMINHO','RUA ESQUECIDA','TANGAMANDAPIO','SANTO ANDRE',20); 

create table PRODUTOS 
(Codprod int, 
Descricao varchar(20), 
Preco numeric(9,2), 
CONSTRAINT PK_PRODUTO PRIMARY KEY(Codprod)); 

select * from PRODUTOS 

insert into PRODUTOS values
(100,'CELULAR',14000), 
(200,'CARREGADOR',70), 
(300,'FONE',50), 
(400,'CAPA',30), 
(500,'PELICULA',10); 

create table PEDIDOS 
(Codped int, 
Codcli int, 
Data datetime, 
CONSTRAINT PK_Pedidos PRIMARY KEY(Codped)); 

select * from PEDIDOS 

insert into PEDIDOS values 
(1000,001,'20220123'), 
(2000,002,'20220228'), 
(3000,003,'20211224'), 
(4000,004,'20211224'), 
(5000,005,'20211223'); 

create table ITENS_PEDIDO 
(CODPED INT, 
CODPROD INT, 
QTDE INT, 
CONSTRAINT PK_ITENS PRIMARY KEY(CODPED,CODPROD), 
CONSTRAINT FK_PED FOREIGN KEY(CODPED) 
    REFERENCES PEDIDOS(CODPED), 
CONSTRAINT FK_PROD FOREIGN KEY(CODPROD) 
    REFERENCES PRODUTOS(CODPROD)); 

select * from ITENS_PEDIDO 

insert into ITENS_PEDIDO values 
(1000,100,2), 
(2000,200,3), 
(3000,300,4), 
(4000,400,5), 
(5000,500,4); 

--c) Selecionar todos os produtos com preço entre 10 e 70. 
select * from PRODUTOS where Preco between 10 and 70; 

--d) Qual a média de idade dos clientes 
select avg(IDADE) as 'MÉDIA IDADE' from CLIENTE; 

--e) Qual a média de preços dos produtos 
select avg(PRECO) as 'MÉDIA PRECOS' from PRODUTOS; 

--f) Quantos pedidos temos no cadastro? 
select count (*) as 'QTDE PEDIDOS' from PEDIDOS; 

--g) Selecionar todos os clientes que moram em Santo André, SBC, SCS ou Mauá. 
select * from CLIENTE where CIDADE in ('SANTO ANDRE','SBC','SCS','MAUA'); 
