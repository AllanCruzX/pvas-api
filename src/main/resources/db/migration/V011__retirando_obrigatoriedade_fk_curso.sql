ALTER TABLE curso 
DROP FOREIGN KEY fk_curso_assistente_social;

ALTER TABLE curso 
CHANGE COLUMN assistente_social_id assistente_social_id BIGINT(20) NULL ;

ALTER TABLE curso
ADD CONSTRAINT fk_curso_assistente_social
  FOREIGN KEY (assistente_social_id)
  REFERENCES assistente_social (assistente_social_id);