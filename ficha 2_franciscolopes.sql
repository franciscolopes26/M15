-- 1

CREATE TABLE Empregado AS
SELECT Id, Nome, Salario
 FROM Pessoa
 WHERE Id <=35; -- fica com 35 registros
 -- 2
CREATE TABLE PessoaMenor AS
SELECT Id, Nome, Idade, Salario, Telefone, Cod_Postal
 FROM Pessoa
 WHERE Idade <=18;
 
 -- 3
 ALTER TABLE Pessoa ADD
Fax varchar(15);
-- 4
select * from pessoa;

-- 5
ALTER TABLE Pessoa MODIFY Fax varchar(25);

-- 6
ALTER TABLE Pessoa
MODIFY Salario Decimal(10,2) NULL; -- este comando faz com que a coluna salario fique com 2 casa decimais

 -- 7 
 ALTER TABLE Pessoa MODIFY Salario int NOT NULL;
 
 
 -- 8 
 DROP TABLE  PessoaMenor;
 
 -- 9 
 CREATE VIEW Gestores AS
 SELECT * from Pessoa where salario > 200000 ;-- CRIA UMA VIEW DA TABELA PESSOA DA COLUNA SALRIOS MAIORES DE 200000 EUROS 
 
 -- 10
 CREATE VIEW People01 AS
 SELECT * from Pessoa where salario < 100000 ;
 
 -- 11
 CREATE VIEW People02 AS
 SELECT Id, Nome, Salario from Pessoa where salario < 100000 ;
 
 -- 12
 select * from people01;
 
 -- 13
  select * from people01;
  
  -- 14 
  CREATE VIEW People03 (Num, Nome, Ordenado) AS
 SELECT Id, Nome, Salario from Pessoa where salario between 20000 and 100000; -- lista todas as pessoas que o ordenado esteja entre 20000 e 100000
 
 -- 15
 select * from people03;
 
 -- 16
 select * from people03 where Ordenado >75000;
 
 -- 17
UPDATE `vendedores`.`pessoa` SET `Salario` = '20000' WHERE (`Id` = '5');

-- 18 
select * from people03; -- podemos concluir que as view atualizam sozinhas

-- 19
UPDATE People02
SET SALARIO=53000
WHERE ID=37 ;

-- 20
select * from people01;

-- 21
select * from people02;

-- 22
select * from people03;
 
 -- 23 
 select * from pessoa;
 
 -- 24
 -- da view atualizou a table tambem
 
 -- 25
 UPDATE People03 SET ordenado=71000 WHERE num = 42 ;
 
-- 26
select * from people01;

-- 27
select * from people02;

-- 28
select * from people03;

-- 29 
 select * from pessoa;
 
 -- 30
 -- que atualizou e apareceu tambem na view 02
 
 -- 31
SELECT nome, cod_postal, localidade from Pessoa, Postal where cod_postal=codigo;
 -- permitiu ver o criterio de relacao entre tabelas
 
 -- 32
  CREATE VIEW morada (Num, morada, cod) AS SELECT Id, Localidade , cod__postal from Pessoa, postal where morada= codigo;
  
  
 -- 33 
 CREATE VIEW vComissao(Id, Nome, salario,
comissão) AS SELECT C.id, nome, salario,
sum(valor)
FROM Pessoa P, Comissao C
WHERE P.id = C.id
GROUP BY C.id, Nome, salario; -- cria uma view da comissao onde pessoas tem relacao com comissao

-- 34

CREATE VIEW  Resultado(Nome,Ordenado,ganhar) AS SELECT Nome, Salario,comissão from People02, vComissao WHERE Ordenado < 100000 and comissão > 0 ;

-- 35
CREATE VIEW Teste AS
SELECT * FROM Pessoa
WHERE salario >= 10000
WITH CHECK OPTION; 

INSERT INTO Teste VALUES(111,'Maria Rico',33,74000,'789654',1500,null);
INSERT INTO Teste VALUES(112,'Joana Menos',34,4000,'123654',1500,null); 
 
 
 CREATE VIEW Teste2 AS
SELECT * FROM Pessoa
WHERE salario <10000
WITH CHECK OPTION ;

INSERT INTO Pessoa VALUES(200,'José Pobre',33,400,'789654',1500,null);
INSERT INTO Pessoa VALUES(201,'Luís Rico',34,74000,'123654',1500,null); 
 
-- criamos 2 view da pessoa uma onde salario e maior ou igual a 10k e a outra menor.

-- 36
 DROP VIEW TESTE;
 
 -- 37 
 CREATE UNIQUE INDEX indNome ON Pessoa(Nome);
CREATE INDEX indSal ON Pessoa(Salario DESC);
CREATE UNIQUE INDEX indComissao ON Comissao(Id, Id_msg) ;


-- 38
DROP INDEX indNome ON Pessoa;
DROP INDEX indSal ON Pessoa;
DROP INDEX indComissao ON Comissao;