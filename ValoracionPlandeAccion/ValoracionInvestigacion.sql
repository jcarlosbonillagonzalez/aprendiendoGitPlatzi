use Massy_HSE

-- Cambiar tipo de dato -------

--alter table PlanAccionCausasBasicas alter column obserCausasbasicas nvarchar(max)

-- ====TABLA CREADA PARA LAS CALIFICACIONES QUE SE LE VAN A DAR A LOS PLANES DE ACCIÓN=========--

--create table ValoracionPlanAccion (
--IdValoracion BIGINT PRIMARY KEY IDENTITY(1,1),
--NombreValoracion VARCHAR(15)
--)

--INSERT INTO ValoracionPlanAccion values('Replantear')

--==================== VISTA DE USUARIOS ACTIVOS EN LA INTRANET =================-----

select *
from EConexion.dbo.usuariosistemaview
where estado = 1 and ISNUMERIC(identificacion) = 1 
AND identificacion = '1023010372'

--=======CAUSA INMEDIATA

--select *
--from CausaInmediata_Inves

--=======PLAN ACCION CAUSAS BASICAS

--select *
--from PlanAccionCausasBasicas

--=======CAUSAS BASICAS

----select *
----from CausasBasicasInves



--=======PLAN ACCION CAUSAS INMEDIATAS

--select *
--from PlanAccionCausasInmediatas



--SELECT 
--	A.IdreporteInvestigacion AS '# ReporteInvestigacion',
--	A.Id_Plan,
--	F.Area AS 'Linea Negocio',
--	I.Proyecto,
--	I.IdProyecto,
--    B.CausaInmediata AS 'Causa Inmediata',
--    A.PlanAccion AS 'Plan De Accion',
--    A.Fecha_Planificada AS 'Fecha Planificada',
--    A.Fecha_Ejecutada AS 'Fecha Ejecutada',
--    A.Evidencia,
--    D.Descripcion AS 'Cargo Responsable',
--	A.estadoCausasInmediata AS 'Estado',
--	A.obserCausasInmediata AS 'Observación',
--	H.nombre AS 'PADRINO'
--FROM 
--    dbo.PlanAccionCausasInmediatas A
--	LEFT JOIN CausasInmediatas B ON A.CausaInmediata = B.IdCausaInmediata
--	LEFT JOIN Reem_Cargos_SAP D ON A.CargoResponsable = D.IdCargo
--	LEFT JOIN Datos_Reporte24 E ON A.IdreporteInvestigacion = E.IdReporte
--	LEFT JOIN Rel_Area F ON E.Area = F.IdArea
--	LEFT JOIN PadrinoLineanegocio G ON E.IdProyecto = G.IdProyecto 
--	LEFT JOIN EConexion.dbo.usuariosistemaview H ON G.idPersona = H.idPersona
--	LEFT JOIN Rel_ProyectoReporte24 I ON G.IdProyecto = I.IdProyecto
--	WHERE A.IdreporteInvestigacion = '321' 
	--H.identificacion = '52995308'

	--[usr_login]

--SELECT 
--	A.IdreporteInvestigacion AS 'Reporte Investigacion',
--	A.Id_Plan,
--	F.Area AS 'Linea Negocio',
--	E.IdProyecto,
--	I.Proyecto,
--    B.FamiliaBasica AS 'Factor',
--    C.CausaBasica,
--    A.PlanAccion AS 'Plan De Accion',
--    A.Fecha_Planificada AS 'Fecha Planificada',
--    A.Fecha_Ejecutada AS 'Fecha Ejecutada',
--    A.Evidencia,
--    D.Descripcion AS 'Cargo Responsable',
--    A.estadoCausasbasicas AS 'Estado',
--    A.obserCausasbasicas AS 'Observacion',
--	H.nombre AS 'Padrino'
--FROM 
--    dbo.PlanAccionCausasBasicas A
--	LEFT JOIN Rel_FactorFamiliaBasica B ON A.Factor = B.IdFamiliaBasica
--	LEFT JOIN Rel_FamiliaCausaBasica C ON A.CausaBasica = C.IdCausaBasica
--	LEFT JOIN Reem_Cargos_SAP D ON A.CargoResponsable = D.IdCargo
--	LEFT JOIN Datos_Reporte24 E ON A.IdreporteInvestigacion = E.IdReporte
--	LEFT JOIN Rel_Area F ON E.Area = F.IdArea
--	LEFT JOIN PadrinoLineanegocio G ON E.IdProyecto = G.IdProyecto
--	LEFT JOIN EConexion.dbo.usuariosistemaview H ON G.idPersona = H.idPersona
--	LEFT JOIN Rel_ProyectoReporte24 I ON E.IdProyecto = I.IdProyecto
--	WHERE H.identificacion = '52995308' AND A.IdreporteInvestigacion = '330'
	


--====SACAR EL CORREO DEL LIDER DE INVESTIGACIÓN Y EL EQUIPO

--select * from InfoGeneralInvestigacion 

--select * from EConexion.dbo.usuariosistemaview



--=======TABLA CREADA PARA PODER RELACIONAR USUARIOS Y LINEAS DE NEGOCIO=======-----

--create table PadrinoLineanegocio (
--IdPadrinoLinea BIGINT PRIMARY KEY IDENTITY(1,1),
--idPersona BIGINT,
--IdArea BIGINT
--)

--SELECT * FROM PadrinoLineanegocio



--	select * from Datos_Reporte24
--	select * from Rel_Area
--SELECT * FROM PlanAccionCausasBasicas

--===creación de vista para plan acción

--create view ValoracionCausasInmediatas 
--as

--SELECT 
--	A.IdreporteInvestigacion AS '# ReporteInvestigacion',
--	A.Id_Plan,
--	F.Area AS 'Linea Negocio',
--	I.Proyecto,
--	I.IdProyecto,
--    B.CausaInmediata AS 'Causa Inmediata',
--    A.PlanAccion AS 'Plan De Accion',
--    A.Fecha_Planificada AS 'Fecha Planificada',
--    A.Fecha_Ejecutada AS 'Fecha Ejecutada',
--    A.Evidencia,
--    D.Descripcion AS 'Cargo Responsable',
--	A.estadoCausasInmediata AS 'Estado',
--	A.obserCausasInmediata AS 'Observacion',
--	H.nombre AS 'Padrino'
--FROM 
--    dbo.PlanAccionCausasInmediatas A
--	LEFT JOIN CausasInmediatas B ON A.CausaInmediata = B.IdCausaInmediata
--	LEFT JOIN Reem_Cargos_SAP D ON A.CargoResponsable = D.IdCargo
--	LEFT JOIN Datos_Reporte24 E ON A.IdreporteInvestigacion = E.IdReporte
--	LEFT JOIN Rel_Area F ON E.Area = F.IdArea
--	LEFT JOIN PadrinoLineanegocio G ON E.IdProyecto = G.IdProyecto 
--	LEFT JOIN EConexion.dbo.usuariosistemaview H ON G.idPersona = H.idPersona
--	LEFT JOIN Rel_ProyectoReporte24 I ON G.IdProyecto = I.IdProyecto


--SELECT NombreValoracion 
--FROM dbo.ValoracionPlanAccion 
--WHERE IdValoracion <> 2
--ORDER BY NombreValoracion


--SELECT
--    ReporteInvestigacion,
--    Id_Plan,
--    "Linea Negocio",
--    Proyecto,
--    IdProyecto,
--    "Causa Inmediata",
--    "Plan De Accion",
--    "Fecha Planificada",
--    "Fecha Ejecutada",
--    Evidencia,
--    "Cargo Responsable",
--    Estado,
--    Observacion,
--    Padrino
--FROM
--    dbo.ValoracionCausasInmediatas
--WHERE Estado <> 2 

--== CONSULTA PARA ENVIAR MENSAJE LUEGO QUE SE REGISTREN LOS PLANES DE ACCIÓN DE CAUSAS BASICAS======--

--select A.Reporte_Investigacion, D.IdentificacionLider, C.email   
--from ValoracionCausasBasicas A 
--LEFT JOIN ValoracionPlanAccion B ON A.Estado = B.IdValoracion
--LEFT JOIN EConexion.dbo.UsuarioSistemaView C on A.identificacion = C.identificacion
--LEFT JOIN InfoGeneralInvestigacion D on A.Reporte_Investigacion = D.IdReporteInves
--where Reporte_Investigacion = 348 AND C.identificacion = D.IdentificacionLider

--select * from InfoGeneralInvestigacion
--select * from EConexion.dbo.UsuarioSistemaView


--===Consulta para obtener correos del lider de una investigación====-----
select A.IdReporteInves, A.IdentificacionLider, B.email
from InfoGeneralInvestigacion A
INNER JOIN EConexion.dbo.UsuarioSistemaView B on CAST(A.IdentificacionLider AS VARCHAR) = B.identificacion COLLATE DATABASE_DEFAULT AND ISNUMERIC(identificacion) = 1
WHERE A.IdReporteInves = 347

--SELECT * FROM InfoGeneralInvestigacion
--select * from EConexion.dbo.UsuarioSistemaView

--===Personas a quienes se envia correo de reporte 24 horas
select * from ParametrosCorreoReporte24Horas
--==Roles para envio de correo electronico
select * from RolesEnvioCorreo

select * from PlanAccionCausasInmediatas


select * from InfoGeneralInvestigacion