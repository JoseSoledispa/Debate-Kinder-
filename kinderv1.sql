
/*==============================================================*/
/* Table: INFANTE                                               */
/*==============================================================*/
create table INFANTE (
   ID_INFANTE           CHAR(10)            not null,
   ID_KINDER            CHAR(10)             null,
   CED_INFANTE          CHAR(10)             null,
   NOM_INFANTE          CHAR(50)             null,
   APELL_INFANTE        CHAR(50)             null,
   FECHA_NACIMIENTO_INFANTE DATE                 null,
   GENERO_INFANTE       CHAR(2)              null,
   NACIONALIDAD_INFANTE CHAR(20)             null,
   TALLA_INFANTE        CHAR(15)             null,
   PESO_INFANTE         CHAR(15)             null,
   TALLA_VESTIMENTA_INFANTE CHAR(2)              null,
   TALLA_ZAPATOS        CHAR(2)              null,
   constraint PK_INFANTE primary key (ID_INFANTE)
);


/*==============================================================*/
/* Table: INFANTE_PADREF                                        */
/*==============================================================*/
create table INFANTE_PADREF (
   ID_PADREF            CHAR(10)             not null,
   ID_INFANTE           CHAR(10)             not null,
   constraint PK_INFANTE_PADREF primary key (ID_PADREF, ID_INFANTE)
);


/*==============================================================*/
/* Table: KINDER                                                */
/*==============================================================*/
create table KINDER (
   ID_KINDER            CHAR(10)             not null,
   NOM_KINDER           CHAR(60)             null,
   DIRC_KINDER          CHAR(60)             null,
   TELF_KINDER          CHAR(15)             null,
   EMAIL_KINDER         CHAR(60)             null,
   constraint PK_KINDER primary key (ID_KINDER)
);


/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         CHAR(10)             not null,
   ID_INFANTE           CHAR(10)             null,
   ID_PROGRAMA          CHAR(10)             null,
   FECHA_INICIO_MATRICULA DATE                 null,
   FECHA_FINAL_MATRICULA DATE                 null,
   CALIFICACION_INFANTE CHAR(20)             null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);


/*==============================================================*/
/* Table: PADREF_INFANTE                                        */
/*==============================================================*/
create table PADREF_INFANTE (
   ID_PADREF            CHAR(10)             not null,
   NOM_PADRE            CHAR(50)             null,
   NOMS_MADRE           CHAR(50)             null,
   PADRE_VIVE_INFANTE   BOOL                 null,
   MADRE_VICE_INFANTE   BOOL                 null,
   constraint PK_PADREF_INFANTE primary key (ID_PADREF)
);


/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR (
   ID_PROFESOR          CHAR(10)             not null,
   ID_PROGRAMA          CHAR(10)             null,
   NOM_PROFESOR         CHAR(50)             null,
   APELL_PROFESOR       CHAR(50)             null,
   GENERO_PROFESOR      CHAR(2)              null,
   NUM_CETIRFICADO      CHAR(20)             null,
   constraint PK_PROFESOR primary key (ID_PROFESOR)
);

/*==============================================================*/
/* Index: PROFESOR_PK                                           */
/*==============================================================*/
create unique index PROFESOR_PK on PROFESOR (
ID_PROFESOR
);


/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA (
   ID_PROGRAMA          CHAR(10)             not null,
   NOM_PROGRAMA         CHAR(50)             null,
   DESC_PROGRAMA        CHAR(100)            null,
   CANT_CUPOS_PROGRAMA  INT4                 null,
   MATERIAL_PROGRAMA    CHAR(100)            null,
   DURACION_PROGRAMA    CHAR(20)             null,
   constraint PK_PROGRAMA primary key (ID_PROGRAMA)
);


/*==============================================================*/
/* Table: TIPO_ENFERMEDAD                                       */
/*==============================================================*/
create table TIPO_ENFERMEDAD (
   ID_ENFERMEDAD        CHAR(10)             not null,
   ID_INFANTE           CHAR(10)             null,
   NOM_ENFERMEDAD       CHAR(50)             null,
   DIAGNOSTICO_ENFERMEDAD CHAR(150)            null,
   MEDICAMENTO_INFANTE  CHAR(256)            null,
   MEDICO_TRATANTE      CHAR(50)             null,
   constraint PK_TIPO_ENFERMEDAD primary key (ID_ENFERMEDAD)
);


/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR (
   ID_TUTOR             CHAR(10)             not null,
   ID_INFANTE           CHAR(10)             null,
   CED_TUTOR            CHAR(10)             null,
   NOM_TUTOR            CHAR(50)             null,
   APELL_TUTOR          CHAR(50)             null,
   GENERO_TUTOR         CHAR(2)              null,
   NACIONALIDAD_TUTOR   CHAR(20)             null,
   DIRC_TUTOR           CHAR(60)             null,
   TELF_TUTOR           CHAR(15)             null,
   constraint PK_TUTOR primary key (ID_TUTOR)
);



alter table INFANTE
   add constraint FK_INFANTE_RELATIONS_KINDER foreign key (ID_KINDER)
      references KINDER (ID_KINDER)
      on delete restrict on update restrict;

alter table INFANTE_PADREF
   add constraint FK_INFANTE__RELATIONS_INFANTE foreign key (ID_INFANTE)
      references INFANTE (ID_INFANTE)
      on delete restrict on update restrict;

alter table INFANTE_PADREF
   add constraint FK_INFANTE__RELATIONS_PADREF_I foreign key (ID_PADREF)
      references PADREF_INFANTE (ID_PADREF)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_INFANTE foreign key (ID_INFANTE)
      references INFANTE (ID_INFANTE)
      on delete restrict on update restrict;

alter table PROFESOR
   add constraint FK_PROFESOR_RELATIONS_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA)
      on delete restrict on update restrict;

alter table TIPO_ENFERMEDAD
   add constraint FK_TIPO_ENF_RELATIONS_INFANTE foreign key (ID_INFANTE)
      references INFANTE (ID_INFANTE)
      on delete restrict on update restrict;

alter table TUTOR
   add constraint FK_TUTOR_RELATIONS_INFANTE foreign key (ID_INFANTE)
      references INFANTE (ID_INFANTE)
      on delete restrict on update restrict;
	  

		select * from kinder
	 
/*						INSERT						*/

--KINDER
--	select * from kinder
insert into kinder values ('kinder0001','Amaia Moreira','Manta','+593 995847418','kindermoreira@hotmail.com');



--INFANTES
--	select * from infante
insert into infante values ('infante001','kinder0001','1952525242','Carlos','Zambrano','15/02/2018','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante002','kinder0001','1952525243','Andres','Lucas','18/06/2018','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante003','kinder0001','1952525244','Julio','Cabezas','1/12/2017','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante004','kinder0001','1952525245','Samuel','Castro','25/09/2017','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante005','kinder0001','1952525246','Pedro','Quijije','15/02/2018','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante006','kinder0001','1952525247','Pablo','Mendez','18/06/2018','M','Ecuatoriano',
						   '96,5 cm','15,1 kg','23','27');
						   
insert into infante values ('infante007','kinder0001','1952525248','Carla','Proaño','15/02/2018','F','Ecuatoriana',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante008','kinder0001','1952525249','Meslissa','Lucas','18/06/2017','F','Ecuatoriana',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante009','kinder0001','1952525250','Yuliana','Zambrano','15/02/2018','F','Ecuatoriana',
						   '96,5 cm','15,1 kg','23','27');
insert into infante values ('infante010','kinder0001','1952525251','Julissa','Lucas','18/06/2017','F','Ecuatoriana',
						   '96,5 cm','15,1 kg','23','27');
                     
                     
                     
--PADRE DE INFANTES
--	select * from padref_infante
insert into padref_infante values ('padref0001','Carlos Zambrano','Karmen Lucas','1','1');
insert into padref_infante values ('padref0002','Andres Lucas','Maria Meza','1','1');
insert into padref_infante values ('padref0003','Julio Cabezas','Ximena Mera','1','1');

insert into padref_infante values ('padref0004','Samuel Castro','Lili Lucas','1','0');

insert into padref_infante values ('padref0005','Pedro Quijije','Carolina Jaramillo','0','1');
insert into padref_infante values ('padref0006','Pablo Mendez','Rita Herrera','0','1');


insert into padref_infante values ('padref0007','Carlos Proaño','Karmen Lucas','1','1');

insert into padref_infante values ('padref0008','Andres Lucas','Lili Lucas','1','0');
insert into padref_infante values ('padref0009','Julio Zambrano','Luisa Mendez','1','0');

insert into padref_infante values ('padref0010','Luis Lucas','Karen Zambrano','0','0');
	  
	  

--TABLA INTERMEDIA INFANTES-PADRES
--	select * from infante_padref
insert into infante_padref values ('padref0001','infante001');
insert into infante_padref values ('padref0002','infante002');
insert into infante_padref values ('padref0003','infante003');
insert into infante_padref values ('padref0004','infante004');
insert into infante_padref values ('padref0005','infante005');
insert into infante_padref values ('padref0006','infante006');
insert into infante_padref values ('padref0007','infante007');
insert into infante_padref values ('padref0008','infante008');
insert into infante_padref values ('padref0009','infante009');



--TUTOR
--	select * from tutor
insert into tutor values ('tutor00001','infante010','1999554544','Ximera','Mendez','F','Ecuatoriana',
								  'Manta','+593 9555858584');
								  						  
								  
--PROGRAMA
--	select * from programa
insert into programa values ('programa01','Desarrollo Intelectual','Desarrollo de actividades que mejoren las capacidades intelectuales',
							 '25','Material didactico de aprendizaje','3 Meses');
insert into programa values ('programa02','Desarrollo Emocional','Desarrollo de actividades que mejoren las capacidades emocionales',
							 '25','Material didactico de aprendizaje','3 Meses');
insert into programa values ('programa03','Desarrollo Motriz','Desarrollo de actividades que mejoren las capacidades motrices',
							 '25','Material didactico de aprendizaje','3 Meses');


--PROFESOR
--	select * from profesor
insert into profesor values ('profe00001','programa01','Jose','Mero','M','cert654546');
insert into profesor values ('profe00002','programa01','Alexander','Zamora','M','cert654547');
insert into profesor values ('profe00003','programa01','Jonatha','Salcedo','M','cert654548');

insert into profesor values ('profe00004','programa01','Maria','Mero','F','cert654549');
insert into profesor values ('profe00005','programa01','Carmen','Ramirez','F','cert654550');
insert into profesor values ('profe00006','programa01','Julissa','Fernandez','F','cert654551');
insert into profesor values ('profe00007','programa01','Gissela','Casanova','F','cert654552');

insert into profesor values ('profe00008','programa02','Mario','Fernandez','M','cert654553');
insert into profesor values ('profe00009','programa02','Gorge','Casanova','M','cert654554');

insert into profesor values ('profe00010','programa02','Luisa','Fernandez','F','cert654555');

insert into profesor values ('profe00011','programa03','Moises','Alcivar','M','cert654556');
insert into profesor values ('profe00012','programa03','Lenin','Bermudez','M','cert654557');
insert into profesor values ('profe00013','programa03','Mario','Cevallos','M','cert654558');
insert into profesor values ('profe00014','programa03','Carlos','Delgado','M','cert654559');
insert into profesor values ('profe00015','programa03','Josue','Garcia','M','cert654560');

insert into profesor values ('profe00016','programa03','Melisa','Hidalgo','F','cert654561');
insert into profesor values ('profe00017','programa03','Daniela','Jaramillo','F','cert654562');
insert into profesor values ('profe00018','programa03','Rosa','Hidalgo','F','cert654563');



--MATRICULA
--	select * from matricula
insert into matricula values ('matric0001','infante001','programa01','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0002','infante002','programa01','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0003','infante003','programa01','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0004','infante004','programa01','21/02/2021','21/05/2021','Excelente');

insert into matricula values ('matric0005','infante005','programa01','21/02/2021','21/05/2021','Regular');
insert into matricula values ('matric0006','infante006','programa01','21/02/2021','21/05/2021','Regular');

insert into matricula values ('matric0007','infante007','programa01','21/02/2021','21/05/2021','Bueno');

insert into matricula values ('matric0008','infante008','programa02','21/05/2021','21/08/2021','Excelente');
								  
insert into matricula values ('matric0009','infante009','programa02','21/05/2021','21/08/2021','Regular');
insert into matricula values ('matric0010','infante010','programa02','21/05/2021','21/08/2021','Regular');

insert into matricula values ('matric0011','infante001','programa03','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0012','infante002','programa03','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0013','infante003','programa03','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0014','infante004','programa03','21/02/2021','21/05/2021','Excelente');
insert into matricula values ('matric0015','infante005','programa03','21/02/2021','21/05/2021','Excelente');

insert into matricula values ('matric0016','infante006','programa03','21/02/2021','21/05/2021','Regular');

insert into matricula values ('matric0017','infante007','programa03','21/02/2021','21/05/2021','Bueno');
insert into matricula values ('matric0018','infante008','programa03','21/02/2021','21/05/2021','Bueno');



--TIPO DE ENFERMEDAD DE INFANTE
--	select * from tipo_enfermedad
insert into tipo_enfermedad values ('enfer00001','infante001','Bronquitis','Leve','Antibioticos'
									,'Dr. Sandro Moreira');
insert into tipo_enfermedad values ('enfer00002','infante002','Bronquiolitis','Leve','Antibioticos'
									,'Dr. Victor Santana');
insert into tipo_enfermedad values ('enfer00003','infante003','Sinusitis bacteriana','Leve','Antibioticos'
									,'Dr. Sandra Moreira');
insert into tipo_enfermedad values ('enfer00004','infante004','Gastroenteritis','Leve','Antibioticos'
									,'Dr. Victor Santana');
insert into tipo_enfermedad values ('enfer00005','infante005','Virus de la bofetada','Leve','Antibioticos'
									,'Dr. Carlos Victores');
insert into tipo_enfermedad values ('enfer00006','infante006','VSR','Leve','Antibioticos'
									,'Dr. Victor Santana');
insert into tipo_enfermedad values ('enfer00007','infante007','Bronquitis','Leve','Antibioticos'
									,'Dr. Sandro Moreira');
insert into tipo_enfermedad values ('enfer00008','infante008','Bronquiolitis','Leve','Antibioticos'
									,'Dr. Alonzo Mero');
insert into tipo_enfermedad values ('enfer00009','infante009','VSR','Leve','Antibioticos'
									,'Dr. Sandro Moreira');
insert into tipo_enfermedad values ('enfer00010','infante010','Bronquiolitis','Leve','Antibioticos'
									,'Dr. Luis Mero');



/*						CONSULTAS					*/


--	¿Qué estudiantes no tienen a su madre de forma activa en su vida? 
--	¿Qué estudiantes no tienen a su padre de forma activa en su vida?

--No tienen a su madre de forma activa
SELECT 
  infante.id_infante,
  infante.nom_infante || infante.apell_infante as Estudiante_de_kinder,
  padref_infante.id_padref, 
  padref_infante.padre_vive_infante, 
  padref_infante.madre_vice_infante
FROM public.infante
	INNER JOIN public.infante_padref on infante_padref.id_infante = infante.id_infante
	INNER JOIN public.padref_infante on infante_padref.id_padref = padref_infante.id_padref 
WHERE 
	padref_infante.madre_vice_infante != 'true'	--No tienen a su madre de forma activa

--No tienen a su padre de forma activa
SELECT 
  infante.id_infante,
  infante.nom_infante || infante.apell_infante as Estudiante_de_kinder,
  padref_infante.id_padref, 
  padref_infante.padre_vive_infante, 
  padref_infante.madre_vice_infante
FROM public.infante
	INNER JOIN public.infante_padref on infante_padref.id_infante = infante.id_infante
	INNER JOIN public.padref_infante on infante_padref.id_padref = padref_infante.id_padref 
WHERE 
	padref_infante.padre_vive_infante != 'true'	--No tienen a su padre de forma activa
	
	
	
--	Cantidad de calificaciones regulares, buenas y excelentes en cada actividad por cada infante.

--	Calificacion por estudiante especifico
SELECT 
  infante.id_infante,
  programa.nom_programa, 
  matricula.calificacion_infante
FROM public.infante
	INNER JOIN public.matricula on matricula.id_infante = infante.id_infante
    INNER JOIN public.programa on  programa.id_programa = matricula.id_programa
WHERE infante.id_infante = 'infante001'
GROUP BY  infante.id_infante, nom_programa, calificacion_infante
ORDER BY nom_programa 

--	Calificacion detallada por cada actividad
SELECT 
  programa.nom_programa, 
  matricula.calificacion_infante,
  count(matricula.calificacion_infante) as cantidad
FROM public.infante
	INNER JOIN public.matricula on matricula.id_infante = infante.id_infante
    INNER JOIN public.programa on  programa.id_programa = matricula.id_programa
GROUP BY  nom_programa, calificacion_infante
ORDER BY nom_programa desc


--	Calificacion general de todos los programas del Kinder
SELECT 
  matricula.calificacion_infante,
  count(matricula.calificacion_infante) as cantidad 
FROM public.infante
	INNER JOIN public.matricula on matricula.id_infante = infante.id_infante
    INNER JOIN public.programa on  programa.id_programa = matricula.id_programa
	
GROUP BY calificacion_infante
ORDER BY cantidad desc



-- Cantidad de profesores hombres y mujeres que tiene cada programa.
SELECT 
  programa.nom_programa, 
  profesor.genero_profesor,
  count(profesor.genero_profesor) as cantidad
FROM 
  public.programa
  INNER JOIN public.profesor on programa.id_programa = profesor.id_programa
GROUP BY genero_profesor, nom_programa
ORDER BY nom_programa

  





