set foreign_key_checks = 0;


lock tables cidade write, contato write, endereco write, curso write,
	documento write, especialidade write, especializacao write,
	estado write, experiecia_profissional write, foto_pessoa write,
	idioma write, grupo write, permissao write,
	pessoa write, pessoa_grupo write, profissional write, profissao write , curriculo write, oauth_client_details write,
	curriculo_especializacao write, curriculo_profissao write ,curriculo_idioma write,
	curriculo_sub_especialidade write, empresa write, sub_especialidade write,
	grupo_permissao write; 
	
	
delete from cidade;
delete from contato;
delete from curriculo;
delete from curriculo_especializacao;
delete from curriculo_idioma;
delete from curriculo_profissao;
delete from curriculo_sub_especialidade;
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
delete from profissional;
delete from profissao;
delete from empresa;
delete from sub_especialidade;
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
alter table profissao auto_increment = 1;
alter table curriculo auto_increment = 1;


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


insert into sub_especialidade (nome, especialidade_id) values ('ATECAO DOMICILIAR', 1);
insert into sub_especialidade (nome, especialidade_id) values ('APOIO ESCOLAR', 2);
insert into sub_especialidade (nome, especialidade_id) values ( 'CONCURSO PUBLICO', 2);

insert into profissao (id, nome) values (1, 'ASSISTENTE SOCIAL');
insert into profissao (id, nome) values (2, 'PISICOLOGO');
insert into profissao (id, nome) values (3, 'PROGRAMADOR');
insert into profissao (id, nome) values (4, 'ADVOGADO');


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


insert into especializacao (id , nome) values (1 , 'Mestrado');
insert into especializacao (id , nome) values (2 , 'Doutorado');

insert into idioma (id , nome) values (1, 'Português');
insert into idioma (id , nome) values (2, 'Inglês ');


insert into profissional (profissional_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (1 , 'Maria Alice' , 'Albertino' , '1970-07-15' , 0 ,'MASCULINO' , 'CASADO');
insert into profissional (profissional_id , nome_mae, nome_pai, data_nascimento, pne, sexo, estado_civil) values (2 , 'Edivaldina' , 'Nenê' , '1988-01-11' , 0 ,'FEMININO' , 'CASADO');


insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_PROFISSIONAIS', 'Permite consultar profissionais');
insert into permissao (id, nome, descricao) values (2, 'CADASTRAR_PROFISSIONAIS', 'Permite cadastrar profissionais');
insert into permissao (id, nome, descricao) values (3, 'EDITAR_PROFISSIONAIS', 'Permite editar profissionais');
insert into permissao (id, nome, descricao) values (4, 'INATIVAR_ATIVAR_PROFISSIONAIS', 'Permite ativar e inativar profissionais');
insert into permissao (id, nome, descricao) values (5, 'CONSULTAR_GRUPOS_PERMISSOES', 'Permite consultar grupos e permissões ');
insert into permissao (id, nome, descricao) values (6, 'CADASTRAR_GRUPOS_PERMISSOES', 'Permite cadastrar grupos e permissões');
insert into permissao (id, nome, descricao) values (7, 'EDITAR_GRUPOS_PERMISSOES', 'Permite editar grupos e permissões');
insert into permissao (id, nome, descricao) values (8, 'INATIVAR_ATIVAR_GRUPOS_PERMISSOES', 'Permite ativar e inativar grupos e permissões');
insert into permissao (id, nome, descricao) values (9, 'CONSULTAR_ESPECIALIZACAO', 'Permite consultar grupos e especializações');
insert into permissao (id, nome, descricao) values (10, 'CADASTRAR_ESPECIALIZACAO', 'Permite cadastrar especializações');
insert into permissao (id, nome, descricao) values (11, 'EDITAR_ESPECIALIZACAO', 'Permite editar especializaçõess');
insert into permissao (id, nome, descricao) values (12, 'INATIVAR_ATIVAR_ESPECIALIZACAO', 'Permite ativar e inativar especializações');
insert into permissao (id, nome, descricao) values (13, 'CONSULTAR_ESPECIALIDADE', 'Permite consultar especialidade e sub-especialidade');
insert into permissao (id, nome, descricao) values (14, 'CADASTRAR_ESPECIALIDADE', 'Permite cadastrar especialidade e sub-especialidade');
insert into permissao (id, nome, descricao) values (15, 'EDITAR_ESPECIALIDADE', 'Permite editar especialidade e sub-especialidade');
insert into permissao (id, nome, descricao) values (16, 'INATIVAR_ATIVAR_ESPECIALIDADE', 'Permite ativar e inativar especialidade e sub-especialidade');
insert into permissao (id, nome, descricao) values (17, 'CONSULTAR_PROFISSAO', 'Permite consultar profissão');
insert into permissao (id, nome, descricao) values (18, 'CADASTRAR_PROFISSAO', 'Permite cadastrar profissão');
insert into permissao (id, nome, descricao) values (19, 'EDITAR_PROFISSAO', 'Permite editar profissão');
insert into permissao (id, nome, descricao) values (20, 'INATIVAR_ATIVAR_PROFISSAO', 'Permite ativar e inativar profissão');
insert into permissao (id, nome, descricao) values (21, 'GERAR_RELATORIOS', 'Permite gerar relatórios');
insert into permissao (id, nome, descricao) values (22, 'BUSCAR_PROFISSIONAL', 'Permite buscar um profissional');


insert into grupo (id, nome) values (1, 'Administrador'), (2, 'Cliente'), (3, 'Secretária'), (4, 'Cadastrador');


# Adiciona todas as permissoes no grupo do Administrador
insert into grupo_permissao (grupo_id, permissao_id)
select 1, id from permissao;


# Adiciona as permissoes no grupo do Cliente
insert into grupo_permissao (grupo_id, permissao_id) values (2,2),(2,9),(2,13),(2,17); 


# Adiciona as permissoes no grupo da Secretária
insert into grupo_permissao (grupo_id, permissao_id) values (3, 1), (3, 2), (3, 3), (3, 4) , (3, 5) ,(3, 6),(3, 7),(3, 8),(3, 9),(3, 10),(3, 11),(3, 12),(3, 13),(3, 14),(3, 15),(3, 16),(3, 17),(3, 18),(3, 19),(3, 20),(3,21),(3,22); 


insert into pessoa_grupo (pessoa_id, grupo_id) values (1, 2), (2, 2), (3, 1);


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
