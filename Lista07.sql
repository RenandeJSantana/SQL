--a) Criar as tabelas e Relacionamentos. 
create table ALUNOS 
(RM int, 
NOME varchar(45), 
CURSO INT, 
SERIE INT, 
PERIODO varchar(20), 
CONSTRAINT PK_AL PRIMARY KEY (RM), 
CONSTRAINT FK_ALU FOREIGN KEY (CURSO) 
    REFERENCES CURSOS (CODCURSO)); 

select * from ALUNOS 

create table CURSOS 
(CODCURSO INT, 
NOME varchar(20), 
CONSTRAINT PK_CUR PRIMARY KEY (CODCURSO)); 

select * from CURSOS 

create table DISCIPLINAS 
(CODISC INT, 
NOME varchar (20), 
CONSTRAINT PK_DIS PRIMARY KEY (CODISC)); 

select * from DISCIPLINAS 

create table NOTAS 
(RM INT, 
DISCIPL INT, 
NOTA1 NUMERIC (10,2), 
NOTA2 NUMERIC (10,2), 
CONSTRAINT PK_NOTT PRIMARY KEY (RM,DISCIPL), 
CONSTRAINT FK_N1 FOREIGN KEY (RM) 
    REFERENCES ALUNOS (RM), 
CONSTRAINT FK_N2 FOREIGN KEY (DISCIPL) 
    REFERENCES DISCIPLINAS (CODISC)); 

select * from NOTAS 

--b) Inserir 5 registros em cada tabela. 
insert into ALUNOS values 
(1234,'JACINTO REGO',100,3,'NOTURNO'), 
(4567,'MARIA PERERECA',200,4,'NOTURNO'), 
(7894,'MARIO ARMARIO',300,2,'MATUTINO'), 
(1478,'GESONEL WISPILON',400,5,'MATUTINO'), 
(2589,'ANA REGO',500,6,'NOTURNO'); 

insert into CURSOS values 
(100,'INFORMATICA'), 
(200,'DEV PLASTICO'), 
(300,'MECANICA'), 
(400,'LOGISTICA'), 
(500,'MODA'); 

insert into DISCIPLINAS values 
(1000,'MATEMATICA'), 
(2000,'LPII'), 
(3000,'BANCO DE DADOS'), 
(4000,'ESTRUTURA DE DADOS'), 
(5000,'VESTUARIO'); 

insert into NOTAS values 
(1234,1000,null,9), 
(4567,2000,4,10), 
(7894,3000,5,7), 
(1478,4000,null,9), 
(2589,1000,10,null); 

--c) Selecionar nome, período e série de todos os alunos do curso de Informática; 
select ALUNOS.NOME, ALUNOS.PERIODO, ALUNOS.SERIE from ALUNOS inner join CURSOS on CODCURSO = CURSO where ALUNOS.CURSO = 100; 

--d) Selecionar Nome do aluno, curso, nome da disciplina, nota1 e nota2, de todos os alunos. 
select ALUNOS.NOME, ALUNOS.CURSO, DISCIPLINAS.NOME, NOTAS.NOTA1, NOTAS.NOTA2  
from NOTAS inner join ALUNOS 
on NOTAS.RM = ALUNOS.RM 
inner join DISCIPLINAS 
on DISCIPLINAS.CODISC = NOTAS.DISCIPL; 

--e) Selecionar todas as notas do aluno (Seu nome); 
select ALUNOS.NOME, NOTAS.NOTA1, NOTAS.NOTA2 from ALUNOS inner join NOTAS on ALUNOS.RM = NOTAS.RM; 

--f) Selecionar RM, nome e curso de todos os alunos com nota1 superior a 8 na disciplina Matemática; 
select ALUNOS.RM, ALUNOS.NOME, ALUNOS.CURSO 
from NOTAS inner join ALUNOS 
on NOTAS.RM = ALUNOS.RM 
inner join DISCIPLINAS 
on DISCIPLINAS.CODISC = NOTAS.DISCIPL where CODISC = 1000; 

--g) Quantas notas (nota1) inferior a 6,0, em Banco de Dados, temos no Cadastro de Notas. 
select NOTAS.NOTA1 from NOTAS where NOTA1 < 6; 

--h) Qual a média de Notas (Nota2) na disciplina LPII? 
select avg (NOTA2) as 'MEDIA NOTAS2' from NOTAS inner join DISCIPLINAS on DISCIPLINAS.CODISC = DISCIPL where CODISC = 2000; 

--i) Quantos alunos temos no curso de Informática? 
select count (*) as 'QTDE ALUNOS' from ALUNOS inner join CURSOS on CURSOS.CODCURSO = CURSO where CODCURSO = 100; 

--j) Quantos alunos temos no curso de Plástico? 
select count (*) as 'QTDE ALUNOS' from ALUNOS inner join CURSOS on CURSOS.CODCURSO = CURSO where CODCURSO = 200; 

--k) Selecionar todos os alunos que não possuem Nota1. 
--select ALUNOS.NOME from ALUNOS inner join NOTAS on NOTAS.RM = ALUNOS.RM where NOTAS.NOTA1 = null; 
select ALUNOS.NOME 
from ALUNOS left outer join NOTAS 
on NOTAS.RM = Alunos.RM 
where NOTAS.NOTA1 is null; 

--l) Selecionar todos os alunos que não possuem Nota2. 
select ALUNOS.NOME 
from ALUNOS left outer join NOTAS 
on NOTAS.RM = ALUNOS.RM 
where NOTAS.NOTA2 is null; 

--m) Selecionar todos os alunos que não possuem Nota1 em Matemática. 
select ALUNOS.NOME 
from ALUNOS left outer join NOTAS 
on NOTAS.RM = ALUNOS.RM 
left outer join DISCIPLINAS 
on DISCIPLINAS.CODISC = NOTAS.DISCIPL where CODISC = 1000 and NOTA1 is null; 
