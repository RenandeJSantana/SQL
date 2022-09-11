create table SOCIOS 
(CODSOC    INT, 
NOME    VARCHAR(40), 
CONSTRAINT PK_SOC PRIMARY KEY(CODSOC)); 

create table EMPRESTIMOS 
(CODEMP    INT, 
CODSOC    INT, 
DATA    DATETIME, 
CONSTRAINT PK_EMP PRIMARY KEY(CODEMP), 
CONSTRAINT FK_EMP FOREIGN KEY(CODSOC) 
    REFERENCES SOCIOS(CODSOC)); 

insert into SOCIOS values 
(1,'JOÃO'), 
(2,'MARIA'), 
(3,'PAULA'); 

insert into EMPRESTIMOS values 
(1,1,'20220320'), 
(2,3,'20220415'); 

select SOCIOS.*, EMPRESTIMOS.* 
from SOCIOS left outer join EMPRESTIMOS 
on SOCIOS.CODSOC = EMPRESTIMOS.CODSOC; 
--where EMPRESTIMOS.CODSOC IS NOT NULL; 
