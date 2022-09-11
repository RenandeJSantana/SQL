--a) Criar as tabelas x relacionamentos 
create table Est_Cliente 
(CPF varchar(14), 
Nome varchar(40), 
Nascto datetime, 
CONSTRAINT PK_CIC PRIMARY KEY (CPF)); 

select * from Est_Cliente 

create table Est_Modelo 
(CodMod int, 
Descr varchar(40), 
CONSTRAINT PK_Mod PRIMARY KEY (CodMod)); 

select * from Est_Modelo 

create table Est_patio 
(Num int, 
ender varchar(40), 
capacidade int, 
CONSTRAINT PK_Patio PRIMARY KEY (Num)); 

select * from Est_patio 

create table Est_Veiculo 
(Placa varchar(8), 
Cliente_cpf varchar(14), 
Modelo int, 
Cor varchar(20), 
Ano int, 
CONSTRAINT PK_Veiculo PRIMARY KEY (Placa), 
CONSTRAINT FK_abc FOREIGN KEY (Cliente_CPF) 
    REFERENCES Est_Cliente (CPF), 
CONSTRAINT FK_def FOREIGN KEY (Modelo) 
    REFERENCES Est_Modelo (CodMod)); 

select * from Est_Veiculo 

create table Est_Estaciona 
(codigo int, 
patio_num int, 
placa_veic varchar(8), 
data_entr datetime, 
data_saida datetime, 
hora_entr varchar(10), 
hora_saida varchar(10), 
CONSTRAINT PK_GHI PRIMARY KEY (Codigo), 
CONSTRAINT FK_jkl FOREIGN KEY (placa_veic) 
    REFERENCES Est_Veiculo (Placa), 
CONSTRAINT FK_mno FOREIGN KEY (patio_num) 
    REFERENCES Est_patio (Num)); 

select * from Est_Estaciona 

--b) Inserir 5 registros em cada tabela; 
insert into Est_Cliente values 
(12345678900,'JACINTO REGO','19800320'), 
(12345678933,'PINSHER RAIVOSO','19501123'), 
(45645678933,'JOREL DA SILVA','19900123'), 
(12347878921,'JOAO DA LUZ','19830823'), 
(12345936933,'MARIA DA LUZ','19700911'); 

insert into Est_Modelo values 
(10,'FUSCA'), 
(20,'BRASILIA'), 
(30,'OPALA'), 
(40,'CAMARO'), 
(50,'VOLVO'); 

insert into Est_patio values 
(100,'R.DAS ANDORINHAS,23',200), 
(200,'R.XAVANTES, 30',300), 
(300,'AV. BARAO, 355',400), 
(400,'ROD. ANCHIETA, 2369',500), 
(500,'R.INDIO TIBIRICA,1825',600); 

insert into Est_Veiculo values 
('JJJ-2020',12345678900,10,'VERDE',1973), 
('JEX-1010',12345678933,20,'AZUL',1964), 
('REX-1500',45645678933,30,'PRETO',1974), 
('MIL-1100',12347878921,40,'AMARELO',2020), 
('TBT-2220',12345936933,50,'VERMELHO',2012); 

insert into Est_Estaciona values 
(1,100,'JJJ-2020','20220306','20220402','09:00:00','18:00:00'), 
(2,200,'JEX-1010','20220428','20220428','09:00:00','18:00:00'), 
(3,300,'REX-1500','20220426','20220427','09:00:00','21:00:00'), 
(4,400,'MIL-1100','20220420','20220423','10:00:00','16:00:00'), 
(5,500,'TBT-2220','20220410','20220412','09:00:00','16:00:00'); 

--c) Exiba a placa e o nome do dono de todos os veículos; 
select Est_Veiculo.placa, Est_Cliente.Nome from Est_Veiculo inner join Est_Cliente on CPF = Cliente_CPF; 

--d) Exiba o CPF e o nome do cliente que possui o veículo de placa JJJ-2020 
select Est_Cliente.nome, Est_Cliente.CPF from Est_Veiculo inner join Est_Cliente on CPF = Cliente_CPF where Est_Veiculo.Placa = 'JJJ-2020'; 

--e) Exiba a placa e a cor do veículo que possui o código de estacionamento 1; 
select Est_Veiculo.placa, Est_Veiculo.cor from Est_Estaciona inner join Est_Veiculo on placa_veic = placa where Est_Estaciona.codigo = 1; 

--f) Exiba a placa e o ano do veículo que possui o código de estacionamento 1; 
select Est_Veiculo.placa, Est_Veiculo.Ano from Est_Estaciona inner join Est_Veiculo on placa_veic = placa where Est_Estaciona.codigo = 1; 

--g) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000; 
select Est_Veiculo.placa, Est_Veiculo.cor, Est_Modelo.Descr from Est_Veiculo inner join Est_Modelo on Modelo = CodMod where Est_Veiculo.ano > 2000; 

--h) Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEX-1010” 
select Est_patio.ender, Est_Estaciona.data_entr, Est_Estaciona.data_saida from Est_Estaciona inner join Est_patio on Num = patio_num where Est_Estaciona.placa_veic = 'JEX-1010';  

--i) Exiba a quantidade de vezes os veículos de cor verde estacionaram. 
select count (*) as 'QTDE de vezes estacionadas' from Est_Estaciona inner join Est_Veiculo on placa_veic = placa where Est_Veiculo.cor = 'verde'; 

--j) Liste todos os clientes que possuem carro de modelo 1; 
select Est_Cliente.Nome, Est_Cliente.CPF from Est_Modelo inner join Est_Veiculo on CodMod = Modelo inner join Est_Cliente on Cpf = Cliente_cpf where Est_Modelo.CodMod = 10; 

--k) Liste as placas, os horários de entrada e saída dos veículos de cor verde; 
select Est_Veiculo.Placa, Est_Estaciona.data_entr, Est_Estaciona.data_saida from Est_Estaciona inner join Est_Veiculo on Placa = placa_veic where Cor = 'verde'; 

--l) Liste todos os estacionamentos do veículo de placa “JJJ-2020” 
select Est_patio.ender from Est_Estaciona inner join Est_patio on patio_num = Num where placa_veic =  'JJJ-2020'; 

--m) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2 
select Est_Cliente.Nome, Est_Cliente.CPF, Est_Estaciona.codigo from Est_Estaciona inner join Est_Veiculo on placa_veic = Placa inner join Est_Cliente on Cliente_cpf = CPF where codigo = 2; 

--n) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3; 
select Est_Cliente.CPF, Est_Estaciona.codigo from Est_Estaciona inner join Est_Veiculo on placa_veic = Placa inner join Est_Cliente on Cliente_cpf = CPF where codigo = 3; 

--o) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2; 
select Est_Modelo.Descr, Est_Estaciona.codigo from Est_Estaciona inner join Est_Veiculo on placa_veic = Placa inner join Est_Modelo on CodMod = Modelo where codigo = 2; 

--p) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos; 
select Est_Veiculo.Placa, Est_Cliente.Nome, Est_Modelo.Descr from Est_Modelo inner join Est_Veiculo on CodMod = Modelo inner join Est_Cliente on Cliente_cpf = CPF; 
