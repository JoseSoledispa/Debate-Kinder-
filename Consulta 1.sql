CONSULTAS					*/


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