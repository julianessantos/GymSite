-- AREA PARA TABELAS DO SISTEMA GYMSITE -------------------------

-- Criando a tabela USUARIOS do sistema
create table USUARIO (
cpf varchar(11) not null,
nome varchar(30) not null,
nascimento date not null,
telefone varchar(20),
email varchar(30),
senha varchar(16),
primary key (cpf)
) default charset=utf8mb4;

-- Criando a tabela CLIENTE do sistema
create table CLIENTE_ALUNO (
id_cliente int not null auto_increment,
cpf_cliente varchar(11) not null,
primary key (id_cliente),
foreign key (cpf_cliente) references USUARIO(cpf)
) default charset=utf8mb4;

-- Criando a tabela PERSONAL
create table PERSONAL (
id_personal int not null auto_increment,
cpf_personal varchar(11) not null,
primary key (id_personal)
) default charset=utf8mb4;

-- Criando a tabela GERENTE
create table GERENTE (
id_gerente int not null auto_increment,
cpf_gerente varchar(11) not null,
primary key (id_gerente)
) default charset=utf8mb4;

-- Criando a tabela MODALIDADE
create table MODALIDADE (
id_modalidade int not null auto_increment,
nome varchar(11) not null,
primary key (id_modalidade)
) default charset=utf8mb4;

-- Criando a tabela EXERCICIO
create table EXERCICIO (
id_exercicio int not null auto_increment,
nome_exer varchar(20) not null,
primary key (id_exercicio)
) default charset=utf8mb4;

-- Criando a tabela MODALIDADE_PERSONAL
create table MODALIDADE_PERSONAL (
id_personal int not null,
id_modalidade int not null,
foreign key (id_personal) references PERSONAL(id_personal),
foreign key (id_modalidade) references MODALIDADE(id_modalidade)
) default charset=utf8mb4;

-- Criando a tabela MODALIDADE_CLIENTE
create table MODALIDADE_CLIENTE (
id_cliente int not null,
id_modalidade int not null,
foreign key (id_cliente) references CLIENTE_ALUNO(id_cliente),
foreign key (id_modalidade) references MODALIDADE(id_modalidade)
) default charset=utf8mb4;

-- Criando a tabela TREINO
create table TREINO (
id_cliente int not null,
id_exercicio int not null,
serie int not null,
rept int not null,
tipo_de_treino char(1) not null,
foreign key (id_cliente) references CLIENTE_ALUNO(id_cliente),
foreign key (id_exercicio) references EXERCICIO(id_exercicio)
) default charset=utf8mb4;

-- Criando a tabela AVALIACAO
create table AVALIACAO (
id_cliente int not null,
id_personal int not null,
altura float not null,
peso float not null,
med_braco float not null,
med_coxa float not null,
med_cintura float not null,
foreign key (id_cliente) references CLIENTE_ALUNO(id_cliente),
foreign key (id_personal) references PERSONAL(id_personal)
) default charset=utf8mb4;

-- Criando a tabela PRODUTO
create table PRODUTO (
id_produto int not null auto_increment,
nome_produto varchar(20) not null,
primary key (id_produto)
) default charset=utf8mb4;

-- Criando a tabela CLIENTE_COMPRA_PRODUTO
create table CLIENTE_COMPRA_PRODUTO (
id_cliente int not null,
id_produto int not null,
quantidade int not null,
data_venda date not null,
foreign key (id_cliente) references CLIENTE_ALUNO(id_cliente),
foreign key (id_produto) references PRODUTO(id_produto)
) default charset=utf8mb4;

-- Criando a tabela GERENTE_CADASTRA_PRODUTO
create table GERENTE_CADASTRA_PRODUTO (
id_gerente int not null,
id_produto int not null,
quantidade int not null,
data_cadas date not null,
foreign key (id_gerente) references GERENTE(id_gerente),
foreign key (id_produto) references PRODUTO(id_produto)
) default charset=utf8mb4;

-- -------------------------------------- INSERÇÃO DE DADOS ------------------------------------------

-- Criano usuarios para a tabela usuarios
insert into usuario values ('00000000001','ANELMA','1995-10-10','84992102818','ANELMA@GMAIL.COM','TESTE1');
insert into usuario values ('00000000002','EDUARDO','2000-04-21','84999999999','EDUARDO@GMAIL.COM','TESTE2');
insert into usuario values ('00000000003','PERS1','1981-11-21','84987453241','PERS1@GMAIL.COM','TESTE3');
insert into usuario values ('00000000004','PERS2','1989-01-27','84991325674','PERS2@GMAIL.COM','TESTE4');
insert into usuario values ('00000000005','G1','1973-05-12','84999876531','G1@GMAIL.COM','TESTE5');

-- Inseridos usuarios do tipo CLIENTE_ALUNO na tabela dos CLIENTE_ALUNO
insert into CLIENTE_ALUNO values (1,'00000000001');
insert into CLIENTE_ALUNO values (2,'00000000002');

-- Inseridos usuarios do tipo PERSONAL na tabela dos PERSONAL
insert into PERSONAL values (1,'00000000003'), (2,'00000000004');

-- Inseridos usuarios do tipo GERENTE na tabela dos GERENTE
insert into GERENTE values (1,'00000000005');

-- Inserindo os tipos de treinos na tabela EXERCICIO
insert into EXERCICIO values (1,'LEG PRESS 45'), (2,'EXTENSORA'),(3,'PUXADOR'), (4,'REMADA BAIXA'),(5,'SUPINO RETO');

-- Inserindo os tipos de treinos na tabela TREINO
insert into TREINO values (1,1,4,12,'A'), (1,4,4,15,'B'),(2,1,4,12,'A'),(2,5,4,15,'B');

-- Inserindo os tipos de treinos na tabela MODALIDADE
insert into MODALIDADE values (1,'MUSCULAÇÃO'), (2,'BOXE'),(3,'MUSCU_BOXE');

-- Inserindo os tipos de treinos na tabela MODALIDADE_CLIENTE
insert into MODALIDADE_CLIENTE values (1,1), (2,1);

-- Inserindo os tipos de treinos na tabela MODALIDADE_PERSONAL
insert into MODALIDADE_PERSONAL values(1,1), (2,2);

-- Inserindo os tipos de treinos na tabela AVALIACAO
insert into AVALIACAO values (1,1,1.71, 93.5,87.3,112.1,100.2),(2,1,1.91, 99.5,94.2,87.8,76.4);

-- Inserindo os tipos de treinos na tabela PRODUTO
insert into PRODUTO values(1,'WHEY'), (2,'CREATINA'),(3,'CAMISA'),(4,'GARRAFA');

-- Inserindo os tipos de treinos na tabela CLIENTE_COMPRA_PRODUTO
insert into CLIENTE_COMPRA_PRODUTO values(1,1,4,'2023-12-11'), (1,2,2,'2023-12-11'),(2,1,2,'2023-11-11'),(2,3,1,'2023-12-11');

-- Inserindo os tipos de treinos na tabela GERENTE_CADASTRA_PRODUTO
insert into GERENTE_CADASTRA_PRODUTO values(1,1,10,'2023-09-02'), (1,2,8,'2023-10-07'),(1,3,50,'2023-02-05'),(1,4,25,'2023-04-03');

-- ------------------------------- VISUALIZAR TABELAS --------------------------------------------
select * from USUARIO;
select * from CLIENTE_ALUNO;
select * from PERSONAL;
select * from EXERCICIO;
select * from TREINO;
select * from MODALIDADE;
select * from MODALIDADE_CLIENTE;
select * from MODALIDADE_PERSONAL;
select * from AVALIACAO;
select * from PRODUTO;
select * from CLIENTE_COMPRA_PRODUTO;
select * from GERENTE_CADASTRA_PRODUTO;

-- -------------------------------------- CONSULTAS -------------------------------------------------
 
-- CONSULTA A TABELA TREINO INDICANDO O USUARIO, O NOME DO EXERCICIOS E AS EXECUÇÕES DE CADA EXER CICIO
SELECT USUARIO.nome, EXERCICIO.nome_exer, TREINO.serie, TREINO.rept
FROM TREINO INNER JOIN EXERCICIO ON TREINO.id_exercicio = EXERCICIO.id_exercicio INNER JOIN CLIENTE_ALUNO 
ON TREINO.id_cliente = CLIENTE_ALUNO.id_cliente INNER JOIN USUARIO ON CLIENTE_ALUNO.cpf_cliente = USUARIO.cpf;

-- CONSULTA A TABELA CLIENTE_COMPRA_PRODUTO INDICANDO O USUARIO, O NOME DO PRODUTO, QUANTIDADE E DATA DA VENDA
SELECT USUARIO.nome, PRODUTO.nome_produto, CLIENTE_COMPRA_PRODUTO.data_venda FROM CLIENTE_COMPRA_PRODUTO INNER JOIN PRODUTO ON PRODUTO.id_produto = CLIENTE_COMPRA_PRODUTO.id_produto 
INNER JOIN CLIENTE_ALUNO ON CLIENTE_COMPRA_PRODUTO.id_cliente = CLIENTE_ALUNO.id_cliente 
INNER JOIN USUARIO ON CLIENTE_ALUNO.cpf_cliente = USUARIO.cpf;


-- CONSULTA A TABELA GERENTE_CADASTRA_PRODUTO INDICANDO O GERENTE, O NOME DO PRODUTO, QUANTIDADE E DATA DO CASTRADO
SELECT USUARIO.nome, PRODUTO.nome_produto, GERENTE_CADASTRA_PRODUTO.quantidade, GERENTE_CADASTRA_PRODUTO.data_cadas FROM GERENTE_CADASTRA_PRODUTO 
INNER JOIN PRODUTO ON PRODUTO.id_produto = GERENTE_CADASTRA_PRODUTO.id_produto 
INNER JOIN GERENTE ON GERENTE_CADASTRA_PRODUTO.id_gerente = GERENTE.id_gerente INNER JOIN USUARIO ON GERENTE.cpf_gerente = USUARIO.cpf;