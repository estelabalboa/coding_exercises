Dada una tabla de events con la siguiente estructura:

  create table events (
      event_type integer not null,
      value integer not null,
      time timestamp not null,
      unique(event_type, time)
  );
Escriba una consulta (query) de SQL tal que, para cada event_type (tipo de evento) que haya sido registrado más de una vez,
 devuelva como resultado la diferencia entre el último (Ej. el más reciente en términos de tiempo (time)) y el anteúltimo valor (value). 
 La tabla debe estar ordenada por event_type (en orden ascendente).

Por ejemplo, dados los siguientes datos:

   event_type | value      | time
  ------------+------------+--------------------
   2          | 5          | 2015-05-09 12:42:00
   4          | -42        | 2015-05-09 13:19:57
   2          | 2          | 2015-05-09 14:48:30
   2          | 7          | 2015-05-09 12:54:39
   3          | 16         | 2015-05-09 13:19:57
   3          | 20         | 2015-05-09 15:01:09
Su consultra debería devolver como resultado las siguientes filas de datos:

   event_type | value
  ------------+-----------
   2          | -5
   3          | 4
Para el event_type 2, el último value es 2 y el anteúltimo es 7, de manera que la diferencia entre dichos valores es −5.

Los nombres de las columnas en las filas de datos no importa, pero sí su orden.




-- write your code in PostgreSQL 9.4
SELECT a.event_type, a.value2 as value 
from (SELECT event_type,
       max(time) as time,
       value - (lag(value, 1) over (partition by event_type order by time asc)) as value2
       FROM events
       group by event_type, value, time
     ) a
where value2 is not null
and time in (select max(time) from events group by event_type)


