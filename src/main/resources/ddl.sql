create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_cursos (curriculo_id bigint not null, cursos_id bigint not null, primary key (curriculo_id, cursos_id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_cursos add constraint UK_fuxjpw71qhh9592x6chshvlga unique (cursos_id)
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_cursos add constraint FK5u2768svfnj37melvu43of8vy foreign key (cursos_id) references curso (id)
alter table curriculo_cursos add constraint FKd2dc9350nwbnd1a5vaqoj80j1 foreign key (curriculo_id) references curriculo (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_experiecias_profissionais (curriculo_id bigint not null, experiecias_profissionais_id bigint not null, primary key (curriculo_id, experiecias_profissionais_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table curriculo_experiecias_profissionais add constraint UK_8j2f1rqd5kk1ly8dx34lbf91t unique (experiecias_profissionais_id)
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_experiecias_profissionais add constraint FKbyy0byblxr7f9ncmxka7vroye foreign key (experiecias_profissionais_id) references experiecia_profissional (id)
alter table curriculo_experiecias_profissionais add constraint FK694cxbvvpwfsn2hcpekfjk69f foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
create table cidade (id bigint not null auto_increment, nome varchar(50) not null, estado_id bigint not null, primary key (id)) engine=InnoDB
create table contato (id bigint not null auto_increment, descricao varchar(200) not null, tipo_contato varchar(50) not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo (id bigint not null auto_increment, profissional_id bigint not null, primary key (id)) engine=InnoDB
create table curriculo_especializacao (curriculo_id bigint not null, especializacao_id bigint not null, primary key (curriculo_id, especializacao_id)) engine=InnoDB
create table curriculo_idioma (curriculo_id bigint not null, idioma_id bigint not null, primary key (curriculo_id, idioma_id)) engine=InnoDB
create table curriculo_profissao (curriculo_id bigint not null, profissao_id bigint not null, primary key (curriculo_id, profissao_id)) engine=InnoDB
create table curriculo_sub_especialidade (curriculo_id bigint not null, sub_especialidade_id bigint not null, primary key (curriculo_id, sub_especialidade_id)) engine=InnoDB
create table curso (id bigint not null auto_increment, chaga_horaria bigint not null, data_alteracao datetime, data_cadastro datetime not null, nome varchar(100) not null, curriculo_id bigint, primary key (id)) engine=InnoDB
create table documento (id bigint not null auto_increment, codigo varchar(100) not null, data_emissao date, orgao_expedidor varchar(100), serie_categoria_zona varchar(100), sessao varchar(50), tipo_documento varchar(50) not null, estado_id bigint, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table empresa (valor varchar(200), visao varchar(200), empresa_id bigint not null, primary key (empresa_id)) engine=InnoDB
create table endereco (id bigint not null auto_increment, bairro varchar(200) not null, cep varchar(100) not null, complemento varchar(200), logradouro varchar(200) not null, numero varchar(50) not null, principal bit not null, tipo_endereco varchar(50) not null, cidade_id bigint not null, pessoa_id bigint not null, primary key (id)) engine=InnoDB
create table especialidade (id bigint not null auto_increment, nome varchar(50) not null, primary key (id)) engine=InnoDB
create table especializacao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, data_atualizacao datetime(6) not null, nome varchar(50) not null, sigla varchar(10) not null, primary key (id)) engine=InnoDB
create table experiecia_profissional (id bigint not null auto_increment, atividade Text, data_alteracao datetime, data_cadastro datetime not null, data_fim date, data_inicio date, empresa_atual bit, nome_empresa varchar(100), sem_experiencia bit, curriculo_id bigint, primary key (id)) engine=InnoDB
create table foto_pessoa (id bigint not null auto_increment, content_type varchar(100), descricao varchar(100), nome_arquivo varchar(100), tamanho bigint, pessoa_id bigint, primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null, primary key (grupo_id, permissao_id)) engine=InnoDB
create table idioma (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(100) not null, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table pessoa (id bigint not null auto_increment, ativo bit not null, codigo varchar(50) not null, data_alteracao datetime, data_cadastro datetime not null, data_inativacao datetime, nome varchar(200) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB
create table pessoa_grupo (pessoa_id bigint not null, grupo_id bigint not null, primary key (pessoa_id, grupo_id)) engine=InnoDB
create table profissao (id bigint not null auto_increment, nome varchar(100) not null, primary key (id)) engine=InnoDB
create table profissional (data_nascimento date not null, estado_civil varchar(50) not null, nome_mae varchar(100), nome_pai varchar(100), pne bit not null, sexo varchar(20) not null, profissional_id bigint not null, curriculo_id bigint, primary key (profissional_id)) engine=InnoDB
create table sub_especialidade (id bigint not null auto_increment, nome varchar(50) not null, especialidade_id bigint not null, primary key (id)) engine=InnoDB
alter table cidade add constraint fk_cidade_estado foreign key (estado_id) references estado (id)
alter table contato add constraint fk_contato_pessoa foreign key (pessoa_id) references pessoa (id)
alter table curriculo add constraint fk_curriculo_profissional foreign key (profissional_id) references profissional (profissional_id)
alter table curriculo_especializacao add constraint fk_especializacao_curriculo foreign key (especializacao_id) references especializacao (id)
alter table curriculo_especializacao add constraint fk_curriculo_especializacao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_idioma add constraint fk_idioma_curriculo foreign key (idioma_id) references idioma (id)
alter table curriculo_idioma add constraint fk_curriculo_idioma foreign key (curriculo_id) references curriculo (id)
alter table curriculo_profissao add constraint fk_profissao_curriculo foreign key (profissao_id) references profissao (id)
alter table curriculo_profissao add constraint fk_curriculo_profissao foreign key (curriculo_id) references curriculo (id)
alter table curriculo_sub_especialidade add constraint fk_sub_especialidade_curriculo foreign key (sub_especialidade_id) references sub_especialidade (id)
alter table curriculo_sub_especialidade add constraint fk_curriculo_sub_especialidade foreign key (curriculo_id) references curriculo (id)
alter table curso add constraint fk_curso_curriculo foreign key (curriculo_id) references curriculo (id)
alter table documento add constraint fk_documento_estado foreign key (estado_id) references estado (id)
alter table documento add constraint fk_documento_pessoa foreign key (pessoa_id) references pessoa (id)
alter table empresa add constraint fk_empresa_pessoa foreign key (empresa_id) references pessoa (id)
alter table endereco add constraint fk_endereco_cidade foreign key (cidade_id) references cidade (id)
alter table endereco add constraint fk_endereco_pessoa foreign key (pessoa_id) references pessoa (id)
alter table experiecia_profissional add constraint fk_experiecia_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table foto_pessoa add constraint fk_foto_pessoa_pessoa foreign key (pessoa_id) references pessoa (id)
alter table grupo_permissao add constraint fk_permissao_grupo foreign key (permissao_id) references permissao (id)
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_grupo_pessoa foreign key (grupo_id) references grupo (id)
alter table pessoa_grupo add constraint fk_pessoa_grupo foreign key (pessoa_id) references pessoa (id)
alter table profissional add constraint fk_profissional_curriculo foreign key (curriculo_id) references curriculo (id)
alter table profissional add constraint fk_profissional_pessoa foreign key (profissional_id) references pessoa (id)
alter table sub_especialidade add constraint fk_sub_especialidade_especialidade foreign key (especialidade_id) references especialidade (id)
