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
create table CLIENTE (
mat_cliente varchar(10) not null,
id_treino int not null,
id_produto int not null,
mat_personal varchar(10) not null,
id_ava_corpo int not null,
id_desc_treino int not null,
cpf_cliente varchar(11) not null,
primary key (mat_cliente),
foreign key (id_treino) references TREINO(id),
foreign key (id_produto) references PRODUTO(id),
foreign key (mat_personal) references PERSONAL(mat_personal),
foreign key (id_ava_corpo) references AVALIACAO_CORPORAL(id_ava_corpo),
foreign key (id_desc_treino) references DESCRICAO_TREINO(id_desc_treino),
foreign key (cpf_cliente) references USUARIO(cpf)
) default charset=utf8mb4;

-- Criando a tabela PERSONAL do sistema
create table PERSONAL (
mat_personal varchar(10),
id_treino int not null,
cpf_personal varchar(10) not null,
primary key (mat_personal),
foreign key (id_treino) references TREINO(id_treino),
foreign key (cpf_personal) references USUARIO(cpf)
) default charset=utf8mb4;

-- Criando a tabela GERENTE para o sistema
create table GERENTE (
mat_gerente varchar(10) not null,
cpf_gerente varchar(11) not null,
primary key (mat_gerente),
foreign key (cpf_gerente) references USUARIO(cpf_gerente)
) default charset=utf8mb4;

-- Criando a tabela TREINO do sistema
create table TREINO(
id_treino int not null auto_increment,
nome varchar(20) not null,
primary key (id_treino)
) default charset=utf8mb4;

-- Criando a tabela AVALIAÇÃO_CORPORAL para o sistema
create table AVALIACAO_CORPORAL (
id_ava_corpo int not null auto_increment,
altura float not null,
peso float not null,
med_coxa float not null,
med_braco float not null,
med_cintura float not null,
mat_cliente varchar(11) not null,
mat_personal varchar(11) not null,
id_treino int not null,
primary key (id_ava_corpo),
foreign key (mat_cliente) references CLIENTE(mat_cliente),
foreign key (mat_personal) references PERSONAL(mat_personal),
foreign key (id_treino) references TREINO(id_treino)
) default charset=utf8mb4;

-- Criando a tabela PRODUTO para o sistema
create table PRODUTO (
id_produto int not null auto_increment,
nome_produto varchar(30) not null,
preco float not null,
quantidade int not null,
mat_gerente varchar(10) not null,
primary key (id_produto),
foreign key (mat_gerente) references GERENTE(mat_gerente)
) default charset=utf8mb4;

-- Criando a tabela COMPRAS para o sistema
create table COMPRAS (
id_produto int not null,
mat_cliente varchar(10) not null
) default charset=utf8mb4;

-- Criando a tabela DESC_TREINOS
create table DESC_TREINOS (
id_desc_treinos int not null auto_increment,
exc1 varchar(30) not null,
exc2 varchar(30) not null,
exc3 varchar(30) not null,
serie int not null,
rept int not null,
id_treino int not null,
primary key (id_desc_treinos),
foreign key (id_treino) references TREINO(id_treino)
) default charset=utf8mb4;
-- -------------------------------------------------------------------------------------------
-- ------------------------ Script de Testes --------------------------

-- Criano usuarios para a tabela usuarios
insert into usuario values ('00000000001','ANELMA','1995-10-10','84992102818','ANELMA@GMAIL.COM','TESTE1');
insert into usuario values ('00000000002','JULIA','2000-04-21','84999999999','JULIA@GMAIL.COM','TESTE2');
insert into usuario values ('00000000003','JULIANE','2000-02-12','84988888888','JULIANE@GMAIL.COM','TESTE3');
insert into usuario values ('00000000004','PROFESSOR','1989-08-23','84977777777','PROFESSOR@GMAIL.COM','TESTE4');
insert into usuario values ('00000000005','GERENTE','1974-03-03','84966666666','USUARIO1@GMAIL.COM','TESTE6');
insert into usuario values ('00000000006','USUARIO1','1973-06-02','84955555555','USUARIO2@GMAIL.COM','TESTE7');
insert into usuario values ('00000000007','USUARIO2','1981-09-08','84944444444','USUARIO3@GMAIL.COM','TESTE8');
insert into usuario values ('00000000008','USUARIO3','1999-04-03','84933333333','USUARIO4@GMAIL.COM','TESTE9');
insert into usuario values ('00000000009','USUARIO4','1965-10-23','84922222222','USUARIO5@GMAIL.COM','TESTE10');
insert into usuario values ('00000000010','USUARIO5','1963-10-23','84911111111','USUARIO6@GMAIL.COM','TESTE11');

-- Inseridos usuarios do tipo C (CLIENTE) na tabela dos CLIENTE
insert into CLIENTE values ('MAT01','1','1','PROF001','1','1','00000000001');
insert into CLIENTE values ('MAT02','2','1','PROF002','2','2','00000000002');
insert into CLIENTE values ('MAT03','3','2','PROF002','3','3','00000000003');
insert into CLIENTE values ('MAT04','2','2','PROF003','4','4','00000000007');
insert into CLIENTE values ('MAT05','3','3','PROF003','5','5','00000000008');
insert into CLIENTE values ('MAT06','1','3','PROF001','6','6','00000000009');

-- Inserindo os personais na tabela PERSONAL
insert into PERSONAL values ('PROF001','1','00000000004'),('PROF002','2','00000000006'),('PROF003','3','00000000010');

-- Inserindo o gerente na tabela GERENTE
insert into GERENTE values ('MATG_01','00000000005');

-- Inserindo os tipos de treinos na tabela TREINO
insert into TREINO values (1,'MUSCULAÇÃO'), (2,'BOXE'),(3,'MUSC_BOXE');

-- Inserindo avaliação corporal para clientes
insert into AVALIACAO_CORPORAL values (1,1.71,70.1,80.1,50.1,92.1,'MAT001','PROF001',1);
insert into AVALIACAO_CORPORAL values (2,1.61,60.1,70.1,60.1,82.1,'MAT002','PROF002',2);
insert into AVALIACAO_CORPORAL values (3,1.81,80.1,90.1,80.1,102.1,'MAT003','PROF003',3);

-- Inserindo dados na tabela PRODUTO
insert into PRODUTO values (1,'CAMISETA',35.00,50,'MATG_01');
insert into PRODUTO values (2,'GARRAFA',20.00,21,'MATG_01');
insert into PRODUTO values (3,'WHEY',92.00,15,'MATG_01');
insert into PRODUTO values (4,'CREATINA',67.00,18,'MATG_01');

-- Inserindo uma compra na tabela COMPRAS
insert into COMPRAS values (1,'MAT01');
insert into COMPRAS values (1,'MAT04');
insert into COMPRAS values (2,'MAT02');
insert into COMPRAS values (3,'MAT03');

-- Inserindo um treino na tabela DESC_TREINOS]
select * from desc_treinos;
insert into DESC_TREINOS values (1,'EXTENSORA', 'PUXADA ROMANA', 'LEG PRESS 45', 4, 15,1);
insert into DESC_TREINOS values (2,'SUPINO RETO', 'REMADA BAIXA', 'LEG PRESS 90', 4, 15,1);
insert into DESC_TREINOS values (3,'GANCHO', 'DIRETO', 'JAB', 4, 15,3);

-- --------------------- EXIBINDO DADOS --------------------------------------------------------
-- EXIBINDO OS USUARIOS DO SISTEMA ---
select * from USUARIO;

-- EXIBINDO OS USUARIOS DO  TIPO CLIENTE NO SISTEMA ---
select * from CLIENTE;

-- EXIBINDO OS USUARIOS DO  TIPO PERSONAL NO SISTEMA ---
select * from PERSONAL;

-- EXIBINDO OS USUARIOS DO  TIPO GERENTE NO SISTEMA ---
select * from GERENTE;

-- EXIBINDO TABELA DE TREINO NO SISTEMA ---
select * from TREINO;

-- EXIBINDO TABELA DE DESCRICAO DE TREINO NO SISTEMA ---
select * from DESC_TREINOS;

-- EXIBINDO TABELA DE AVALIAÇÃO CORPORAL NO SISTEMA ---
select * from AVALIACAO_CORPORAL;

-- EXIBINDO TABELA DE PRODUTOS NO SISTEMA ---
select * from PRODUTO;

-- EXIBINDO TABELA DE COMPRAS NO SISTEMA ---treino
select * from COMPRAS;

-- EXIBINDO DADOS ---
select USUARIO.nome, CLIENTE.cpf_cliente, CLIENTE.id_treino, CLIENTE.id_ava_corpo from USUARIO join CLIENTE
on USUARIO.cpf = Cliente.cpf_cliente;

select USUARIO.nome, CLIENTE.cpf_cliente, CLIENTE.id_treino, CLIENTE.id_ava_corpo, CLIENTE.mat_personal from USUARIO join CLIENTE
on USUARIO.cpf = Cliente.cpf_cliente;
