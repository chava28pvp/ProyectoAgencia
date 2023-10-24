-- Creación de la base de datos 'Project'
CREATE DATABASE IF NOT EXISTS Project;
USE Project;

-- Creación de la tabla 'Usuario'
CREATE TABLE IF NOT EXISTS Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Contrasena VARCHAR(45) NOT NULL,
    Rol VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- Creación de la tabla 'Vehiculos'
CREATE TABLE IF NOT EXISTS Vehiculos (
    NumVIN INT PRIMARY KEY NOT NULL,
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Anio VARCHAR(45),
    Kilometraje VARCHAR(45),
    Usuario_idUsuario INT NOT NULL,
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Creación de la tabla 'Proximo_Servicio'
CREATE TABLE IF NOT EXISTS Proximo_Servicio (
    NumServVIN INT PRIMARY KEY,
    FechaAsign VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

-- Creación de la tabla 'Mantenimiento'
CREATE TABLE IF NOT EXISTS Mantenimiento (
    idMantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Servicio VARCHAR(45) NOT NULL,
    Descripcion VARCHAR(45),
    Tecnico VARCHAR(45),
    Estado VARCHAR(45),
    NumVIN INT,
    NumServVIN INT,
    FOREIGN KEY (NumVIN) REFERENCES Vehiculos(NumVIN) ON DELETE CASCADE ON UPDATE CASCADE
  
) ENGINE=InnoDB;

-- Creación de la tabla 'Inventario'
CREATE TABLE IF NOT EXISTS Inventario (
    idInventario INT PRIMARY KEY AUTO_INCREMENT,
    NombreP VARCHAR(45) NOT NULL,
    Cantidad VARCHAR(45),
    Ubicacion VARCHAR(45),
    Costo VARCHAR(45)
    
) ENGINE=InnoDB;

USE Project;

-- Eliminar la tabla Mantenimiento
DROP TABLE Mantenimiento;

-- Eliminar la tabla Inventario
DROP TABLE Inventario;
USE Project;

-- Añadir columna de llave foránea a la tabla Inventario que haga referencia a Mantenimiento
ALTER TABLE Inventario 
ADD idMantenimiento_ref INT;

-- Establecer la restricción de llave foránea
ALTER TABLE Inventario
ADD CONSTRAINT FK_Inventario_Mantenimiento 
FOREIGN KEY (idMantenimiento_ref) REFERENCES Mantenimiento(idMantenimiento);