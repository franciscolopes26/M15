   use vendedores;
   -- 1
   Set Autocommit=0;
   
   -- 2
   START TRANSACTION;
   
   -- 3
	INSERT INTO postal (Codigo, Localidade)
VALUES ('2410', 'Leiria');

-- 4
select * from postal;

-- 5
COMMIT;

-- 6 
delete from postal where codigo!='2410';

-- 7
rollback;

-- 8 
  Set Autocommit=1;
   