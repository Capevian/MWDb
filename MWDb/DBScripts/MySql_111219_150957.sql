-- Fotos_Modelo_Modelo [rel11]
alter table `fotos_modelo`  add column  `modelo_oid`  integer;
alter table `fotos_modelo`   add index fk_fotos_modelo_modelo (`modelo_oid`), add constraint fk_fotos_modelo_modelo foreign key (`modelo_oid`) references `modelo` (`oid`);


