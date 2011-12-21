-- REL FK: UserToAvaliacao [rel3#role5]
alter table `avaliacao`   add index fk_avaliacao_user (`user_oid`), add constraint fk_avaliacao_user foreign key (`user_oid`) references `user` (`oid_user`);


-- REL FK: MiniaturaToAvaliacao [rel8#role16]
alter table `avaliacao`   add index fk_avaliacao_miniatura (`mini_oid`), add constraint fk_avaliacao_miniatura foreign key (`mini_oid`) references `miniatura` (`oid_mini`);


