-- REL FK: UserToAvaliação [rel8#role15]
alter table `avaliacao`   add index fk_avaliacao_user (`user_oid_user`), add constraint fk_avaliacao_user foreign key (`user_oid_user`) references `user` (`oid_user`);


-- REL FK: MiniaturaToAvaliação [rel9#role17]
alter table `avaliacao`   add index fk_avaliacao_miniatura (`miniatura_oid_mini`), add constraint fk_avaliacao_miniatura foreign key (`miniatura_oid_mini`) references `miniatura` (`oid_mini`);


-- Miniatura.Avaliação [ent3#att28]
create view `miniatura_avaliacao_view` as
select AL1.`oid_mini` as `oid_mini`, avg(AL3.`avaliacao`) as `der_attr`
from  `miniatura` AL1 
               left outer join `avaliacao` AL2 on AL1.`oid_mini`=AL2.`miniatura_oid_mini`
               left outer join `avaliacao` AL3 on AL2.``=AL3.`user_oid_user` and AL2.``=AL3.`miniatura_oid_mini`
where AL1.`oid_mini` = AL3.`miniatura_oid_mini`
group by AL1.`oid_mini`;


