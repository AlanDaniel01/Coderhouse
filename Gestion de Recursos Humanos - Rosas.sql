CREATE DATABASE GestionRecursosHumanos;
USE GestionRecursosHumanos;

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla Puesto
CREATE TABLE Puesto (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_contratacion DATE NOT NULL,
    id_departamento INT,
    id_puesto INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto)
);

-- Tabla Asistencia
CREATE TABLE Asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha DATE NOT NULL,
    hora_entrada TIME,
    hora_salida TIME,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Nómina
CREATE TABLE Nomina (
    id_nomina INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_pago DATE NOT NULL,
    salario_bruto DECIMAL(10,2) NOT NULL,
    deducciones DECIMAL(10,2) NOT NULL,
    salario_neto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Capacitación
CREATE TABLE Capacitacion (
    id_capacitacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    descripcion TEXT
);

-- Tabla intermedia Empleado_Capacitacion (relación N:M)
CREATE TABLE Empleado_Capacitacion (
    id_empleado INT,
    id_capacitacion INT,
    estado ENUM('completada', 'en curso') NOT NULL,
    PRIMARY KEY (id_empleado, id_capacitacion),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_capacitacion) REFERENCES Capacitacion(id_capacitacion)
);