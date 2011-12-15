-- REL FK: UserToAvaliacao [rel12#role23]
alter table `avaliacao`   add index fk_avaliacao_user (`useroiduser`), add constraint fk_avaliacao_user foreign key (`useroiduser`) references `user` (`oid_user`);


-- REL FK: MiniaturaToAvaliacao [rel13#role25]
alter table `avaliacao`   add index fk_avaliacao_miniatura (`miniaturaoidmini`), add constraint fk_avaliacao_miniatura foreign key (`miniaturaoidmini`) references `miniatura` (`oid_mini`);


