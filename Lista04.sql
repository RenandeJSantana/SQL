--a) Criar as seguintes tabelas: 
create table CDS 
(Codigo int, 
Nome varchar(30), 
codgrav int, 
Data_Compra datetime, 
Valor_pago Numeric(10,2), 
Local_Compra varchar(20), 
Album int, 
CONSTRAINT PK_COD PRIMARY KEY (Codigo), 
CONSTRAINT FK_GRAV FOREIGN KEY (codgrav) 
    REFERENCES GRAVADORA (codgrav)); 

drop table CDS 

select * from CDS 

create table GRAVADORA 
(codgrav int, 
Nome_grav varchar(20), 
CONSTRAINT PK_GRAV PRIMARY KEY(codgrav)); 

select * from GRAVADORA 

--b) Inserir 10 registros na tabela CDS e 5 registros na tabela GRAVADORA. 
insert into CDS values 
(010,'FERNANDO E SOROCABA',100,'20201014',30,'AMERICANAS',0), 
(020,'ANA CAROLINA',200,'20191116',35,'AMAZON',1), 
(022,'CHARLIE BROW JR',200,'20010623',20,'SARAIVA',0), 
(023,'LEGIÃO URBANA',400,'20001129',120,'AMAZON',1), 
(030,'BELQUIOR ALUCINACOES',300,'19991107',100,'SUBMARINO',1), 
(040,'ADONIRA BAROBOSA',400,'20161014',45,'SARAIVA',0), 
(050,'ZECA PAGODINHO',100,'20110123',60,'AMAZON',1), 
(060,'ARLINDO CRUZ',200,'20090708',55,'AMERICANAS',0), 
(070,'GABRIEL PENSADOR',500,'20060308',70,'SARAIVA',1), 
(080,'SEU JORGE',500,'20101028',40,'SARAIVA',0), 
(090,'BEZERRA',300,'19971225',25,'AMERICANAS',1), 
(100,'RAIMUNDOS',500,'20010320',32,'SUBMARINO',0); 

insert into GRAVADORA values 
(100,'SONY'), 
(200,'MULTISHOW'), 
(300,'FALECEU'), 
(400,'GLOBO'), 
(500,'NOVAERA'); 

--c) Selecionar todos os CDs. 
select * from CDS; 

--d) Selecionar os campos nome e data_compra da tabela CDS. 
select NOME, DATA_COMPRA from CDS; 

--e) Exibir o total gasto com a compra dos Cds. 
select sum(VALOR_PAGO) as 'TOTAL GASTO' from CDS; 

--f) Mostre a quantidade de Cds. 
select count (*) as 'QTDE CDS' from CDS; 

--g) Mostre o nome de todos cds comprados no Submarino. 
select * from CDS where LOCAL_COMPRA like 'SUBMARINO'; 

--h) Mostrar todos os cds que são álbuns. 
select * from CDS where ALBUM like 1; 

--i) Mostre o valor do cd que custou mais caro. 
select max(VALOR_PAGO) as 'MAIS CARO' from CDS; 

--j) Mostrar todos os CDs que tem nome iniciado pela letra “R”. 
select * from CDS where NOME like 'R%';

--k) Mostrar a média de preços dos CDs. 
select avg(VALOR_PAGO) as 'MÉDIA PREÇOS' from CDS; 

--l) Quantos CDs foram comprados na Americanas? 
select * from CDS where LOCAL_COMPRA like 'AMERICANAS'; 

--m) Atualizar o preço dos CDs reajustando em 10%. 
update  CDS 
set VALOR_PAGO = VALOR_PAGO*1.10; 

--n) Mostrar todos os CDs comprados no Submarino, Americanas e Saraiva. 
select * from CDS where LOCAL_COMPRA in ('SUBMARINO','AMERICANAS','SARAIVA'); 

--o) Mostrar todos os CDs com código entre 20 e 30 inclusive. 
select * from CDS where CODIGO between 20 and 30; 

--p) Mostrar todos os CDs cujo valor pago seja maior que 25,00. 
select * from CDS where VALOR_PAGO > 25; 

--q) Mostrar o preço do CD mais barato. 
select min(VALOR_PAGO) as 'MAIS BARATO' from CDS; 

--r) Mostrar todos os locais de compra, sem duplicidade. 
select distinct LOCAL_COMPRA from CDS; 
