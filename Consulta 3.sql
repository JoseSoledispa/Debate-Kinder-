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
