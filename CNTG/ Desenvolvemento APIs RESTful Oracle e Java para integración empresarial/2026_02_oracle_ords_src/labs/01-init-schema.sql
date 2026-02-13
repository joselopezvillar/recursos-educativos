/*******************************************************************************
 * Script: 01-init-schema.sql
 * Descripción: Inicialización del esquema de base de datos para el sistema HR
 * Laboratorio: Oracle ORDS - Sistema de Recursos Humanos
 * 
 * Este script crea:
 *   - Tablas: DEPARTMENTS, JOBS, EMPLOYEES
 *   - Datos de ejemplo (5 departamentos, 7 puestos, 12 empleados)
 *   - Vistas: EMPLOYEES_COMPLETE, DEPT_STATISTICS
 *   
 * Prerequisitos:
 *   - Conexión a la base de datos como usuario ADMIN
 *   - Usuario con permisos CREATE TABLE, CREATE VIEW
 *   
 * Ejecución:
 *   @01-init-schema.sql
 *   
 * Autor: Laboratorio ORDS
 * Fecha: Febrero 2026
 ******************************************************************************/

SET ECHO ON
SET FEEDBACK ON
SET VERIFY OFF
SET SERVEROUTPUT ON

PROMPT ===============================================================================
PROMPT Iniciando creación del esquema HR
PROMPT ===============================================================================

-- =============================================================================
-- SECCIÓN 1: LIMPIEZA (Opcional - descomentar si necesitas recrear)
-- =============================================================================

PROMPT 
PROMPT >>> Eliminando objetos existentes (si existen)...

DROP VIEW dept_statistics;
DROP VIEW employees_complete;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE jobs CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

PROMPT Objetos eliminados correctamente


-- =============================================================================
-- SECCIÓN 2: CREACIÓN DE TABLAS
-- =============================================================================

PROMPT 
PROMPT >>> Creando tabla DEPARTMENTS...

CREATE TABLE departments (
    dept_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dept_name   VARCHAR2(50) NOT NULL UNIQUE,
    location    VARCHAR2(100),
    created_at  DATE DEFAULT SYSDATE
);

COMMENT ON TABLE departments IS 'Catálogo de departamentos de la empresa';
COMMENT ON COLUMN departments.dept_id IS 'ID único del departamento (autogenerado)';
COMMENT ON COLUMN departments.dept_name IS 'Nombre del departamento';
COMMENT ON COLUMN departments.location IS 'Ubicación física del departamento';

PROMPT ✓ Tabla DEPARTMENTS creada

PROMPT 
PROMPT >>> Creando tabla JOBS...

CREATE TABLE jobs (
    job_id      VARCHAR2(10) PRIMARY KEY,
    job_title   VARCHAR2(50) NOT NULL,
    min_salary  NUMBER(8,2),
    max_salary  NUMBER(8,2),
    created_at  DATE DEFAULT SYSDATE,
    CONSTRAINT check_salary CHECK (max_salary > min_salary)
);

COMMENT ON TABLE jobs IS 'Catálogo de puestos de trabajo y rangos salariales';
COMMENT ON COLUMN jobs.job_id IS 'Código único del puesto';
COMMENT ON COLUMN jobs.job_title IS 'Título del puesto';
COMMENT ON COLUMN jobs.min_salary IS 'Salario mínimo del puesto';
COMMENT ON COLUMN jobs.max_salary IS 'Salario máximo del puesto';

PROMPT ✓ Tabla JOBS creada

PROMPT 
PROMPT >>> Creando tabla EMPLOYEES...

CREATE TABLE employees (
    emp_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50) NOT NULL,
    email       VARCHAR2(100) UNIQUE NOT NULL,
    phone       VARCHAR2(20),
    hire_date   DATE DEFAULT SYSDATE,
    job_id      VARCHAR2(10),
    salary      NUMBER(8,2),
    commission  NUMBER(3,2),
    manager_id  NUMBER,
    dept_id     NUMBER,
    created_at  DATE DEFAULT SYSDATE,
    updated_at  DATE DEFAULT SYSDATE,
    -- Foreign keys
    CONSTRAINT fk_emp_job FOREIGN KEY (job_id) 
        REFERENCES jobs(job_id),
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id),
    CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) 
        REFERENCES employees(emp_id),
    -- Check constraints
    CONSTRAINT check_salary_positive CHECK (salary > 0),
    CONSTRAINT check_commission_range CHECK (commission BETWEEN 0 AND 1)
);

COMMENT ON TABLE employees IS 'Información de empleados de la empresa';
COMMENT ON COLUMN employees.emp_id IS 'ID único del empleado (autogenerado)';
COMMENT ON COLUMN employees.first_name IS 'Nombre del empleado';
COMMENT ON COLUMN employees.last_name IS 'Apellido del empleado';
COMMENT ON COLUMN employees.email IS 'Email corporativo (único)';
COMMENT ON COLUMN employees.salary IS 'Salario mensual';
COMMENT ON COLUMN employees.commission IS 'Porcentaje de comisión (0-1)';
COMMENT ON COLUMN employees.manager_id IS 'ID del supervisor directo';

PROMPT ✓ Tabla EMPLOYEES creada

-- =============================================================================
-- SECCIÓN 3: CREACIÓN DE ÍNDICES
-- =============================================================================

PROMPT 
PROMPT >>> Creando índices para optimización de consultas...

CREATE INDEX idx_emp_dept ON employees(dept_id);
CREATE INDEX idx_emp_job ON employees(job_id);
CREATE INDEX idx_emp_manager ON employees(manager_id);
CREATE INDEX idx_emp_email ON employees(UPPER(email));
CREATE INDEX idx_emp_name ON employees(UPPER(last_name), UPPER(first_name));

PROMPT ✓ Índices creados

-- =============================================================================
-- SECCIÓN 4: INSERCIÓN DE DATOS - DEPARTAMENTOS
-- =============================================================================

PROMPT 
PROMPT >>> Insertando datos de departamentos...

INSERT INTO departments (dept_name, location) VALUES ('IT', 'Madrid');
INSERT INTO departments (dept_name, location) VALUES ('Sales', 'Barcelona');
INSERT INTO departments (dept_name, location) VALUES ('HR', 'Valencia');
INSERT INTO departments (dept_name, location) VALUES ('Finance', 'Sevilla');
INSERT INTO departments (dept_name, location) VALUES ('Operations', 'Bilbao');

COMMIT;

PROMPT ✓ 5 departamentos insertados

-- =============================================================================
-- SECCIÓN 5: INSERCIÓN DE DATOS - PUESTOS DE TRABAJO
-- =============================================================================

PROMPT 
PROMPT >>> Insertando puestos de trabajo...

INSERT INTO jobs VALUES ('IT_PROG', 'Programador', 30000, 80000, SYSDATE);
INSERT INTO jobs VALUES ('IT_LEAD', 'Team Leader IT', 50000, 100000, SYSDATE);
INSERT INTO jobs VALUES ('SA_REP', 'Representante Ventas', 25000, 60000, SYSDATE);
INSERT INTO jobs VALUES ('SA_MAN', 'Gerente Ventas', 40000, 90000, SYSDATE);
INSERT INTO jobs VALUES ('HR_REP', 'Especialista RRHH', 28000, 65000, SYSDATE);
INSERT INTO jobs VALUES ('FI_ACC', 'Contador', 32000, 70000, SYSDATE);
INSERT INTO jobs VALUES ('FI_MGR', 'Gerente Finanzas', 50000, 110000, SYSDATE);

COMMIT;

PROMPT ✓ 7 puestos de trabajo insertados

-- =============================================================================
-- SECCIÓN 6: INSERCIÓN DE DATOS - EMPLEADOS
-- =============================================================================

PROMPT 
PROMPT >>> Insertando empleados (managers primero)...

-- Gerentes (sin manager_id)
INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Carlos', 'Martínez', 'carlos.martinez@empresa.com', '+34-600-111-001', 'IT_LEAD', 75000, 1, NULL);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Ana', 'García', 'ana.garcia@empresa.com', '+34-600-111-002', 'SA_MAN', 70000, 2, NULL);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Luis', 'Rodríguez', 'luis.rodriguez@empresa.com', '+34-600-111-003', 'FI_MGR', 85000, 4, NULL);

PROMPT ✓ 3 gerentes insertados

PROMPT >>> Insertando empleados del departamento IT...

-- Empleados de IT (reportan a Carlos - emp_id 1)
INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('María', 'López', 'maria.lopez@empresa.com', '+34-600-222-001', 'IT_PROG', 45000, 1, 1);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Pedro', 'Sánchez', 'pedro.sanchez@empresa.com', '+34-600-222-002', 'IT_PROG', 48000, 1, 1);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Laura', 'Fernández', 'laura.fernandez@empresa.com', '+34-600-222-003', 'IT_PROG', 42000, 1, 1);

PROMPT ✓ 3 empleados IT insertados

PROMPT >>> Insertando empleados del departamento Sales...

-- Empleados de Ventas (reportan a Ana - emp_id 2)
INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, commission, dept_id, manager_id)
VALUES ('Miguel', 'Gómez', 'miguel.gomez@empresa.com', '+34-600-333-001', 'SA_REP', 35000, 0.15, 2, 2);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, commission, dept_id, manager_id)
VALUES ('Carmen', 'Ruiz', 'carmen.ruiz@empresa.com', '+34-600-333-002', 'SA_REP', 38000, 0.18, 2, 2);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, commission, dept_id, manager_id)
VALUES ('Javier', 'Moreno', 'javier.moreno@empresa.com', '+34-600-333-003', 'SA_REP', 33000, 0.12, 2, 2);

PROMPT ✓ 3 empleados Sales insertados

PROMPT >>> Insertando empleado de HR...

-- Empleado de RRHH (sin manager por ahora)
INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Isabel', 'Jiménez', 'isabel.jimenez@empresa.com', '+34-600-444-001', 'HR_REP', 40000, 3, NULL);

PROMPT ✓ 1 empleado HR insertado

PROMPT >>> Insertando empleados de Finance...

-- Empleados de Finanzas (reportan a Luis - emp_id 3)
INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Antonio', 'Torres', 'antonio.torres@empresa.com', '+34-600-555-001', 'FI_ACC', 45000, 4, 3);

INSERT INTO employees (first_name, last_name, email, phone, job_id, salary, dept_id, manager_id)
VALUES ('Sofía', 'Ramírez', 'sofia.ramirez@empresa.com', '+34-600-555-002', 'FI_ACC', 43000, 4, 3);

COMMIT;

PROMPT ✓ 2 empleados Finance insertados
PROMPT ✓ Total: 12 empleados insertados

-- =============================================================================
-- SECCIÓN 7: CREACIÓN DE VISTAS
-- =============================================================================

PROMPT 
PROMPT >>> Creando vista EMPLOYEES_COMPLETE...

CREATE OR REPLACE VIEW employees_complete AS
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    e.first_name || ' ' || e.last_name AS full_name,
    e.email,
    e.phone,
    e.hire_date,
    TRUNC(MONTHS_BETWEEN(SYSDATE, e.hire_date) / 12) AS years_in_company,
    j.job_id,
    j.job_title,
    e.salary,
    e.commission,
    d.dept_id,
    d.dept_name,
    d.location AS dept_location,
    m.first_name || ' ' || m.last_name AS manager_name,
    e.manager_id,
    e.created_at,
    e.updated_at
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id
LEFT JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employees m ON e.manager_id = m.emp_id;

COMMENT ON VIEW employees_complete IS 'Vista completa de empleados con información de departamento, puesto y manager';

PROMPT ✓ Vista EMPLOYEES_COMPLETE creada

PROMPT 
PROMPT >>> Creando vista DEPT_STATISTICS...

CREATE OR REPLACE VIEW dept_statistics AS
SELECT 
    d.dept_id,
    d.dept_name,
    d.location,
    COUNT(e.emp_id) AS num_employees,
    ROUND(AVG(e.salary), 2) AS avg_salary,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    SUM(e.salary) AS total_salary_cost,
    ROUND(SUM(e.salary) * 12, 2) AS annual_salary_cost
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name, d.location;

COMMENT ON VIEW dept_statistics IS 'Estadísticas de empleados y costos salariales por departamento';

PROMPT ✓ Vista DEPT_STATISTICS creada

-- =============================================================================
-- SECCIÓN 8: VERIFICACIÓN Y RESUMEN
-- =============================================================================

PROMPT 
PROMPT ===============================================================================
PROMPT VERIFICACIÓN DE LA INSTALACIÓN
PROMPT ===============================================================================

PROMPT 
PROMPT >>> Conteo de registros por tabla:

SELECT 'DEPARTMENTS' AS tabla, COUNT(*) AS registros FROM departments
UNION ALL
SELECT 'JOBS', COUNT(*) FROM jobs
UNION ALL
SELECT 'EMPLOYEES', COUNT(*) FROM employees;

PROMPT 
PROMPT >>> Distribución de empleados por departamento:

SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS num_empleados
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY num_empleados DESC, d.dept_name;

PROMPT 
PROMPT >>> Jerarquía organizacional (Managers):

SELECT 
    e.emp_id,
    e.first_name || ' ' || e.last_name AS manager,
    j.job_title,
    d.dept_name,
    COUNT(emp.emp_id) AS num_reportes
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employees emp ON emp.manager_id = e.emp_id
WHERE e.manager_id IS NULL
GROUP BY e.emp_id, e.first_name, e.last_name, j.job_title, d.dept_name
ORDER BY e.emp_id;

PROMPT 
PROMPT >>> Rango salarial de la empresa:

SELECT 
    MIN(salary) AS salario_minimo,
    ROUND(AVG(salary), 2) AS salario_promedio,
    MAX(salary) AS salario_maximo,
    SUM(salary) AS costo_mensual_total,
    SUM(salary) * 12 AS costo_anual_total
FROM employees;

PROMPT 
PROMPT >>> Objetos creados:

SELECT 
    object_type,
    object_name,
    status
FROM user_objects
WHERE object_name IN ('DEPARTMENTS', 'JOBS', 'EMPLOYEES', 'EMPLOYEES_COMPLETE', 'DEPT_STATISTICS')
    OR object_name LIKE 'IDX_EMP_%'
ORDER BY 
    CASE object_type 
        WHEN 'TABLE' THEN 1 
        WHEN 'INDEX' THEN 2 
        WHEN 'VIEW' THEN 3 
    END,
    object_name;

PROMPT 
PROMPT ===============================================================================
PROMPT ✓ INSTALACIÓN COMPLETADA EXITOSAMENTE
PROMPT ===============================================================================
PROMPT 
PROMPT Siguiente paso: Ejecutar el laboratorio LAB 2 - Auto-REST
PROMPT 
PROMPT ===============================================================================

SET FEEDBACK OFF
SET VERIFY ON
