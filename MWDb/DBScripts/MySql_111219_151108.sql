-- Fotos_Modelo_Modelo [rel11]
alter table `fotos_modelo_2`  add column  `modelo_oid`  integer;
alter table `fotos_modelo_2`   add index fk_fotos_modelo_2_modelo (`modelo_oid`), add constraint fk_fotos_modelo_2_modelo foreign key (`modelo_oid`) references `modelo` (`oid`);


