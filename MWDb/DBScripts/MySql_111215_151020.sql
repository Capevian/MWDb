-- Marca [ent1]
create table `marca_2` (
   `oid`  integer  not null,
   `nomemarca`  varchar(255),
   `logo`  varchar(255),
  primary key (`oid`)
);


-- Modelo [ent2]
create table `modelo_2` (
   `oid`  integer  not null,
   `nomemodelo`  varchar(255),
   `anolancamento`  date,
   `website`  varchar(255),
  primary key (`oid`)
);


