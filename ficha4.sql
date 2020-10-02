create database NoviCursos;
use NoviCursos;
create table Aluno(
	NumAl int  AUTO_INCREMENT PRIMARY KEY,
    NomeAl varchar(32) NOT NULL,
    DataNascAl varchar(32) NOT NULL,
    Sexo VARCHAR(3) NOT NULL
);

create table Curso(
	CodCurso int  AUTO_INCREMENT PRIMARY KEY,
    NomeCurso varchar(32) NOT NULL
); 

create table Disciplina(
	CodDisc int  AUTO_INCREMENT PRIMARY KEY,
    NomeDisc varchar(32) NOT NULL
); 

create table Aluno_Curso(
	NumAl int  AUTO_INCREMENT PRIMARY KEY,
    CodCurso INT(32) NOT NULL
); 

create table Curso_Disciplina(
	CodDisc int AUTO_INCREMENT PRIMARY KEY,
    CodCurso INT NOT NULL
); 
-- 3
show tables;

-- 4
CREATE TABLE Disciplina_Curso SELECT * FROM curso_disciplina where CodDisc <5;

-- 5
CREATE INDEX NomeDisc ON Disciplina(NomeDisc);
CREATE INDEX NomeCurso ON Curso(NomeCurso);
-- 6
Alter Table aluno Modify Sexo int ;

-- 7
RENAME TABLE curso_disciplina TO DisciplinaPorCurso;

-- 8
Alter Table aluno Add MoradaAL varchar(32) DEFAULT 'Lisboa'; 

-- 9 
Alter Table aluno drop Sexo 
;

-- 10
 -- Alter Table aluno set DataNascAL default= '1990-01-01';

-- 11
drop table disciplinaporcurso;

-- 12 
drop indice IdxNomeD;


