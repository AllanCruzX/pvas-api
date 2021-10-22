ALTER TABLE pessoa 
ADD COLUMN data_alteracao datetime  AFTER data_inativacao;

ALTER TABLE experiecia_profissional 
ADD COLUMN data_cadastro datetime  AFTER sem_experiencia;

ALTER TABLE experiecia_profissional 
ADD COLUMN data_alteracao datetime  AFTER data_cadastro;

ALTER TABLE curso 
ADD COLUMN data_cadastro datetime  AFTER chaga_horaria;

ALTER TABLE curso 
ADD COLUMN data_alteracao datetime  AFTER data_cadastro;


