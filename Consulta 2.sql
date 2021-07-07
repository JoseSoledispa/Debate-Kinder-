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