-- REL FK: UserToAvaliacao [rel12#role23]
alter table `avaliacao`   add index fk_avaliacao_user (`user_oid_user`), add constraint fk_avaliacao_user foreign key (`user_oid_user`) references `user` (`oid_user`);


-- REL FK: AvaliacaoToUser [rel12#role24]
alter table `avaliacao`   add index fk_user_avaliacao (`miniatura_oid_mini`, `user_oid_user`), add constraint fk_user_avaliacao foreign key (`miniatura_oid_mini`, `user_oid_user`) references `avaliacao` (`miniatura_oid_mini`, `user_oid_user`);


-- REL FK: MiniaturaToAvaliacao [rel13#role25]
alter table `avaliacao`   add index fk_avaliacao_miniatura (`miniatura_oid_mini`), add constraint fk_avaliacao_miniatura foreign key (`miniatura_oid_mini`) references `miniatura` (`oid_mini`);


-- REL FK: AvaliacaoToMiniatura [rel13#role26]
alter table `avaliacao`   add index fk_miniatura_avaliacao (`miniatura_oid_mini`, `user_oid_user`), add constraint fk_miniatura_avaliacao foreign key (`miniatura_oid_mini`, `user_oid_user`) references `avaliacao` (`miniatura_oid_mini`, `user_oid_user`);


