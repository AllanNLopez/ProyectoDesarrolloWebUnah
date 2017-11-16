
CREATE TABLE tbltipovehiculo (
                codTipoVehiculo INTEGER NOT NULL,
                tipoVehiculo VARCHAR(45),
                CONSTRAINT tbltipovehiculo_pk PRIMARY KEY (codTipoVehiculo)
);


CREATE TABLE tbltipousuarios (
                codTipoUsuario INTEGER NOT NULL,
                tipoUsuario VARCHAR(25),
                idAcceso VARCHAR(10),
                CONSTRAINT tbltipousuarios_pk PRIMARY KEY (codTipoUsuario)
);


CREATE TABLE tblusuarios (
                codUsuario INTEGER NOT NULL,
                nombres VARCHAR(25),
                apellidos VARCHAR(25),
                telefono VARCHAR(15),
                correo VARCHAR(25),
                contrasena VARCHAR(16),
                codTipoUsuario INTEGER NOT NULL,
                CONSTRAINT tblusuarios_pk PRIMARY KEY (codUsuario)
);


CREATE INDEX fk_tblusuarios_tbltipousuarios_idx
 ON tblusuarios USING BTREE
 ( codTipoUsuario ASC );

CREATE SEQUENCE tbltipoempresa_codtipoempresa_seq;

CREATE TABLE tbltipoempresa (
                codTipoEmpresa INTEGER NOT NULL DEFAULT nextval('tbltipoempresa_codtipoempresa_seq'),
                tipoEmpresa VARCHAR(45),
                CONSTRAINT tbltipoempresa_pk PRIMARY KEY (codTipoEmpresa)
);


ALTER SEQUENCE tbltipoempresa_codtipoempresa_seq OWNED BY tbltipoempresa.codTipoEmpresa;

CREATE SEQUENCE tbltipoempleado_codtipoempleado_seq;

CREATE TABLE tbltipoempleado (
                codTipoEmpleado INTEGER NOT NULL DEFAULT nextval('tbltipoempleado_codtipoempleado_seq'),
                tipoEmpleado VARCHAR(45),
                CONSTRAINT tbltipoempleado_pk PRIMARY KEY (codTipoEmpleado)
);


ALTER SEQUENCE tbltipoempleado_codtipoempleado_seq OWNED BY tbltipoempleado.codTipoEmpleado;

CREATE TABLE tblrubro (
                codRubro INTEGER NOT NULL,
                rubro VARCHAR(45),
                CONSTRAINT tblrubro_pk PRIMARY KEY (codRubro)
);


CREATE TABLE tblplanespago (
                codPlanPago INTEGER NOT NULL,
                nombrePlan VARCHAR(45),
                precio NUMERIC(2),
                CONSTRAINT tblplanespago_pk PRIMARY KEY (codPlanPago)
);


CREATE TABLE tblimagenesusuarios (
                codImagen INTEGER NOT NULL,
                direccion VARCHAR(60),
                codUsuario INTEGER NOT NULL,
                CONSTRAINT tblimagenesusuarios_pk PRIMARY KEY (codImagen)
);


CREATE INDEX fk_tblimagenesusuarios_tblusuarios1_idx
 ON tblimagenesusuarios USING BTREE
 ( codUsuario ASC );

CREATE TABLE tblimagenesperfilempresa (
                codImagen INTEGER NOT NULL,
                direccion VARCHAR(60),
                codEmpresa INTEGER NOT NULL,
                CONSTRAINT tblimagenesperfilempresa_pk PRIMARY KEY (codImagen)
);


CREATE INDEX fk_tblimagenesperfilempresa_tblempresas1_idx
 ON tblimagenesperfilempresa USING BTREE
 ( codEmpresa ASC );

CREATE TABLE tblhistorialplanes (
                codPlanPago INTEGER NOT NULL,
                codUsuario INTEGER NOT NULL,
                fechaAprobacin DATE,
                fechaVencimiento DATE,
                estadoPlan VARCHAR(45)
);


CREATE INDEX fk_tblhistorialplanes_tblplanespago1_idx
 ON tblhistorialplanes USING BTREE
 ( codPlanPago ASC );

CREATE INDEX fk_tblhistorialplanes_tblempresas1_idx
 ON tblhistorialplanes USING BTREE
 ( codUsuario ASC );

CREATE TABLE tblformapago (
                codFormaPago INTEGER NOT NULL,
                formaPago VARCHAR(45) NOT NULL,
                CONSTRAINT tblformapago_pk PRIMARY KEY (codFormaPago)
);


CREATE TABLE tblfacturascliente (
                codFactura INTEGER NOT NULL,
                fecha DATE,
                efectivo NUMERIC(12,2),
                cambio NUMERIC(12,2),
                codFormaPago INTEGER NOT NULL,
                codOrden INTEGER NOT NULL,
                CONSTRAINT tblfacturascliente_pk PRIMARY KEY (codFactura)
);


CREATE INDEX fk_tblfacturas_tblformapago1_idx
 ON tblfacturascliente USING BTREE
 ( codFormaPago ASC );

CREATE INDEX fk_tblfacturas_tblordenes1_idx
 ON tblfacturascliente USING BTREE
 ( codOrden ASC );

CREATE TABLE tblotrocargos (
                codCargo INTEGER NOT NULL,
                concepto VARCHAR(45),
                valor NUMERIC(2),
                codFactura INTEGER NOT NULL,
                CONSTRAINT tblotrocargos_pk PRIMARY KEY (codCargo)
);


CREATE INDEX fk_tblotrocargos_tblfacturas1_idx
 ON tblotrocargos USING BTREE
 ( codFactura ASC );

CREATE TABLE tblempresas (
                codEmpresa INTEGER NOT NULL,
                rtn VARCHAR(25),
                nombreEmpresa VARCHAR(45),
                ubicacion VARCHAR(200),
                mapsUbicacion VARCHAR(200),
                actividad VARCHAR(45),
                sitioweb VARCHAR(45),
                telefono VARCHAR(45),
                informacion VARCHAR(200),
                codRubro INTEGER NOT NULL,
                calificacion INTEGER,
                activa INTEGER,
                codUsuario INTEGER NOT NULL,
                CONSTRAINT tblempresas_pk PRIMARY KEY (codEmpresa)
);


CREATE INDEX fk_tblempresas_tblrubro1_idx
 ON tblempresas USING BTREE
 ( codRubro ASC );

CREATE INDEX fk_tblempresas_tblusuarios1_idx
 ON tblempresas USING BTREE
 ( codUsuario ASC );

CREATE TABLE tblempresafavoritas (
                codItem INTEGER NOT NULL,
                codUsuario INTEGER NOT NULL,
                codEmpresa INTEGER NOT NULL,
                CONSTRAINT tblempresafavoritas_pk PRIMARY KEY (codItem)
);


CREATE INDEX fk_tblempresafavoritas_tblusuarios1_idx
 ON tblempresafavoritas USING BTREE
 ( codUsuario ASC );

CREATE INDEX fk_tblempresafavoritas_tblempresas1_idx
 ON tblempresafavoritas USING BTREE
 ( codEmpresa ASC );

CREATE TABLE tblempleados (
                codUsuario INTEGER NOT NULL,
                identificacion VARCHAR(15) NOT NULL,
                nacimiento DATE,
                domicilio VARCHAR(150),
                telefonos VARCHAR(45),
                salario NUMERIC(2),
                codTipoEmpleado INTEGER NOT NULL,
                codTipoVehiculo INTEGER NOT NULL,
                CONSTRAINT tblempleados_pk PRIMARY KEY (codUsuario)
);


CREATE INDEX fk_tblempleados_tblusuarios1_idx
 ON tblempleados USING BTREE
 ( codUsuario ASC );

CREATE INDEX fk_tblempleados_tbltipoempleado1_idx
 ON tblempleados USING BTREE
 ( codTipoEmpleado ASC );

CREATE INDEX fk_tblempleados_tbltipovehiculo1_idx
 ON tblempleados USING BTREE
 ( codTipoVehiculo ASC );

CREATE TABLE tblordenes (
                codOrden INTEGER NOT NULL,
                fecha DATE,
                codUsuarioRepartidor INTEGER NOT NULL,
                codUsuarioCliente INTEGER NOT NULL,
                tiempoEstimado INTEGER,
                tiempoEntrega INTEGER,
                distanciaKms INTEGER,
                cantArticulos INTEGER,
                cantEstaciones INTEGER,
                costoDeCompra NUMERIC(12,2),
                costoDeEntrega NUMERIC(12,2),
                costoOrden NUMERIC(12,2),
                estadoOrden VARCHAR(10),
                observaciones VARCHAR(300),
                horaSalida TIMESTAMP,
                horaEntrega TIMESTAMP,
                CONSTRAINT tblordenes_pk PRIMARY KEY (codOrden)
);


CREATE INDEX fk_tblordenes_tblempleados1_idx
 ON tblordenes USING BTREE
 ( codUsuarioRepartidor ASC );

CREATE INDEX fk_tblordenes_tblusuarios1_idx
 ON tblordenes USING BTREE
 ( codUsuarioCliente ASC );

CREATE TABLE tbldetalles (
                codDetalle INTEGER NOT NULL,
                detalle VARCHAR(45),
                CONSTRAINT tbldetalles_pk PRIMARY KEY (codDetalle)
);


CREATE TABLE tbldepartamentos (
                codDepartamento INTEGER NOT NULL,
                codRubro INTEGER NOT NULL,
                CONSTRAINT tbldepartamentos_pk PRIMARY KEY (codDepartamento)
);


CREATE INDEX fk_tbldepartamentos_tblrubro1_idx
 ON tbldepartamentos USING BTREE
 ( codRubro ASC );

CREATE TABLE tblcategorias (
                codCategoria INTEGER NOT NULL,
                codDepartamento INTEGER NOT NULL,
                categoria VARCHAR(45),
                CONSTRAINT tblcategorias_pk PRIMARY KEY (codCategoria)
);


CREATE INDEX fk_tblcategor_as_tbldepartamentos1_idx
 ON tblcategorias USING BTREE
 ( codDepartamento ASC );

CREATE TABLE tblarticulos (
                codArticulo INTEGER NOT NULL,
                nombreArticulo VARCHAR(45) NOT NULL,
                descripcion VARCHAR(80),
                precio NUMERIC(12,2),
                origenFabricacion VARCHAR(45),
                saldo INTEGER,
                fechaPublicacion DATE,
                estado VARCHAR(15),
                codCategoria INTEGER NOT NULL,
                codUsuarioPublicador INTEGER NOT NULL,
                CONSTRAINT tblarticulos_pk PRIMARY KEY (codArticulo)
);


CREATE INDEX fk_tblarticulos_tblempresas1_idx
 ON tblarticulos USING BTREE
 ( codUsuarioPublicador ASC );

CREATE TABLE tbllistadeseos (
                colItem INTEGER NOT NULL,
                codArticulo INTEGER NOT NULL,
                codUsuario INTEGER NOT NULL,
                fechaRegistro DATE,
                CONSTRAINT tbllistadeseos_pk PRIMARY KEY (colItem)
);


CREATE INDEX fk_tbllistadeseos_tblarticulos1_idx
 ON tbllistadeseos USING BTREE
 ( codArticulo ASC );

CREATE INDEX fk_tbllistadeseos_tblusuarios1_idx
 ON tbllistadeseos USING BTREE
 ( codUsuario ASC );

CREATE TABLE tblinfoarticulo (
                codArticulo INTEGER NOT NULL,
                codCategoria INTEGER NOT NULL,
                codDepartamento INTEGER NOT NULL
);


CREATE INDEX fk_table1_tblarticulos1_idx
 ON tblinfoarticulo USING BTREE
 ( codArticulo ASC );

CREATE INDEX fk_table1_tblcategorias1_idx
 ON tblinfoarticulo USING BTREE
 ( codCategoria ASC );

CREATE TABLE tblimagenesarticulo (
                codImagen INTEGER NOT NULL,
                nombreImagen VARCHAR(45),
                urlUbicacion VARCHAR(60),
                codArticulo INTEGER NOT NULL,
                CONSTRAINT tblimagenesarticulo_pk PRIMARY KEY (codImagen)
);


CREATE INDEX fk_tblimagenes_tblarticulos1_idx
 ON tblimagenesarticulo USING BTREE
 ( codArticulo ASC );

CREATE TABLE tbldetallesarticulo (
                codArticulo INTEGER NOT NULL,
                codDetalle INTEGER NOT NULL,
                valor VARCHAR(45)
);


CREATE INDEX fk_tbldetallesarticulo_tblarticulos1_idx
 ON tbldetallesarticulo USING BTREE
 ( codArticulo ASC );

CREATE INDEX fk_tbldetallesarticulo_tbldetalles1_idx
 ON tbldetallesarticulo USING BTREE
 ( codDetalle ASC );

CREATE TABLE tblarticulosordenados (
                codOrden INTEGER NOT NULL,
                codArticulo INTEGER NOT NULL,
                cantidad INTEGER,
                precioUnitario NUMERIC(12,2),
                subtotal NUMERIC(12,2),
                mapsOrigen VARCHAR(250),
                ubicacionOrigen VARCHAR(200),
                mapsDestino VARCHAR(250),
                ubicacionDestino VARCHAR(250)
);


CREATE INDEX fk_tblarticulosordenados_tblordenes1_idx
 ON tblarticulosordenados USING BTREE
 ( codOrden ASC );

CREATE INDEX fk_tblarticulosordenados_tblarticulos1_idx
 ON tblarticulosordenados USING BTREE
 ( codArticulo ASC );

ALTER TABLE tblempleados ADD CONSTRAINT fk_tblempleados_tbltipovehiculo1
FOREIGN KEY (codTipoVehiculo)
REFERENCES tbltipovehiculo (codTipoVehiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblusuarios ADD CONSTRAINT fk_tblusuarios_tbltipousuarios
FOREIGN KEY (codTipoUsuario)
REFERENCES tbltipousuarios (codTipoUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblempleados ADD CONSTRAINT fk_tblempleados_tblusuarios1
FOREIGN KEY (codUsuario)
REFERENCES tblusuarios (codUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblempleados ADD CONSTRAINT fk_tblempleados_tbltipoempleado1
FOREIGN KEY (codTipoEmpleado)
REFERENCES tbltipoempleado (codTipoEmpleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tbldepartamentos ADD CONSTRAINT fk_tbldepartamentos_tblrubro1
FOREIGN KEY (codRubro)
REFERENCES tblrubro (codRubro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblempresas ADD CONSTRAINT fk_tblempresas_tblrubro1
FOREIGN KEY (codRubro)
REFERENCES tblrubro (codRubro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblhistorialplanes ADD CONSTRAINT fk_tblhistorialplanes_tblplanespago1
FOREIGN KEY (codPlanPago)
REFERENCES tblplanespago (codPlanPago)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblfacturascliente ADD CONSTRAINT fk_tblfacturas_tblformapago1
FOREIGN KEY (codFormaPago)
REFERENCES tblformapago (codFormaPago)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblotrocargos ADD CONSTRAINT fk_tblotrocargos_tblfacturas1
FOREIGN KEY (codFactura)
REFERENCES tblfacturascliente (codFactura)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblarticulos ADD CONSTRAINT fk_tblarticulos_tblempresas1
FOREIGN KEY (codUsuarioPublicador)
REFERENCES tblempresas (codEmpresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblordenes ADD CONSTRAINT fk_tblordenes_tblempleados1
FOREIGN KEY (codUsuarioRepartidor)
REFERENCES tblempleados (codUsuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblarticulosordenados ADD CONSTRAINT fk_tblarticulosordenados_tblordenes1
FOREIGN KEY (codOrden)
REFERENCES tblordenes (codOrden)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tbldetallesarticulo ADD CONSTRAINT fk_tbldetallesarticulo_tbldetalles1
FOREIGN KEY (codDetalle)
REFERENCES tbldetalles (codDetalle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblcategorias ADD CONSTRAINT fk_tblcategor_as_tbldepartamentos1
FOREIGN KEY (codDepartamento)
REFERENCES tbldepartamentos (codDepartamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblinfoarticulo ADD CONSTRAINT fk_table1_tblcategorias1
FOREIGN KEY (codCategoria)
REFERENCES tblcategorias (codCategoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblarticulosordenados ADD CONSTRAINT fk_tblarticulosordenados_tblarticulos1
FOREIGN KEY (codArticulo)
REFERENCES tblarticulos (codArticulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tbldetallesarticulo ADD CONSTRAINT fk_tbldetallesarticulo_tblarticulos1
FOREIGN KEY (codArticulo)
REFERENCES tblarticulos (codArticulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblimagenesarticulo ADD CONSTRAINT fk_tblimagenes_tblarticulos1
FOREIGN KEY (codArticulo)
REFERENCES tblarticulos (codArticulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tblinfoarticulo ADD CONSTRAINT fk_table1_tblarticulos1
FOREIGN KEY (codArticulo)
REFERENCES tblarticulos (codArticulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tbllistadeseos ADD CONSTRAINT fk_tbllistadeseos_tblarticulos1
FOREIGN KEY (codArticulo)
REFERENCES tblarticulos (codArticulo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
