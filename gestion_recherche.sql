/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  09/05/2024 18:33:59                      */
/*==============================================================*/


drop table if exists Administrateur;

drop table if exists Collaborateur;

drop table if exists Etudiant;

drop table if exists Professeur;

drop table if exists Projets;

drop table if exists etudiantCollaborateur;

/*==============================================================*/
/* Table : Administrateur                                       */
/*==============================================================*/
create table Administrateur
(
   idAdministrateur     int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   lieuDeNaissance      varchar(254),
   email                varchar(254),
   motDePasse           varchar(254),
   statut               varchar(254),
   primary key (idAdministrateur),
   key AK_Identifiant_1 (idAdministrateur),
   key AK_Identifiant_2 (idAdministrateur)
);

/*==============================================================*/
/* Table : Collaborateur                                        */
/*==============================================================*/
create table Collaborateur
(
   idCollaborateur      int not null,
   message              varchar(254),
   primary key (idCollaborateur),
   key AK_Identifiant_1 (message),
   key AK_Identifiant_2 (idCollaborateur)
);

/*==============================================================*/
/* Table : Etudiant                                             */
/*==============================================================*/
create table Etudiant
(
   idEtudiant           int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   lieuDeNaissance      varchar(254),
   email                varchar(254),
   motDePasse           varchar(254),
   statut               varchar(254),
   primary key (idEtudiant),
   key AK_Identifiant_1 (idEtudiant)
);

/*==============================================================*/
/* Table : Professeur                                           */
/*==============================================================*/
create table Professeur
(
   idProfesseur          int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   lieuDeNaissance      varchar(254),
   email                varchar(254),
   motDePasse           varchar(254),
   statut               varchar(254),
   primary key (idProfesseur),
   key AK_Identifiant_1 (idProfesseur),
   key AK_Identifiant_2 (idProfesseur)
);

/*==============================================================*/
/* Table : Projets                                              */
/*==============================================================*/
create table Projets
(
   idProjet             int not null,
   idEtudiant           int not null,
   idProfessur          int,
   titre                varchar(254),
   description          varchar(254),
   competences          varchar(254),
   jalons               int,
   tacheRealises        int,
   primary key (idProjet),
   key AK_Identifiant_3 (idProjet)
);

/*==============================================================*/
/* Table : association4                                         */
/*==============================================================*/
create table etudiantCollaborateur
(
   idEtudiant           int not null,
   idCollaborateur      int not null,
   primary key (idEtudiant, idCollaborateur)
);

alter table Projets add constraint FK_association2 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

alter table Projets add constraint FK_association3 foreign key (idProfessur)
      references Professeur (idProfessur) on delete restrict on update restrict;

alter table association4 add constraint FK_association4 foreign key (idCollaborateur)
      references Collaborateur (idCollaborateur) on delete restrict on update restrict;

alter table association4 add constraint FK_association4 foreign key (idEtudiant)
      references Etudiant (idEtudiant) on delete restrict on update restrict;

