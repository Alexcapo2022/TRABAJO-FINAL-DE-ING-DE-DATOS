--CONSULTA USUARIO
SELECT      u.dni_usuario, u.nombre, a.codigo_averia, t.nombre AS "TENICO",t.dni_tecnico, t.celular
FROM         usuario u, averia a, atender at, tecnico t
WHERE      u.dni_usuario=a.dni_usuario AND a.codigo_averia=at.codigo_averia AND at.dni_tecnico=t.dni_tecnico 
                    AND a.dni_usuario='11006568';
                    

SELECT      t.nombre AS "TENICO",t.dni_tecnico, t.celular, at.hora_llegada, at.hora_salida, a.fecha_inicia, a.fecha_fin, a.estado_averia
FROM         usuario u, averia a, atender at, tecnico t
WHERE      u.dni_usuario=a.dni_usuario AND a.codigo_averia=at.codigo_averia AND at.dni_tecnico=t.dni_tecnico 
                    AND a.dni_usuario='11006568' AND a.codigo_averia='A-898345';
                    
    



--CONSULTA ASESOR
SELECT      tec.nombre AS "NOMBRE TECNICO", tec.dni_tecnico, tec."COMPAÑIA", tec.celular, tec.especializacion
FROM        asesor ase, agendar age, tecnico tec
WHERE     ase.dni_asesor=age.dni_asesor AND age.dni_tecnico=tec.dni_tecnico
                    AND age.disponibilidad=UPPER('SI')AND tec."COMPAÑIA" like 'A%';
                    
SELECT      a.codigo_averia, a.hora_llegada, a.fecha_fin, a.estado_averia
FROM         averia a
WHERE      a.dni_usuario='72089598';

SELECT              COUNT(*) as "CANTIDA DE SERVICIOS", d.departamento
FROM                 direccion d
WHERE               UPPER(d.departamento)=UPPER('lima')
GROUP BY          d.departamento;
--CONSULTA TECNICO
SELECT      u.nombre, u.dni_usuario, u.telefono, d.departamento, d.provincia, 'Calle  ' || d.calle || ' Mz. ' || d.mz || ' Lote  ' || d.lote || '  Urb. ' || d.urbanziacion AS "DIRECCION", d.distrito, p.averia_pendiente, s.tipo_paquete
FROM         usuario u, pertenecer p, servicio s, direccion d
WHERE       u.dni_usuario=p.dni_usuario AND p.codigo_servicio=s.codigo_servicio AND s.codigo_servicio=d.codigo_servicio
                     AND s.codigo_servicio='37659';

SELECT      s.codigo_averia, a.dni_usuario, u.nombre, s.tecnologia, s.estado, s.equipo, s.tipo_paquete, a.hora_llegada, a.fecha_inicia, a.fecha_fin
FROM        usuario u, averia a, servicio s
WHERE     u.dni_usuario=a.dni_usuario AND a.codigo_averia=s.codigo_averia
                    AND s.codigo_servicio='37659' ;
                    
SELECT          a.codigo_averia, t.nombre, t.dni_tecnico, t."COMPAÑIA", t.especializacion, r.troba, r.nodo, at.hora_salida, at.hora_llegada, a.estado_averia
FROM            tecnico t, reparar r, servicio s, averia a, atender at
WHERE         t.dni_tecnico=r.dni_tecnico AND r.codigo_servicio=s.codigo_servicio AND s.codigo_averia=a.codigo_averia AND a.codigo_averia=at.codigo_averia
                       AND s.codigo_servicio='37659' ;
                       
SELECT AV.CODIGO_AVERIA,AV.HORA_LLEGADA,AV.FECHA_FIN,AV.ESTADO_AVERIA,A.DNI_ASESOR,U.DNI_USUARIO
FROM AVERIA AV
INNER JOIN ASESOR A
ON AV.DNI_ASESOR = A.DNI_ASESOR
INNER JOIN USUARIO U
ON AV.DNI_USUARIO = U.DNI_USUARIO;

SELECT CODIGO_AVERIA,HORA_LLEGADA,FECHA_INICIA,FECHA_FIN,ESTADO_AVERIA,DNI_ASESOR,DNI_USUARIO
FROM AVERIA INNER JOIN USUARIO USING(DNI_USUARIO)
INNER JOIN ASESOR USING(DNI_ASESOR);

SELECT tecnico.nombre AS "TECNICO",TECNICO."COMPAÑIA" as "COMPAÑIA",tecnico.especializacion AS "ESPECIALIZACION",DNI_ASESOR,DNI_TECNICO,DISPONIBILIDAD
FROM AGENDAR INNER JOIN ASESOR USING (DNI_ASESOR)
INNER JOIN TECNICO USING (DNI_TECNICO)
WHERE DISPONIBILIDAD='SI';

SELECT A.usuario AS "USUARIO",av.codigo_averia as "CODIGO_AVERIA",av.hora_llegada AS "HORA_LLEGADA",s.tecnologia AS "TECNOLOGIA",s.tipo_paquete AS "TIPO_PAQUETE",
s.estado AS "ESTADO",av.estado_averia AS "ESTADO_AVERIA"
FROM ASESOR A
INNER JOIN AVERIA AV
ON a.dni_asesor = av.dni_asesor
INNER JOIN SERVICIO S
ON av.codigo_averia = s.codigo_averia
WHERE ESTADO_AVERIA = 'EN PROCESO';
--SELECT      u.nombre, u.dni_usuario, u.telefono, d.departamento, d.provincia, 'Calle  ' || d.calle || ' Mz. ' || d.mz || ' Lote  ' || d.lote || '  Urb. ' || d.urbanziacion AS "DIRECCION", d.distrito, p.averia_pendiente, s.tipo_paquete
--FROM         usuario u, pertenecer p, servicio s, direccion d
--WHERE       u.dni_usuario=p.dni_usuario AND p.codigo_servicio=s.codigo_servicio AND s.codigo_servicio=d.codigo_servicio
                    -- AND s.codigo_servicio='37659';

SELECT asE.USUARIO AS "USUARIO" ,u.nombre AS "NOMBRE",s.codigo_servicio AS "CODIGO_SERVICIO"
,a.codigo_averia AS "CODIGO_AVERIA",s.tipo_paquete AS "TIPO_PAQUETE",p.averia_pendiente AS "AVERIA_PENDIENTE",d.departamento, d.provincia,d.distrito AS "DISTRITO", 'Calle  ' || d.calle || ' Mz. ' || d.mz || ' Lote  ' || d.lote || '  Urb. ' || d.urbanziacion AS "DIRECCION" 
FROM USUARIO U 
INNER JOIN PERTENECER P
ON U.DNI_USUARIO = P.DNI_USUARIO
INNER JOIN SERVICIO S
ON P.CODIGO_SERVICIO = S.CODIGO_SERVICIO
INNER JOIN DIRECCION D
ON S.CODIGO_SERVICIO = D.CODIGO_SERVICIO
INNER JOIN AVERIA A
ON s.codigo_averia = A.CODIGO_averia
inner join ASESOR ASE
on A.DNI_ASESOR = asE.DNI_ASESOR
WHERE p.averia_pendiente='NO'
;

--WHERE p.averia_pendiente='NO'



