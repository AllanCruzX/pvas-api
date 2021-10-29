create table usuario (
		usuario_id bigint not null, 
		primary key (usuario_id)
) engine=InnoDB default charset=utf8;

alter table usuario add constraint fk_usuario_pessoa 
foreign key (usuario_id) references pessoa (id);

