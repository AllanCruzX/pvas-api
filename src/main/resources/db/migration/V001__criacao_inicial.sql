create table cidade (
		id bigint not null auto_increment, 
		nome varchar(50) not null,
		estado_id bigint not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table contato (
		id bigint not null auto_increment, 
		descricao varchar(200) not null, 
		tipo_contato varchar(50) not null, 
		pessoa_id bigint not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table curso (
		id bigint not null auto_increment, 
		chaga_horaria varchar(100) not null, 
		nome varchar(100) not null, 
		pessoa_fisica_id bigint not null, 
		primary key (id)		
) engine=InnoDB default charset=utf8;

create table documento (
		id bigint not null auto_increment, 
		codigo varchar(100) not null, 
		data_emissao date, 
		orgao_expedidor varchar(100), 
		serie_categoria_zona varchar(100), 
		sessao varchar(50), 
		tipo_documento varchar(50) not null, 
		estado_id bigint, 
		pessoa_id bigint not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table endereco (
	id bigint not null auto_increment, 
	bairro varchar(200) not null, 
	cep varchar(100) not null, 
	complemento varchar(200), 
	logradouro varchar(200) not null, 
	numero varchar(50) not null, 
	tipo_endereco varchar(50) not null, 
	cidade_id bigint not null, 
	pessoa_id bigint not null, 
	primary key (id)
) engine=InnoDB default charset=utf8;

create table especialidade (
		id bigint not null auto_increment, 
		nome varchar(50) not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table especializacao (
		id bigint not null auto_increment, 
		nome varchar(100) not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table estado (
		id bigint not null auto_increment, 
		nome varchar(50) not null, 
		sigla varchar(10) not null, 
		primary key (id)		
) engine=InnoDB default charset=utf8;

create table experiecia_profissional (
		id bigint not null auto_increment, 
		atividade Text, data_fim date, 
		data_inicio date, empresa_atual bit, 
		nome_empresa varchar(100), 
		sem_experiencia bit, 
		pessoa_fisica_id bigint not null, 
		primary key (id)		
) engine=InnoDB default charset=utf8;

create table foto_pessoa (
		id bigint not null auto_increment,
		content_type varchar(100), 
		descricao varchar(100), 
		nome_arquivo varchar(100), 
		tamanho bigint, 
		pessoa_id bigint not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table idioma (
		id bigint not null auto_increment, 
		nome varchar(100) not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

create table pessoa (
		id bigint not null auto_increment, 
		ativo bit not null, 
		data_cadastro datetime not null, 
		nome varchar(200) not null, 
		primary key (id)	
) engine=InnoDB default charset=utf8;

create table pessoa_fisica (
		data_nascimento date not null, 
		estado_civil varchar(50) not null, 
		nome_mae varchar(100), 
		nome_pai varchar(100), 
		pne bit not null, 
		sexo varchar(20) not null, 
		pessoa_fisica_id bigint not null, 
		primary key (pessoa_fisica_id)
) engine=InnoDB default charset=utf8;

create table pessoa_fisica_especializacao (
		pessoa_fisica_id bigint not null, 
		especializacao_id bigint not null, 
		primary key (pessoa_fisica_id, especializacao_id)
) engine=InnoDB default charset=utf8;

create table pessoa_fisica_idioma (
		pessoa_fisica_id bigint not null, 
		idioma_id bigint not null, 
		primary key (pessoa_fisica_id, idioma_id)
) engine=InnoDB default charset=utf8;

create table pessoa_fisica_sub_especialidade (
		pessoa_fisica_id bigint not null, 
		sub_especialidade_id bigint not null, 
		primary key (pessoa_fisica_id, sub_especialidade_id)
) engine=InnoDB default charset=utf8;

create table pessoa_juridica (
		valor varchar(200), visao varchar(200), 
		pessoa_juridica_id bigint not null, 
		primary key (pessoa_juridica_id)
) engine=InnoDB default charset=utf8;

create table sub_especialidade (
		id bigint not null auto_increment, 
		nome varchar(50) not null, 
		especialidade_id bigint not null, 
		primary key (id)
) engine=InnoDB default charset=utf8;

alter table cidade add constraint fk_cidade_estado 
foreign key (estado_id) references estado (id);

alter table contato add constraint fk_contato_pessoa 
foreign key (pessoa_id) references pessoa (id);

alter table curso add constraint fk_curso_pessoa_fisica 
foreign key (pessoa_fisica_id) references pessoa_fisica (pessoa_fisica_id);

alter table documento add constraint fk_documento_estado 
foreign key (estado_id) references estado (id);

alter table documento add constraint fk_documento_pessoa 
foreign key (pessoa_id) references pessoa (id);

alter table endereco add constraint fk_endereco_cidade 
foreign key (cidade_id) references cidade (id);

alter table endereco add constraint fk_endereco_pessoa 
foreign key (pessoa_id) references pessoa (id);

alter table experiecia_profissional add constraint fk_experiecia_profissional_pessoa_fisica 
foreign key (pessoa_fisica_id) references pessoa_fisica (pessoa_fisica_id);

alter table foto_pessoa add constraint fk_foto_pessoa_pessoa 
foreign key (pessoa_id) references pessoa (id);

alter table pessoa_fisica add constraint fk_pessoa_fisica_pessoa 
foreign key (pessoa_fisica_id) references pessoa (id);

alter table pessoa_fisica_especializacao add constraint fk_especializacao_pessoa_fisica 
foreign key (especializacao_id) references especializacao (id);

alter table pessoa_fisica_especializacao add constraint fk_pessoa_fisica_especializacao 
foreign key (pessoa_fisica_id) references pessoa_fisica (pessoa_fisica_id);

alter table pessoa_fisica_idioma add constraint fk_idioma_pessoa_fisica 
foreign key (idioma_id) references idioma (id);

alter table pessoa_fisica_idioma add constraint fk_pessoa_fisica_idioma 
foreign key (pessoa_fisica_id) references pessoa_fisica (pessoa_fisica_id);

alter table pessoa_fisica_sub_especialidade add constraint fk_sub_especialidade_pessoa_fisica 
foreign key (sub_especialidade_id) references sub_especialidade (id);

alter table pessoa_fisica_sub_especialidade add constraint fk_pessoa_fisica_sub_especialidade 
foreign key (pessoa_fisica_id) references pessoa_fisica (pessoa_fisica_id);

alter table pessoa_juridica add constraint fk_pessoa_juridica_pessoa 
foreign key (pessoa_juridica_id) references pessoa (id);

alter table sub_especialidade add constraint fk_sub_especialidade_especialidade 
foreign key (especialidade_id) references especialidade (id);
