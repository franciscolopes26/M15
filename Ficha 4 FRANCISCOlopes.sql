-- 1 
create database NoviCursos;

create table Aluno(NumAl int auto_increment primary key, NomeAl varchar(20) not null, DataNascAl date, Sexo varchar(1));

create table Curso(CodCurso int auto_increment primary key, NomeCurso varchar(20) unique not null);

create table Disciplina (CodDisc int auto_increment primary key, NomeDisc varchar(20) unique);

create table Aluno_Curso (NumAl int, foreign key (NumAl) references Aluno(NumAl), CodCurso int, foreign key (CodCurso) references Curso(CodCurso));

create table Curso_Disciplina (CodDisc int, foreign key (CodDisc) references Disciplina(CodDisc),CodCurso int, foreign key (CodCurso) references Curso(CodCurso));


-- 2 
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Rui","1986-03-18","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Manuel","1991-05-01","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Diogo","1987-01-24","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Bernardo","1992-04-15","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Tiago","1900-01-01","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Gonçalo","1991-08-31","M");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Henrique","1989-07-26","M");
insert into Aluno (NomeAl, DataNascAl, Sexo)values("Olga","1900-01-01","F");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Marta","1993-10-16","F");
insert into Aluno (NomeAl, DataNascAl, Sexo) values("Sandra","1994-09-08","F");

insert into Curso(NomeCurso) values("PTGPSI");
insert into Curso(NomeCurso) values("PTIG");
insert into Curso(NomeCurso) values("PTM");
insert into Curso(NomeCurso) values("PTCM");
insert into Curso(NomeCurso) values("PTAP");
insert into Curso(NomeCurso) values("PTAGD");
insert into Curso(NomeCurso) values("PTG");

insert into Disciplina(NomeDisc) values("Matemática");
insert into Disciplina(NomeDisc) values("Inglês");
insert into Disciplina(NomeDisc) values("Francês");
insert into Disciplina(NomeDisc) values("Físico-química");
insert into Disciplina(NomeDisc) values("Ed. Física");
insert into Disciplina(NomeDisc) values("Arq. Computadores");
insert into Disciplina(NomeDisc) values("Sistemas Operativos");
insert into Disciplina(NomeDisc) values("Gestão");
insert into Disciplina(NomeDisc) values("Economia");
insert into Disciplina(NomeDisc) values("Gestão Desportiva");

insert into Aluno_Curso(NumAl, CodCurso) values(1,1);
insert into Aluno_Curso(NumAl, CodCurso) values(2,1);
insert into Aluno_Curso(NumAl, CodCurso) values(3,3);
insert into Aluno_Curso(NumAl, CodCurso) values(4,4);
insert into Aluno_Curso(NumAl, CodCurso) values(5,5);
insert into Aluno_Curso(NumAl, CodCurso) values(6,6);
insert into Aluno_Curso(NumAl, CodCurso) values(7,7);
insert into Aluno_Curso(NumAl, CodCurso) values(8,2);
insert into Aluno_Curso(NumAl, CodCurso) values(9,5);
insert into Aluno_Curso(NumAl, CodCurso) values(10,6);

insert into Curso_Disciplina(CodDisc, CodCurso) values(1,1);
insert into Curso_Disciplina(CodDisc, CodCurso) values(1,2);
insert into Curso_Disciplina(CodDisc, CodCurso) values(1,3);
insert into Curso_Disciplina(CodDisc, CodCurso) values(2,3);
insert into Curso_Disciplina(CodDisc, CodCurso) values(3,2);
insert into Curso_Disciplina(CodDisc, CodCurso) values(6,1);
insert into Curso_Disciplina(CodDisc, CodCurso) values(7,1);
insert into Curso_Disciplina(CodDisc, CodCurso) values(4,1);
insert into Curso_Disciplina(CodDisc, CodCurso) values(5,4);
insert into Curso_Disciplina(CodDisc, CodCurso) values(8,2);
insert into Curso_Disciplina(CodDisc, CodCurso) values(9,7);
insert into Curso_Disciplina(CodDisc, CodCurso) values(10,6);


-- 3 
show tables;

-- 4 
create table Disciplina_Curso as select * from Curso_Disciplina where CodDisc < 5;

-- 5 
create index IdxNomeD on Disciplina (NomeDisc);

create index IdxNomeC on Curso (NomeCurso);

-- 6 
update Aluno set Sexo = "1" where Sexo = "M";
update Aluno set Sexo = "0" where Sexo = "F";

alter table Aluno modify Sexo int;

-- 7 
rename table Disciplina_Curso to DisciplinaPorCurso;

-- 8 
alter table Aluno add MoradaAl varchar(10) default "Lisboa";

-- 9 
alter table Aluno drop Sexo;

-- 10 
alter table Aluno modify DataNascAl date default "1990-01-01";

-- 11 
drop table disciplinaporcurso;

-- 12 
Drop index IdxNomeD on Disciplina;

-- 13 
create view vAlunos as select aluno.NumAl,NomeAl,DataNascAl,MoradaAl,curso.NomeCurso from Aluno,Curso,Aluno_Curso where aluno.NumAl = aluno_curso.NumAl and curso.codcurso = aluno_curso.codcurso; 

select * from vAlunos;

-- 14 
create view VNomeDNasc as select NumAl as IdAluno, NomeAl as NomeAluno, DataNascAl as NascAluno, MoradaAl as Morada from aluno where DataNascAl < "1990-12-3" with check option;
drop view vnomednasc;
-- 15 
select * from VNomeDNasc;

-- 16 
update vnomednasc set NascAluno = "1991-01-01" where NascAluno = "1900-01-01";


-- 17 
drop view valunos;

-- 18 
drop user  joanahenriques@localhost;
drop user danielgomes@localhost;

-- 19 
create user SandraLeonel identified by 'QYg&$23!' password expire interval 120 day;
create user TiagoFernandes identified by '542UGY2@' password expire never;

-- 20 
set password for SandraLeonel = 'mogadouro';
set password for TiagoFernandes = 'castroverde';

-- 21 
alter user SandraLeonel identified by 'mogadouro' account lock;

-- 22 
rename user TiagoFernandes to TiagoCardoso;

-- 23 
Grant All On *.* To TiagoCardoso With Grant Option; 

-- 24 
grant select (NomeAl) on novicursos.aluno to SandraLeonel;

-- 25 
revoke all privileges, grant option from TiagoCardoso;

-- 26 
grant update, select (Morada) on novicursos.vnomednasc to TiagoCardoso;

-- 27 
show grants for SandraLeonel;
show grants for TiagoCardoso;

-- 28 
update vnomednasc set Morada = "Porto";



