--a) Criar as tabelas x Relacionamentos 
create table CLIENTES 
(Codcli int, 
Nome varchar(30), 
Endereço varchar(40), 
Cidade varchar(30), 
Fone char(9), 
CONSTRAINT PK_COD PRIMARY KEY (Codcli)); 

select * from CLIENTES 

create table TRANSPORTADORA 
(Codigo int, 
Nome varchar(20), 
CONSTRAINT PK_CODT PRIMARY KEY (Codigo)); 

select * from TRANSPORTADORA 

create table PEDIDOS 
(NumPed int, 
Codcli int, 
Data_Entrega datetime, 
Codigo int, 
CONSTRAINT PK_NUM PRIMARY KEY (NumPed), 
CONSTRAINT FK_CODC FOREIGN KEY (Codcli) 
    REFERENCES Clientes (codcli), 
CONSTRAINT FK_CODR FOREIGN KEY (Codigo) 
    REFERENCES Transportadora (Codigo)); 

select * from PEDIDOS 

--b) Inserir 5 registros em cada tabela. 
insert into CLIENTES values 
(010,'Jacinto Silva','Rua Xavier da Luz','Mauá','12345678'), 
(020,'Jacinto Rego','Rua Lá Longe','Santo André','12345687'), 
(030,'Isadora Pinto','Rua Zero','SBC','21345678'), 
(040,'Ines Kescível','Rua Esqueci','Esquisito Perigoso','12366678'), 
(050,'Coelho da Pascoa','Toca','Rio Grande das Trevas','12355578'); 

insert into TRANSPORTADORA values 
(100,'Transp ABC'), 
(200,'Transp Logi'), 
(300,'Transp Violeta'), 
(400,'Transp Cometa'), 
(500,'Transp JSL'); 

insert into PEDIDOS values 
(1000,010,'20220414',100), 
(2000,020,'20220314',200), 
(3000,030,'20210314',100), 
(4000,040,'20200314',400), 
(5000,050,'20220410',300); 

--c) Selecionar todos os pedidos da transportadora ABC. 
select * from PEDIDOS where Codigo like 100; 

--d) Quantos pedidos existem para o cliente 2? 
select count (*) as 'QTDE Pedidos' from PEDIDOS where Codcli like 020; 

--e) Qual o número do Pedido mais recente? 
select max(Data_Entrega) as 'MAIS RECENTE' from PEDIDOS; 

--f) Temos quantos pedidos para a Transportadora ABC? 
select count (*) as 'QTDE Pedidos' from PEDIDOS where Codigo like 100; 

--g) Quantos Clientes residem em Mauá? 
select count (*) as 'QTDE Clientes' from CLIENTES where Cidade like 'Mauá'; 

--h) Selecionar Número do Pedido, Data_Entrega e Nome do Cliente. 
--select PEDIDOS.NumPed, PEDIDOS.Data_Entrega, CLIENTES.Nome from CLIENTES, PEDIDOS where CLIENTES.Codcli = PEDIDOS.Codcli;   
select PEDIDOS.NumPed, PEDIDOS.Data_Entrega, CLIENTES.Nome from CLIENTES inner join PEDIDOS on CLIENTES.Codcli = PEDIDOS.Codcli;  

--i) Selecionar Número do Pedido, Nome do Cliente e nome da Transportadora. 
--select PEDIDOS.NumPed, CLIENTES.Nome, TRANSPORTADORA.Nome from CLIENTES, PEDIDOS, TRANSPORTADORA where CLIENTES.Codcli = PEDIDOS.Codcli and PEDIDOS.Codigo = TRANSPORTADORA.Codigo; 
select PEDIDOS.NumPed, CLIENTES.Nome, TRANSPORTADORA.Nome from PEDIDOS inner join CLIENTES on CLIENTES.Codcli = PEDIDOS.Codcli inner join TRANSPORTADORA on PEDIDOS.Codigo = TRANSPORTADORA.Codigo; 

--j) Selecionar todos os clientes da cidade de Santo André, Mauá e SBC. 
select * from CLIENTES where Cidade in ('Santo André','Mauá','SBC');  
