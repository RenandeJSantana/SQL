create table empregados
(
matr char(6),
nome varchar(12),
sobrenome varchar(15),
dept char(10),
fone varchar(14),
data_adm datetime,
cargo char(10),
sexo char(1),
idade int,
salario numeric(10,2),
comissao numeric(10,2),
constraint pk_matr primary key (matr)
);

select * from empregados;

--b) Inserir 10 registros
insert into empregados values 
('1','Ridovaldo','Santos','engenharia','45450000','20000203','ceo','M',73,235000.00,.70),
('2','Fernando','Lopes','engenharia','45450001','20010402','crm','M',45,150000.00,.60),
('3','Amanda','Ferreira','operacoes','45450002','20010402','head','F',40,100000.00,.50),
('4','Lucas','Goncalves','operacoes','45450003','20020704','gerente','M',35,50000.00,.40),
('5','Alana','Rizzo','operacoes','45450004','20021012','analista_s','F',42,30000.00,.35),
('6','Carolina','Brum','ti','45450005','20010402','analista_s','F',37,30000.00,.35),
('7','Luiza','Santana','ti','45450006','20031123','analista_p','F',28,25000.00,.25),
('8','Joice','Soares','vendas','45450007','20010402','supervisor','F',32,20000.00,.30),
('9','Marcus','Felipe','vendas','45450008','20030620','operador','M',24,10000.00,.20),
('10','Nathan','Mourao','vendas','45450009','20040803','operador','M',20,10000.00,.20);

--c) Selecionar o sobrenome, primeiro nome, departamento, data de adimissão e salário de todos os empregados que ganham mais de R$5000
select sobrenome, nome, dept, data_adm, salario from empregados where salario > 5000.00;

--d) Qual a media de salarios dos funcionarios?
select avg(salario) as 'media_salario' from empregados;

--e) Quantos funcionarios pertencem ao departamento de TI?
select count(dept) as 'dept_ti' from empregados where dept = 'ti';

--f) Quantos funcionarios temos com cargo igual a ANALISTA?
select count(cargo) as 'cargo_analista' from empregados where cargo like 'a%';

--g) Qual o somatorio dos salarios?
select sum(salario) as 'total_salarios' from empregados;

--h) Qual o valor do maior salario?
select max(salario) as 'maior_salario' from empregados;

--i) Qual o valor do menor salario?
select min(salario) as 'menor_salario' from empregados;

--j) Atribuir um aumento de 5% aos funcionários do departamento de TI
update empregados set salario = salario * 1.05 where dept = 'ti';

--k) Selecionar os cargos (sem duplicidade)
select distinct cargo from empregados;

--l) Selecionar os funcionarios com idade entre 30 e 40 anos (inclusive)
select * from empregados where idade >= 30 and idade <=40;

--m) Qual a media de idades?
select avg(idade) as 'media_idade' from empregados;

--n) Selecionar todos os funcionarios com idade entre 20 e 30 anos (inclusive) do departamento de TI
select * from empregados where idade between 20 and 30 and dept = 'ti';

--o) Selecionar todos os funcionarios cujo nome inicia-se pela letra 'J'
select * from empregados where nome like 'j%';

--p) Selecionar todos os funcionarios dos departamentos de TI, Vendas e Marketing
select * from empregados where dept = 'ti' or dept = 'vendas' or dept = 'marketing';
