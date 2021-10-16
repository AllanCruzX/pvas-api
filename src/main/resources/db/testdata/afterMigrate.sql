set foreign_key_checks = 0;

delete from cidade;
delete from contato;
delete from endereco;
delete from curso;
delete from documento;
delete from especialidade;
delete from especializacao;
delete from estado;
delete from experiecia_profissional;
delete from foto_pessoa;
delete from idioma;
delete from pessoa;
delete from assistente_social;
delete from assistente_social_especializacao;
delete from assistente_social_idioma;
delete from assistente_social_sub_especialidade;
delete from pessoa_juridica;
delete from sub_especialidade;

set foreign_key_checks = 1;

alter table cidade auto_increment = 1;
alter table contato auto_increment = 1;
alter table endereco auto_increment = 1;
alter table curso auto_increment = 1;
alter table documento auto_increment = 1;
alter table especialidade auto_increment = 1;
alter table especializacao auto_increment = 1;
alter table estado auto_increment = 1;
alter table experiecia_profissional auto_increment = 1;
alter table foto_pessoa auto_increment = 1;
alter table idioma auto_increment = 1;
alter table pessoa auto_increment = 1;
alter table sub_especialidade auto_increment = 1;

insert into estado (id, nome, sigla , data_atualizacao) values (1, 'Minas Gerais', 'MG', utc_timestamp);
insert into estado (id, nome, sigla , data_atualizacao) values (2, 'São Paulo', 'SP', utc_timestamp);
insert into estado (id, nome, sigla , data_atualizacao) values (3, 'Ceará', 'CE' , utc_timestamp);
insert into estado (id, nome, sigla , data_atualizacao) values (4, 'Bahia', 'BA', utc_timestamp);

insert into cidade (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidade (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidade (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cidade (id, nome, estado_id) values (4, 'Campinas', 2);
insert into cidade (id, nome, estado_id) values (5, 'Fortaleza', 3);
insert into cidade (id, nome, estado_id) values (6, 'Salvador', 4);
insert into cidade (id, nome, estado_id) values (7, 'Lauro de Freitas', 4);

insert into especialidade (id, nome) values (1, 'SAUDE');
insert into especialidade (id, nome) values (2, 'EDUCACAO');

insert into sub_especialidade ( nome, especialidade_id) values ('ATECAO DOMICILIAR', 1);
insert into sub_especialidade (nome, especialidade_id) values ('APOIO ESCOLAR', 2);
insert into sub_especialidade (nome, especialidade_id) values ( 'CONCURSO PUBLICO', 2);


insert into pessoa(id, codigo , ativo, data_cadastro, nome ) values (1,'fc60f245-6c65-4302-9025-89a9d05346a6', 1 ,utc_timestamp ,'Almir Rosa');
insert into pessoa(id, codigo , ativo, data_cadastro, nome ) values (2,'d515fb8e-17d0-11ec-9621-0242ac130002', 1 ,utc_timestamp ,'Abidjan Santos Rosa');

insert into contato(descricao, tipo_contato, pessoa_id) values ('almirrosa@ikesocial.com', 'EMAIL', 1);
insert into contato(descricao, tipo_contato, pessoa_id) values ('7199258879', 'CELULAR', 1);
insert into contato(descricao, tipo_contato, pessoa_id) values ('abidjan@ikesocial.com', 'EMAIL', 2);
insert into contato(descricao, tipo_contato, pessoa_id) values ('7199257780', 'CELULAR', 2);

insert into endereco(principal, cep, logradouro, bairro, numero, complemento, tipo_endereco, cidade_id, pessoa_id) values (1,'41500350','Rua Sao Geraldo','Sao Cristovao','533','ap 14','RESIDENCIAL',1,1);
insert into endereco(principal, cep, logradouro, bairro, numero, complemento, tipo_endereco, cidade_id, pessoa_id) values (1,'41500352','Rua Margarida','Cx agua','14','bl 1','RESIDENCIAL',1,2);

insert into documento(codigo, tipo_documento, pessoa_id) values ('71664925031', 'CPF', 1);
insert into documento(codigo, tipo_documento, pessoa_id) values ('76038003070', 'CPF', 2);
insert into documento(codigo, tipo_documento,estado_id ,pessoa_id) values ('0000001', 'CARTEIRA_PROFISSIONAL',1, 1);
insert into documento(codigo, tipo_documento,estado_id ,pessoa_id) values ('2255881', 'CARTEIRA_PROFISSIONAL',1, 2);

insert into assistente_social (assistente_social_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (1 , 'Maria Alice' , 'Albertino' , '1970-07-15' , 0 ,'MASCULINO' , 'CASADO');
insert into assistente_social (assistente_social_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (2 , 'Edivaldina' , 'Nenê' , '1988-01-11' , 0 ,'FEMININO' , 'CASADO');

insert into curso (nome, chaga_horaria, assistente_social_id) values ('Assistente social autônomo' , 60, 1);
insert into curso (nome, chaga_horaria, assistente_social_id) values ('Assistente social autônomo IKE' , 100, 2);

insert into idioma (id , nome) values (1, 'Português');
insert into idioma (id , nome) values (2, 'Inglês ');

insert into assistente_social_idioma (assistente_social_id , idioma_id) values (1,1);
insert into assistente_social_idioma (assistente_social_id , idioma_id) values (2,1);

insert into especializacao (id , nome) values (1 , 'Mestrado');
insert into especializacao (id , nome) values (2 , 'Doutorado');

insert into assistente_social_especializacao (assistente_social_id, especializacao_id) values (1,1);
insert into assistente_social_especializacao (assistente_social_id, especializacao_id) values (2,2);

insert into assistente_social_sub_especialidade (assistente_social_id , sub_especialidade_id) values(1,1);
insert into assistente_social_sub_especialidade (assistente_social_id , sub_especialidade_id) values(2,1);
insert into assistente_social_sub_especialidade (assistente_social_id , sub_especialidade_id) values(2,2);

insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio   , empresa_atual , assistente_social_id) values (1,'Petobras','Da assistencia no Pre-sal', utc_timestamp ,   true , 1);
insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio  , empresa_atual , assistente_social_id) values (2,'IkeSocial','CEO da empresa', utc_timestamp ,  true , 2);