ALTER TABLE experiecia_profissional 
DROP FOREIGN KEY fk_experiecia_profissional_assistente_social;

ALTER TABLE experiecia_profissional 
CHANGE COLUMN assistente_social_id assistente_social_id BIGINT(20) NULL ;

ALTER TABLE experiecia_profissional
ADD CONSTRAINT fk_experiecia_profissional_assistente_social
  FOREIGN KEY (assistente_social_id)
  REFERENCES assistente_social (assistente_social_id);