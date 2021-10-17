create table grupo (
	id bigint not null auto_increment,
	nome varchar(100) not null,
	
	primary key (id)
) engine=InnoDB default charset=utf8;

create table grupo_permissao (
	grupo_id bigint not null,
	permissao_id bigint not null,
	
	primary key (grupo_id, permissao_id)
) engine=InnoDB default charset=utf8;

create table permissao (
	id bigint not null auto_increment,
	descricao varchar(100) not null,
	nome varchar(100) not null,
	
	primary key (id)
) engine=InnoDB default charset=utf8;

create table pessoa_grupo (
	pessoa_id bigint not null,
	grupo_id bigint not null,
	
	primary key (pessoa_id, grupo_id)
) engine=InnoDB default charset=utf8;

alter table pessoa 
add column senha varchar(255) not null  after nome;

alter table grupo_permissao add constraint fk_permissao_grupo
foreign key (permissao_id) references permissao (id);

alter table grupo_permissao add constraint fk_grupo_permissao
foreign key (grupo_id) references grupo (id);

alter table pessoa_grupo add constraint fk_grupo_pessoa
foreign key (grupo_id) references grupo (id);

alter table pessoa_grupo add constraint fk_pessoa_grupo
foreign key (pessoa_id) references pessoa (id);