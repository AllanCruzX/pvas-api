set foreign_key_checks = 0;

lock tables cidade write, contato write, endereco write, curso write,
	documento write, especialidade write, especializacao write,
	estado write, experiecia_profissional write, foto_pessoa write,
	idioma write, grupo write, permissao write,
	pessoa write, pessoa_grupo write, assistente_social write, oauth_client_details write ,
	assistente_social_especializacao write, assistente_social_idioma write,
	assistente_social_sub_especialidade write, pessoa_juridica write, sub_especialidade write,
	usuario write , grupo_permissao write ; 


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
delete from grupo;
delete from grupo_permissao;
delete from permissao;
delete from pessoa;
delete from pessoa_grupo;
delete from assistente_social;
delete from assistente_social_especializacao;
delete from assistente_social_idioma;
delete from assistente_social_sub_especialidade;
delete from pessoa_juridica;
delete from sub_especialidade;
delete from usuario;
delete from oauth_client_details;

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
alter table grupo auto_increment = 1;
alter table permissao auto_increment = 1;
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

insert into pessoa(id, codigo , ativo, data_cadastro, nome , senha ) values (1,'fc60f245-6c65-4302-9025-89a9d05346a6', 1 ,utc_timestamp ,'Almir Rosa' , '$2a$12$/7XNM63m6GY4HthdbCXN6evfw4/JhrK1QbCKcbD2PpwbM5kMLhiH.');
insert into pessoa(id, codigo , ativo, data_cadastro, nome ,  senha ) values (2,'d515fb8e-17d0-11ec-9621-0242ac130002', 1 ,utc_timestamp ,'Abidjan Santos Rosa' , '$2a$12$/7XNM63m6GY4HthdbCXN6evfw4/JhrK1QbCKcbD2PpwbM5kMLhiH.');
insert into pessoa(id, codigo , ativo, data_cadastro, nome ,  senha ) values (3,'d515fb8e-17d0-11ec-9621-0242ac139999', 1 ,utc_timestamp ,'Rute Santos' , '$2a$12$/7XNM63m6GY4HthdbCXN6evfw4/JhrK1QbCKcbD2PpwbM5kMLhiH.');


insert into contato(descricao, tipo_contato, pessoa_id) values ('almirrosa@ikesocial.com', 'EMAIL', 1);
insert into contato(descricao, tipo_contato, pessoa_id) values ('7199258879', 'CELULAR', 1);
insert into contato(descricao, tipo_contato, pessoa_id) values ('abidjan@ikesocial.com', 'EMAIL', 2);
insert into contato(descricao, tipo_contato, pessoa_id) values ('7199257780', 'CELULAR', 2);
insert into contato(descricao, tipo_contato, pessoa_id) values ('rute@ikesocial.com', 'EMAIL', 3);
insert into contato(descricao, tipo_contato, pessoa_id) values ('7199257781', 'CELULAR', 3);

insert into endereco(principal, cep, logradouro, bairro, numero, complemento, tipo_endereco, cidade_id, pessoa_id) values (1,'41500350','Rua Sao Geraldo','Sao Cristovao','533','ap 14','RESIDENCIAL',1,1);
insert into endereco(principal, cep, logradouro, bairro, numero, complemento, tipo_endereco, cidade_id, pessoa_id) values (1,'41500352','Rua Margarida','Cx agua','14','bl 1','RESIDENCIAL',1,2);
insert into endereco(principal, cep, logradouro, bairro, numero, complemento, tipo_endereco, cidade_id, pessoa_id) values (1,'41500352','Rua Margarida','Cx agua','14','bl 1','RESIDENCIAL',1,3);

insert into documento(codigo, tipo_documento, pessoa_id) values ('71664925031', 'CPF', 1);
insert into documento(codigo, tipo_documento, pessoa_id) values ('76038003070', 'CPF', 2);
insert into documento(codigo, tipo_documento, pessoa_id) values ('53534381084', 'CPF', 3);

insert into documento(codigo, tipo_documento,estado_id ,pessoa_id) values ('0000001', 'CARTEIRA_PROFISSIONAL',1, 1);
insert into documento(codigo, tipo_documento,estado_id ,pessoa_id) values ('2255881', 'CARTEIRA_PROFISSIONAL',1, 2);
insert into documento(codigo, tipo_documento,estado_id ,pessoa_id) values ('2255882', 'CARTEIRA_PROFISSIONAL',1, 3);


insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_ASSISTENTE_SOCIAIS', 'Permite consultar assistente sociais');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_ASSISTENTE_SOCIAIS', 'Permite editar assistente sociais');
insert into permissao (id, nome, descricao) values (3, 'CADASTRAR_ASSISTENTE_SOCIAIS', 'Permite cadastrar assistente sociais');
insert into permissao (id, nome, descricao) values (4, 'INATIVAR_ATIVAR_ASSISTENTE_SOCIAIS', 'Permite ativar e inativar assistente sociais');
insert into permissao (id, nome, descricao) values (5, 'GERAR_RELATORIOS', 'Permite gerar relatórios');
insert into permissao (id, nome, descricao) values (6, 'CONSULTAR_USUARIOS', 'Permite consultar usuários');
insert into permissao (id, nome, descricao) values (7, 'EDITAR_USUARIOS', 'Permite criar ou editar usuários');
insert into permissao (id, nome, descricao) values (8, 'INATIVAR_ATIVAR_USUARIOS', 'Permite ativar e inativar usuários');
insert into permissao (id, nome, descricao) values (9, 'CONSULTAR_GRUPOS_PERMISSOES', 'Permite consultar grupos e permissões ');
insert into permissao (id, nome, descricao) values (10, 'GERECIA_ASSISTENTE_SOCIAL', 'Permite um assistentesocial modificar seus proprios dados ');
insert into permissao (id, nome, descricao) values (11, 'CONSULTAR_CURSOS', 'Permite consultar cursos ');
insert into permissao (id, nome, descricao) values (12, 'EDITAR_CURSOS', 'Permite editar cursos ');
insert into permissao (id, nome, descricao) values (13, 'CADASTRAR_CURSOS', 'Permite cadastrar cursos ');
insert into permissao (id, nome, descricao) values (14, 'EXCLUIR_CURSOS', 'Permite excluir cursos ');
insert into permissao (id, nome, descricao) values (15, 'CONSULTAR_EXPERIENCIAS_PROFISSIONAIS', 'Permite consultar experiencias profissionais ');
insert into permissao (id, nome, descricao) values (16, 'EDITAR_EXPERIENCIAS_PROFISSIONAIS', 'Permite editar  experiencias profissionai ');
insert into permissao (id, nome, descricao) values (17, 'CADASTRAR_EXPERIENCIAS_PROFISSIONAIS', 'Permite cadastrar  experiencias profissionai ');
insert into permissao (id, nome, descricao) values (18, 'EXCLUIR_EXPERIENCIAS_PROFISSIONAIS', 'Permite excluir  experiencias profissionai ');

insert into grupo (id, nome) values (1, 'Administrador'), (2, 'Cliente'), (3, 'Secretária'), (4, 'Cadastrador');

insert into assistente_social (assistente_social_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (1 , 'Maria Alice' , 'Albertino' , '1970-07-15' , 0 ,'MASCULINO' , 'CASADO');
insert into assistente_social (assistente_social_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (2 , 'Edivaldina' , 'Nenê' , '1988-01-11' , 0 ,'FEMININO' , 'CASADO');

insert into usuario (usuario_id) values (3);

# Adiciona todas as permissoes no grupo do Administrador
insert into grupo_permissao (grupo_id, permissao_id)
select 1, id from permissao;

# Adiciona as permissoes no grupo do Cliente
insert into grupo_permissao (grupo_id, permissao_id) values (2,10),(2,13),(2,17); 

# Adiciona as permissoes no grupo da Secretária
insert into grupo_permissao (grupo_id, permissao_id) values (3, 1), (3, 2), (3, 3), (3, 4) , (3, 5) ,(3, 6),(3, 7),(3, 8),(3, 9),(3, 10),(3, 11),(3, 12),(3, 13),(3, 14),(3, 15),(3, 16),(3, 17),(3, 18); 

insert into pessoa_grupo (pessoa_id, grupo_id) values (1, 2), (2, 2), (3, 1);

insert into curso (id, nome, chaga_horaria, assistente_social_id , data_cadastro) values (1,'Assistente social autônomo' , 60, 1 , utc_timestamp);
insert into curso (id ,nome, chaga_horaria, assistente_social_id , data_cadastro) values (2,'Assistente social autônomo IKE' , 100, 2 , utc_timestamp);
insert into curso (id ,nome, chaga_horaria,  data_cadastro) values (3,'SPA' , 500,  utc_timestamp);
insert into curso (id ,nome, chaga_horaria,  data_cadastro) values (4,'JPA' , 300,  utc_timestamp);

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

insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio   , empresa_atual , assistente_social_id , data_cadastro) values (1,'Petobras','Da assistencia no Pre-sal', utc_timestamp ,   true , 1 ,utc_timestamp);
insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio  , empresa_atual , assistente_social_id , data_cadastro) values (2,'IkeSocial','CEO da empresa', utc_timestamp ,  true , 2 , utc_timestamp);
insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio  , empresa_atual ,  data_cadastro) values (3,'TQI','DEV', utc_timestamp ,  true ,  utc_timestamp);
insert into experiecia_profissional (id, nome_empresa , atividade , data_inicio  , empresa_atual ,  data_cadastro) values (4,'TELESSAUDE','DEV', utc_timestamp ,  true ,  utc_timestamp);

insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'pvas-web', null, '$2y$12$w3igMjsfS5XoAYuowoH3C.54vRFWlcXSHLjX7MwF990Kc2KKKh72e',
  'READ,WRITE', 'password,refresh_token', null, null,
  60 * 60 * 6, 60 * 24 * 60 * 60, null
);

insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'analytics', null, '$2y$12$w3igMjsfS5XoAYuowoH3C.54vRFWlcXSHLjX7MwF990Kc2KKKh72e',
  'READ,WRITE', 'authorization_code', 'http://aplicacao-cliente', null,
  null, null, false
);

insert into oauth_client_details (
  client_id, resource_ids, client_secret, 
  scope, authorized_grant_types, web_server_redirect_uri, authorities,
  access_token_validity, refresh_token_validity, autoapprove
)
values (
  'faturamento', null, '$2y$12$fHixriC7yXX/i1/CmpnGH.RFyK/l5YapLCFOEbIktONjE8ZDykSnu',
  'READ,WRITE', 'client_credentials', null, 'CONSULTAR_ASSISTENTE_SOCIAIS,GERAR_RELATORIOS',
  null, null, null
);

unlock tables;