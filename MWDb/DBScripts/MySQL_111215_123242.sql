-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `email`  varchar(255),
   `password`  varchar(255),
   `username`  varchar(255),
  primary key (`oid`)
);


-- Marca [ent1]
create table `marca` (
   `oid`  integer  not null,
   `logo`  varchar(255),
   `nomemarca`  varchar(255),
  primary key (`oid`)
);


-- Fotos_Modelo [ent10]
create table `fotos_modelo` (
   `oid`  integer  not null,
   `foto`  varchar(255),
  primary key (`oid`)
);


-- Modelo [ent2]
create table `modelo` (
   `oid`  integer  not null,
   `nomemodelo`  varchar(255),
   `anolancamento`  date,
   `website`  varchar(255),
  primary key (`oid`)
);


-- Miniatura [ent3]
create table `miniatura` (
   `oid`  integer  not null,
   `descricao`  varchar(255),
  primary key (`oid`)
);


-- Tipo [ent4]
create table `tipo` (
   `oid`  integer  not null,
   `descricao`  varchar(255),
  primary key (`oid`)
);


-- Escala [ent5]
create table `escala` (
   `oid`  integer  not null,
   `descricao`  varchar(255),
  primary key (`oid`)
);


-- Construtor [ent6]
create table `construtor` (
   `oid`  integer  not null,
   `nomeconstrutor`  varchar(255),
   `logo`  varchar(255),
   `website`  varchar(255),
  primary key (`oid`)
);


-- Comentário [ent7]
create table `comentario` (
   `oid`  integer  not null,
   `timestamp`  datetime,
   `texto`  varchar(255),
  primary key (`oid`)
);


-- Avaliação [ent8]
create table `avaliacao` (
   `avaliacao`  integer
);


-- Fotos_Miniatura [ent9]
create table `fotos_miniatura` (
   `oid`  integer  not null,
   `foto`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module` on `group`(`module_oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);
create index `idx_group_module_group` on `group_module`(`group_oid`);
create index `idx_group_module_module` on `group_module`(`module_oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_user_group` on `user`(`group_oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);
create index `idx_user_group_user` on `user_group`(`user_oid`);
create index `idx_user_group_group` on `user_group`(`group_oid`);


-- Marca_Modelo [rel1]
alter table `marca`  add column  `modelo_oid`  integer;
alter table `marca`   add index fk_marca_modelo (`modelo_oid`), add constraint fk_marca_modelo foreign key (`modelo_oid`) references `modelo` (`oid`);
create index `idx_marca_modelo` on `marca`(`modelo_oid`);


-- Miniatura_Fotos [rel10]
alter table `miniatura`  add column  `fotos_miniatura_oid`  integer;
alter table `miniatura`   add index fk_miniatura_fotos_miniatura (`fotos_miniatura_oid`), add constraint fk_miniatura_fotos_miniatura foreign key (`fotos_miniatura_oid`) references `fotos_miniatura` (`oid`);
create index `idx_miniatura_fotos_miniatura` on `miniatura`(`fotos_miniatura_oid`);


-- Fotos_Modelo_Modelo [rel11]
alter table `modelo`  add column  `fotos_modelo_oid`  integer;
alter table `modelo`   add index fk_modelo_fotos_modelo (`fotos_modelo_oid`), add constraint fk_modelo_fotos_modelo foreign key (`fotos_modelo_oid`) references `fotos_modelo` (`oid`);
create index `idx_modelo_fotos_modelo` on `modelo`(`fotos_modelo_oid`);


-- Modelo_Miniatura [rel2]
alter table `modelo`  add column  `miniatura_oid`  integer;
alter table `modelo`   add index fk_modelo_miniatura (`miniatura_oid`), add constraint fk_modelo_miniatura foreign key (`miniatura_oid`) references `miniatura` (`oid`);
create index `idx_modelo_miniatura` on `modelo`(`miniatura_oid`);


-- Tipo_Modelo [rel3]
alter table `tipo`  add column  `modelo_oid`  integer;
alter table `tipo`   add index fk_tipo_modelo (`modelo_oid`), add constraint fk_tipo_modelo foreign key (`modelo_oid`) references `modelo` (`oid`);
create index `idx_tipo_modelo` on `tipo`(`modelo_oid`);


-- Escala_Miniatura [rel4]
alter table `escala`  add column  `miniatura_oid`  integer;
alter table `escala`   add index fk_escala_miniatura (`miniatura_oid`), add constraint fk_escala_miniatura foreign key (`miniatura_oid`) references `miniatura` (`oid`);
create index `idx_escala_miniatura` on `escala`(`miniatura_oid`);


-- Construtor_Miniatura [rel5]
alter table `construtor`  add column  `miniatura_oid`  integer;
alter table `construtor`   add index fk_construtor_miniatura (`miniatura_oid`), add constraint fk_construtor_miniatura foreign key (`miniatura_oid`) references `miniatura` (`oid`);
create index `idx_construtor_miniatura` on `construtor`(`miniatura_oid`);


-- Comentário_Miniatura [rel6]
alter table `miniatura`  add column  `comentario_oid`  integer;
alter table `miniatura`   add index fk_miniatura_comentario (`comentario_oid`), add constraint fk_miniatura_comentario foreign key (`comentario_oid`) references `comentario` (`oid`);
create index `idx_miniatura_comentario` on `miniatura`(`comentario_oid`);


-- Comentário_User [rel7]
alter table `user`  add column  `comentario_oid`  integer;
alter table `user`   add index fk_user_comentario (`comentario_oid`), add constraint fk_user_comentario foreign key (`comentario_oid`) references `comentario` (`oid`);
create index `idx_user_comentario` on `user`(`comentario_oid`);


-- User_Avaliação [rel8]
alter table `user`   add index fk_user_avaliacao (), add constraint fk_user_avaliacao foreign key () references `avaliacao` ();
create index `idx_user_avaliacao` on `user`();


-- Miniatura_Avaliação [rel9]
alter table `miniatura`   add index fk_miniatura_avaliacao (), add constraint fk_miniatura_avaliacao foreign key () references `avaliacao` ();
create index `idx_miniatura_avaliacao` on `miniatura`();


