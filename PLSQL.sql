--Implemente un programa que muestre el estado del servicio con el
--codigo del servicio en el intervalo [valorInicial, valorFinal] (ambos deben ser variables)
SET SERVEROUTPUT ON;
DECLARE
    first SERVICIO.CODIGO_SERVICIO%TYPE := 10000;
    last SERVICIO.CODIGO_SERVICIO%TYPE := 30000;
    estado VARCHAR2(100);
BEGIN
    FOR i IN first..last LOOP
        SELECT ESTADO
        INTO estado
        FROM SERVICIO
        WHERE CODIGO_SERVICIO = i;
        
        DBMS_OUTPUT.PUT_LINE(i || ': ' || estado);
    END LOOP;
END;
--Mostrar el nombre completo y teléfono del usuario dado su dni

DECLARE
    dniUsuario USUARIO.DNI_USUARIO%TYPE := 10918987;
    nombre VARCHAR2(100);
    telefono USUARIO.DNI_USUARIO%TYPE;
BEGIN
    SELECT NOMBRE, TELEFONO
    INTO nombre, telefono
    FROM USUARIO
    WHERE DNI_USUARIO = dniUsuario;
    
    DBMS_OUTPUT.PUT_LINE('Nombre completo: ' || nombre);
    DBMS_OUTPUT.PUT_LINE('Teléfono celular: ' || teléfono);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encuentra el usuario con dicho DNI');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error desconocido');
END;

----Funcion para obtener el nombre del técnico y especialización, siendo el DNI del técnico
----como parámetro de entrada

CREATE OR REPLACE FUNCTION getNombEspe(dniTEC TECNICO.DNI_TECNICO%TYPE)
RETURN VARCHAR2
AS
    nombEspe VARCHAR2(100);
BEGIN
    SELECT NOMBRE || ' ' || ESPECIALIZACION
    INTO nombEspe
    FROM TECNICO 
    WHERE DNI_TECNICO = dniTEC;
    
    RETURN nombEspe;
END;
--Prueba de la funcion creada
BEGIN
    DBMS_OUTPUT.PUT_LINE(UPPER(getNombEspe(53386349)));
END;