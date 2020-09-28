select * from postal;
INSERT INTO `vendedores`.`postal` (`Codigo`, `Localidade`) VALUES ('1250', 'Mouraria');
select * from pessoa;
INSERT INTO `vendedores`.`pessoa` (`Id`, `Nome`, `Idade`, `Salario`, `Telefone`, `Cod_Postal`) VALUES ('998', 'Ana Rita', '35', '560000', '', '2300');
UPDATE Pessoa SET salario = salario*1.1; -- isto faz com  que faca um updadte a tabela pessoa na coluna salario multiplicando o seu valor por 1.1
UPDATE Pessoa SET salario = salario - 0.2 where nome = "Paulo Viegas";
UPDATE Pessoa SET salario =
(SELECT Salario FROM
(SELECT Min(Salario) as Salario FROM Pessoa) as Salario),
telefone = 123
WHERE id = 998;-- munda o numero de telefone para 123 e munda o salario para salario minino no id 998

DELETE FROM Senior; -- delete a coluna senior
 DELETE FROM Pessoa Where id = 998; -- elinina a pessoa do id 998
 DELETE FROM Pessoa where Nome ='%da';
 SELECT * FROM Postal
WHERE codigo NOT IN ( SELECT cod_postal FROM Pessoa); -- pega todos os codigos postal onde nao estao a ser usados na Pessoa
DELETE from postal where codigo NOT IN (SELECT cod_postal FROM Pessoa);
DELETE from comissao where Valor >3000;