-- Deploy oparadise:constraints to pg

BEGIN;
DROP DOMAIN IF EXISTS fr_code,e_mail,code_phone,code_password; 

  CREATE DOMAIN fr_code as text CHECK (
    VALUE ~ '^\d{5}$' 
    AND (
      VALUE ~ '^0[1-9]\d{3}$' -- codes qui commencent par 0 sauf 00
      OR VALUE ~ '^9[0-6]\d{3}$' -- codes qui commencent par 9 hors DOM et TOM
      OR VALUE ~ '^[1-8]\d{4}$' --autres codes de la métropole
      OR VALUE ~ '^9[78][12478]\d{2}$' -- codes DOM et TOM
    )
  );
  
ALTER TABLE user_account ALTER COLUMN city_code TYPE fr_code;
 
   
CREATE DOMAIN e_mail AS text CHECK (
      VALUE ~ '^\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\Z$'
  );


ALTER TABLE
   user_account ALTER COLUMN email TYPE e_mail;
    
    

CREATE DOMAIN code_phone as text CHECK (
    VALUE ~ '^(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$'
);

ALTER TABLE user_account ALTER COLUMN number_phone TYPE code_phone; 

 


CREATE DOMAIN code_password AS VARCHAR (255) CHECK(
    VALUE ~ '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$'
);

ALTER TABLE user_account ALTER COLUMN password TYPE code_password;

CREATE DOMAIN pint AS int CHECK(VALUE > 0);
CREATE DOMAIN supint AS int CHECK(VALUE >= 9);

ALTER TABLE
     search
ALTER COLUMN
     number_of_room TYPE pint,
ALTER COLUMN 
     number_of_bedroom  TYPE pint,
ALTER COLUMN
     living_area TYPE supint;     

     

COMMIT;
