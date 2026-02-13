-- Script para habilitar esquema ADMIN en ORDS
-- Ejecutar este script si SQL Developer Web no funciona después de recrear volúmenes

SET SERVEROUTPUT ON
SET ECHO ON

-- Conectar a FREEPDB1
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Verificar que el usuario ADMIN existe
PROMPT Verificando usuario ADMIN...
SELECT username, account_status, default_tablespace
FROM dba_users
WHERE username = 'ADMIN';

-- Verificar que ORDS está instalado
PROMPT Verificando instalación de ORDS...
SELECT owner, object_name, object_type
FROM dba_objects
WHERE object_name = 'ORDS_ADMIN'
  AND owner = 'ORDS_METADATA'
  AND ROWNUM <= 5;

-- Habilitar el esquema ADMIN para ORDS
PROMPT Habilitando esquema ADMIN para ORDS...
BEGIN
    ORDS_ADMIN.ENABLE_SCHEMA(
        p_enabled             => TRUE,
        p_schema              => 'ADMIN',
        p_url_mapping_type    => 'BASE_PATH',
        p_url_mapping_pattern => 'admin',
        p_auto_rest_auth      => FALSE
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Esquema ADMIN habilitado para ORDS');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Si ORDS no está instalado, espera 1-2 minutos y vuelve a ejecutar este script');
END;
/

-- Verificar que se habilitó correctamente
PROMPT Verificando configuración...
SELECT schema_name, url_mapping_type, url_mapping_pattern
FROM ords_metadata.ords_schemas
WHERE schema_name = 'ADMIN';

PROMPT 
PROMPT ========================================
PROMPT Ahora intenta acceder a SQL Developer Web:
PROMPT URL: http://localhost:8181/ords/sql-developer
PROMPT Usuario: admin
PROMPT Contraseña: Admin_123
PROMPT ========================================
