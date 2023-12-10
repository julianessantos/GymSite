-- AREA PARA TABELAS DO SISTEMA GYMSITE -------------------------

-- Criando a tabela USUARIOS do sistema
create table USUARIO (
cpf varchar(11) not null,
nome varchar(30) not null,
nascimento date not null,
telefone varchar(20),
email varchar(30),
tipo_de_usuario enum('C','P','G'), 
primary key (cpf)
) default charset=utf8mb4;
-- Criando a tabela CLIENTE do sistema
create table CLIENTE (
id_cliente int not null auto_increment,
matricula_cliente varchar(30) not null,
tipo_de_treino int not null,
personal_escolhido varchar(30) not null,
tipo_de_usuario enum('C','P','G'),
primary key (id_cliente),
foreign key (personal_escolhido) references personal(matricula_personal),
foreign key (tipo_de_usuario) references usuario(tipo_de_usuario)
) default charset=utf8mb4;
-- Criando a tabela PERSONAL do sistema
create table PERSONAL (
id_personal int not null auto_increment,
matricula_personal varchar(30) not null,
especialidade int not null,
tipo_de_usuario enum('C','P','G'),
primary key (id_personal),
foreign key (tipo_de_usuario) references usuario(tipo_de_usuario)
) default charset=utf8mb4;

-- Criando a tabela GERENTE para o sistema
create table GERENTE (
id_gerente int not null auto_increment,
nome varchar(30),
tipo_de_usuario enum('C','P','G'),
primary key (id_gerente),
foreign key (tipo_de_usuario) references usuario(tipo_de_usuario)
) default charset=utf8mb4;

-- Criando a tabela TREINO do sistema
create table TREINO(
id_treino int not null auto_increment,
nome varchar(20) not null,
primary key (id_treino)
) default charset=utf8mb4;

-- Criando a tabela AVALIAÇÃO_CORPORAL para o sistema
create table AVALIACAO_CORPORAL (
id_avaliacao int not null auto_increment,
avalia_cliente_por_matricula varchar(30) not null,
personal_respons_avaliacao varchar(30) not null,
tipo_de_treino int not null,
primary key (id_avaliacao),
foreign key (avalia_cliente_por_matricula) references CLIENTE(matricula_cliente),
foreign key (personal_respons_avaliacao) references PERSONAL(matricula_personal),
foreign key (tipo_de_treino) references TREINO(id)
) default charset=utf8mb4;

-- Criando a tabela PRODUTO para o sistema
create table PRODUTO (
id_produto int not null auto_increment,
nome_produto varchar(30) not null,
preco float not null,
quantidade int not null,
primary key (id_produto)
) default charset=utf8mb4;

-- Criando a tabela COMPRAS para o sistema
create table COMPRAS (
id_compra int not null auto_increment,
nome_produto varchar(30) not null,
id_produto int not null,
quantidade int not null,
quem_comprou varchar(11) not null,
primary key (id_compra),
foreign key (id_produto) references PRODUTO(id),
foreign key (quem_comprou) references USUARIO(cpf)
) default charset=utf8mb4;
--------------------------------------------------------------------------------------------------------------------

-- Criano usuarios para a tabela usuarios
insert into usuario values ('10077858450','ANELMA','1995-10-10','84992102818','ANELMA@GMAIL.COM','C');
insert into usuario values ('00000000001','JULIA','2000-04-21','84999999999','JULIA@GMAIL.COM','C');
insert into usuario values ('00000000002','JULIANE','2000-02-12','84988888888','JULIANE@GMAIL.COM','C');
insert into usuario values ('00000000003','PROFESSOR','1989-08-23','84977777777','PROFESSOR@GMAIL.COM','P');
insert into usuario values ('00000000004','GERENTE','1974-03-03','84966666666','GERENTE@GMAIL.COM','G');

-- Inseridos usuarios do tipo C (CLIENTE) na tabela dos CLIENTE
insert into CLIENTE values (1,'ANELMA001','1','PROF001','C');
insert into CLIENTE values (2,'JULIA011','2','PROF003','C');
insert into CLIENTE values (3,'JULIANE111','3','PROF011','C');

-- Inserindo os personais na tabela PERSONAL
insert into PERSONAL values (1,'PROF001','1','P'), (2,'PROF003','2','P'),(3,'PROF111','3','P');

-- Inserindo o gerente na tabela GERENTE
insert into GERENTE values (1, 'GERENTE','G');

-- Inserindo os tipos de treinos na tabela TREINO
insert into TREINO values (1,'MUSCULAÇÃO'), 
(2,'BOXE'),
(3,'MUSC_BOXE');

-- Inserindo avaliação corporal para clientes
insert into AVALIACAO_CORPORAL values (1,'ANELMA001','PROF001',1);
insert into AVALIACAO_CORPORAL values (2,'JULIA011','PROF003',2),(3,'JULIANE111','PROF011',3);

-- Inserindo dados na tabela PRODUTO
insert into PRODUTO values (1,'CAMISETA',35.00,50);
insert into PRODUTO values (2,'GARRAFA',20.00,21);
insert into PRODUTO values (3,'WHEY',92.00,15);
insert into PRODUTO values (4,'CREATINA',67.00,18);

-- Inserindo uma compra na tabela COMPRAS
insert into COMPRAS values (1,'CAMISETA',1,4,'10077858450');
insert into COMPRAS values (2,'CAMISETA',1,1,'00000000001');
insert into COMPRAS values (3,'CAMISETA',4,1,'00000000002');

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

-- EXIBINDO TABELA DE AVALIAÇÃO CORPORAL NO SISTEMA ---
select * from AVALIACAO_CORPORAL;

-- EXIBINDO TABELA DE PRODUTOS NO SISTEMA ---
select * from PRODUTO;

-- EXIBINDO TABELA DE COMPRAS NO SISTEMA ---
select * from COMPRAS;
-- ----------------------------- MODIFICAÇÕES NAS TABELAS ------------------------------
alter table AVALIACAO_CORPORAL
add column altura decimal(3,2),
add column peso decimal (5,2),
add column medida_peito decimal (5,2),
add column medida_braco decimal (5,2),
add column medida_coxa decimal (5,2),
add column medida_quadril decimal (5,2);

-- ------------------------- TESTES --------------------------
select * from USUARIO where tipo_de_usuario='C';
select * from CLIENTE where tipo_de_treino=2;
select * from PERSONAL where especialidade=1;
select * from AVALIACAO_CORPORAL where personal_respons_avaliacao='PROF001';
select * from COMPRAS where id_produto=1;