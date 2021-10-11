alter table pessoa add codigo varchar(36) not null after id;
update pessoa set codigo = uuid();
alter table pessoa add constraint uk_pessoa_codigo unique (codigo);