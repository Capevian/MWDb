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
   `oid_user`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid_user`)
);


-- Marca [ent1]
create table `marca` (
   `oid`  integer  not null,
   `nomemarca`  varchar(255),
   `logo`  varchar(255),
  primary key (`oid`)
);


-- Fotos_Modelo [ent10]
create table `fotos_modelo` (
   `oid`  integer  not null,
   `foto`  varchar(255),
  primary key (`oid`)
);


-- Avaliacao [ent11]
create table `avaliacao` (
   `avaliacao`  integer,
   `useroiduser`  integer  not null,
   `miniaturaoidmini`  integer  not null,
  primary key (`useroiduser`, `miniaturaoidmini`)
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
   `oid_mini`  integer  not null,
   `descricao`  varchar(255),
  primary key (`oid_mini`)
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


-- Comentario [ent7]
create table `comentario` (
   `oid`  integer  not null,
   `timestamp`  datetime,
   `texto`  varchar(255),
  primary key (`oid`)
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


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid_user`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid_user`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid_user`), add constraint fk_user_group_user foreign key (`user_oid_user`) references `user` (`oid_user`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Marca_Modelo [rel1]
alter table `modelo`  add column  `marca_oid`  integer;
alter table `modelo`   add index fk_modelo_marca (`marca_oid`), add constraint fk_modelo_marca foreign key (`marca_oid`) references `marca` (`oid`);


-- Miniatura_Fotos [rel10]
alter table `fotos_miniatura`  add column  `miniatura_oid_mini`  integer;
alter table `fotos_miniatura`   add index fk_fotos_miniatura_miniatura (`miniatura_oid_mini`), add constraint fk_fotos_miniatura_miniatura foreign key (`miniatura_oid_mini`) references `miniatura` (`oid_mini`);


-- Fotos_Modelo_Modelo [rel11]
alter table `modelo`  add column  `fotos_modelo_oid`  integer;
alter table `modelo`   add index fk_modelo_fotos_modelo (`fotos_modelo_oid`), add constraint fk_modelo_fotos_modelo foreign key (`fotos_modelo_oid`) references `fotos_modelo` (`oid`);


-- User_Avaliacao [rel12]
alter table `avaliacao`  add column  `user_oid_user`  integer;
alter table `avaliacao`   add index fk_avaliacao_user (`user_oid_user`), add constraint fk_avaliacao_user foreign key (`user_oid_user`) references `user` (`oid_user`);


-- Miniatura_Avaliacao [rel13]
alter table `avaliacao`  add column  `miniatura_oid_mini`  integer;
alter table `avaliacao`   add index fk_avaliacao_miniatura (`miniatura_oid_mini`), add constraint fk_avaliacao_miniatura foreign key (`miniatura_oid_mini`) references `miniatura` (`oid_mini`);


-- Tipo_Marca [rel14]
alter table `marca`  add column  `tipo_oid`  integer;
alter table `marca`   add index fk_marca_tipo (`tipo_oid`), add constraint fk_marca_tipo foreign key (`tipo_oid`) references `tipo` (`oid`);


-- Modelo_Miniatura [rel2]
alter table `miniatura`  add column  `modelo_oid`  integer;
alter table `miniatura`   add index fk_miniatura_modelo (`modelo_oid`), add constraint fk_miniatura_modelo foreign key (`modelo_oid`) references `modelo` (`oid`);


-- Escala_Miniatura [rel4]
alter table `miniatura`  add column  `escala_oid`  integer;
alter table `miniatura`   add index fk_miniatura_escala (`escala_oid`), add constraint fk_miniatura_escala foreign key (`escala_oid`) references `escala` (`oid`);


-- Construtor_Miniatura [rel5]
alter table `miniatura`  add column  `construtor_oid`  integer;
alter table `miniatura`   add index fk_miniatura_construtor (`construtor_oid`), add constraint fk_miniatura_construtor foreign key (`construtor_oid`) references `construtor` (`oid`);


-- Comentário_Miniatura [rel6]
alter table `comentario`  add column  `miniatura_oid_mini`  integer;
alter table `comentario`   add index fk_comentario_miniatura (`miniatura_oid_mini`), add constraint fk_comentario_miniatura foreign key (`miniatura_oid_mini`) references `miniatura` (`oid_mini`);


-- Comentário_User [rel7]
alter table `comentario`  add column  `user_oid_user`  integer;
alter table `comentario`   add index fk_comentario_user (`user_oid_user`), add constraint fk_comentario_user foreign key (`user_oid_user`) references `user` (`oid_user`);


