-- 1
use mysql;
 select user from user;
 -- 2
-- Delete from user where user !='root' and 'mysql.sys';

-- 3
create user 'joanahenriques' identified by 'Q!12?w34' password expire never;
create user 'danielgomes' identified by '1652gQ&# ' password expire interval 180 day;

-- 4
 select user from user;
 
 -- 5
 Set Password for 'joanahenriques' = 'pirata';
  Set Password for 'danielgomes' = 'caraibas';
  
  -- 6
 alter user joanahenriques account lock;
 
 -- 7
 update mysql.user set user='danielsampaio' where user = 'joanahenriques';
flush privileges;
 
 -- 8 
 Show Grants For joanahenriques;
 
 -- 9
 Grant all On vendedores.pessoa To joanahenriques;
 Grant all On vendedores.comissao To joanahenriques;
 
 -- 10 
Show grants for 'joanahenriques';

-- 11
Show grants for 'danielsampaio';

  -- 12
  Grant Update On Vendas.* To danielsampaio; 
  
  -- 13
  Show grants for 'danielsampaio';
  -- 17
   -- Revoke All On msql.* To joanahenriques;
  
   -- 18
   Show grants for 'danielsampaio';
   
   -- 19
   
   Grant All On * To joanahenriques With Grant Option; 
   
   -- 20
   
   

   
  
  

