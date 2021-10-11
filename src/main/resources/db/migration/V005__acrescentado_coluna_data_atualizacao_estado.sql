alter table estado add data_atualizacao datetime null;
update estado set data_atualizacao = utc_timestamp;
alter table estado modify data_atualizacao datetime not null;