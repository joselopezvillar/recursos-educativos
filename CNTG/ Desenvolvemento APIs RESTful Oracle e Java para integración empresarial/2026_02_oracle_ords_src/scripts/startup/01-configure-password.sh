#!/bin/bash
# Script de startup para Oracle Database
# Se ejecuta automáticamente cuando el contenedor inicia

echo "=========================================="
echo "🔧 Configurando Oracle Database..."
echo "=========================================="

# Función para ejecutar SQL
run_sql() {
    sqlplus -s / as sysdba <<EOF
    SET HEADING OFF
    SET FEEDBACK OFF
    $1
    EXIT;
EOF
}

# Esperar a que Oracle esté completamente lista
echo "⏳ Esperando a que Oracle esté lista..."
max_attempts=30
attempt=0
until run_sql "SELECT 1 FROM dual;" > /dev/null 2>&1; do
    attempt=$((attempt + 1))
    if [ $attempt -ge $max_attempts ]; then
        echo "❌ Oracle no está respondiendo después de $max_attempts intentos"
        exit 1
    fi
    echo "   Intento $attempt/$max_attempts..."
    sleep 5
done

echo "✅ Oracle está lista"

# Configurar la contraseña de SYS
echo "🔑 Configurando contraseña de SYS..."
run_sql "ALTER USER SYS IDENTIFIED BY ${ORACLE_PASSWORD};" > /dev/null 2>&1

# Recrear el archivo de contraseñas
echo "📝 Recreando archivo de contraseñas..."
orapwd file=${ORACLE_HOME}/dbs/orapw${ORACLE_SID} password="${ORACLE_PASSWORD}" entries=10 force=yes 2>&1

# Verificar la conexión
echo "🔍 Verificando conexión..."
if echo "exit" | sqlplus -s sys/${ORACLE_PASSWORD}@localhost:1521/FREE as sysdba > /dev/null 2>&1; then
    echo "✅ Conexión verificada exitosamente"
else
    echo "⚠️  Advertencia: No se pudo verificar la conexión"
fi

# Mostrar información de las PDBs
echo "📊 Estado de las PDBs:"
run_sql "SELECT name, open_mode FROM v\$pdbs;"

# Crear usuario ADMIN para SQL Developer Web
echo "👤 Configurando usuario ADMIN..."
sqlplus -s / as sysdba <<'EOSQL' > /dev/null 2>&1
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Verificar si el usuario existe
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users WHERE username = 'ADMIN';
  IF v_count = 0 THEN
    -- Crear usuario
    EXECUTE IMMEDIATE 'CREATE USER admin IDENTIFIED BY Admin_123
      DEFAULT TABLESPACE users
      TEMPORARY TABLESPACE temp
      QUOTA UNLIMITED ON users';
    
    -- Otorgar privilegios
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE TABLE TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE PROCEDURE TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE SEQUENCE TO admin';
    EXECUTE IMMEDIATE 'GRANT CREATE TRIGGER TO admin';
    EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO admin';
    
    -- Habilitar REST
    BEGIN
      EXECUTE IMMEDIATE 'BEGIN
        ORDS_ADMIN.ENABLE_SCHEMA(
          p_enabled => TRUE,
          p_schema => ''ADMIN'',
          p_url_mapping_type => ''BASE_PATH'',
          p_url_mapping_pattern => ''admin'',
          p_auto_rest_auth => FALSE
        );
        COMMIT;
      END;';
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;
  END IF;
END;
/
EXIT;
EOSQL

if [ $? -eq 0 ]; then
    echo "✅ Usuario ADMIN configurado"
else
    echo "⚠️  Advertencia: Error al configurar usuario ADMIN"
fi

echo "=========================================="
echo "✅ Configuración completada"
echo ""
echo "📌 Acceso a SQL Developer Web:"
echo "   URL: http://localhost:8181/ords/sql-developer"
echo "   Usuario: admin"
echo "   Contraseña: Admin_123"
echo "=========================================="
