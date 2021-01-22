//echo "<br><br> ¡Registro realizado exitosamente!";

//Funcionalidad para envio de correo a HSE Corporativo despues de generar el reporte 24 Horas.

//Variables locales para recibir campos del formulario y enviarlos por correo

$ID = {Id_Plan};

$link1 = sc_make_link(form_dbo_PlanAccionCausasBasicas,parm1 = {Id_Plan});

$linkFinal = "http://". $_SERVER['HTTP_HOST'] . $link1;

//Variable para enviar link con reporte se suspende debido a pruebas realizadas no satisfactorias en apertura de link

$LinkFinal = '<a href="'.$linkFinal.'">Dar click aqui para visualizar reporte 24 horas en la plataforma</a>';

$LinkFinal = 'Por favor ingresar a la plataforma de HSE "Reporte 24 Horas", dirigirse al menu de Listado de Reportes y realizar la consulta por el ID indicado';

$Proyecto = {IdProyecto};

sc_select(Contrato,"SELECT UPPER(Proyecto) 
FROM dbo.Rel_ProyectoReporte24 where IdProyecto = " . $Proyecto);

$Proyecto = {Contrato}->fields[0]; //Se extrae de tabla auxiliar el nombre del proyecto

$Cedula = [usr_login];

sc_select(Iden,"select UPPER(Nombre) Nombre from EConexion.dbo.UsuarioSistemaView
where estado = 1 and Identificacion = '" . $Cedula . "'");

$PerReporta = {Iden}->fields[0]; //Se extrae de vista auxiliar de Econexion para los usuarios de intranet

$PerRevisa = {PersonaRevisa};


sc_select(Eventos,"select UPPER(TipoEvento) from Rel_TipoEvento where IdTipoEvento = " . $TipoEvento);

$TipoEvento = {Eventos}->fields[0]; //Se extrae nombre del tipo de evento de tabla auxiliar

$TituloEvento = {IdentificaEvento};

$Descripcion = {Descripcion};

//A partit de esta seccion se validan los correos de HSE Corporativo y Gerencia General a donde se enviaran los correos


sc_lookup(Correos,"select Correo from ParametrosCorreoReporte24Horas where Rol IN (1,2,3,5)");

sc_select(Conteo1,"select Count(*) Conteo from ParametrosCorreoReporte24Horas where Rol IN (1,2,3,5)");

$Contador = {Conteo1}->fields[0];

$Arreglo = array();

for($i=0;$i<$Contador;$i++){
	
		$Arreglo[$i] = {Correos [$i][0]};
	
	}
	


$Correos = implode(';', $Arreglo);

settype($Correos,"string");

//echo "Pruebas con array: " .$Correos . "<br>";

$Linea = {Area};

sc_select(CorreosLineaNegocio,"select Correo from ParametrosCorreoReporte24Horas where Rol = 4 and LineaNegocio = " . $Linea);

	$LineaNeg = {CorreosLineaNegocio}->fields[0];

if($LineaNeg != ""){
	
	//echo "Pruebas de Correo gerente de linea: " . $LineaNeg;
	
}

//A partir de aqui se instancian parametros para permitir conexion con servidor de correo

sc_select(Asunto,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'AsuntoCorreo65'");

	$subject = {Asunto}->fields[0];

	sc_select(Contenido,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'ContenidoCorreo65'");
	
	$Contenidos = {Contenido}->fields[0];

	
	
	$Parametros = array();
	$Parametros[0] = '/:p1/';
	$Parametros[1] = '/:p2/';
	$Parametros[2] = '/:p3/';
	$Parametros[3] = '/:p4/';
	$Parametros[4] = '/:p5/';
	$Parametros[5] = '/:p6/';
	$Parametros[6] = '/:p7/';
	$Parametros[7] = '/:p8/';
	$Parametros[8] = '/:p9/';

	$Reemplazar = array();
	$Reemplazar[0] = $ID;
	$Reemplazar[1] = $Proyecto;
	$Reemplazar[2] = $PerReporta;
	$Reemplazar[3] = $PerRevisa;
	$Reemplazar[4] = $TipoEvento;
	$Reemplazar[5] = $FechaEvento;
	$Reemplazar[6] = $TituloEvento;
	$Reemplazar[7] = $Descripcion;
	$Reemplazar[8] = $LinkFinal;
	

	$Mensaje = preg_replace($Parametros, $Reemplazar, $Contenidos);

	//echo $Mensaje;


	sc_select(Servidor,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'SMTPCorreo'");

	$Servidor = {Servidor}->fields[0];
	
	sc_select(UserCorreo,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'UsrCorreo'");

	$UsuarioCorreo = {UserCorreo}->fields[0];

	sc_select(Passwd,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'PwCorreo'");

	$Contrasenia = {Passwd}->fields[0];

	sc_select(Remitente,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'FromCorreo'");

	$RemitenteCorreo = {Remitente}->fields[0];

	sc_select(Puerto,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'PortCorreo'");

	$PuertoCorreo = {Puerto}->fields[0];

	sc_select(Conne,"select Valor from SapBydesign.dbo.Tb_ScriptCase_Parametros where Nombre = 'ConnCorreo'");

	$Con = {Conne}->fields[0];
	
	

	//ELEMENTOS RESERVADOS PARA PRUEBAS
	
	$CorreoPrueba = array();

	$CorreoPrueba[0] = 'deiby.garzon@massygroup.com';

	$CorreoPrueba[1] = 'christian.guantiva@massygroup.com';

	$CorreoPrueba[2] = 'profesional.ithse@massygroup.com';

	$PruebaArreglo = implode(';',$CorreoPrueba);

	settype($PruebaArreglo,"string");
	

	


//Se pasan parametros para envio de correo automatico

// Email parameters
$mail_smtp_server    = $Servidor;                // SMTP server name or IP address
$mail_smtp_user      = $UsuarioCorreo;           // SMTP user name
$mail_smtp_pass      = $Contrasenia;             // SMTP password
$mail_from           = $RemitenteCorreo;         // From email
$mail_to             = $PruebaArreglo;//$Correos;                 // To email
$mail_subject        = $subject;                 // Message subject
$mail_message        = $Mensaje;                 // Message body
$mail_format         = 'H';                      // Message format: (T)ext or (H)tml
$mail_copies         = '';//$LineaNeg . $SeguridadFisica;    // List of the emails that will recieve the message
$mail_tp_copies      = 'CCC';                    // Type copies: BCC (Hiden copies) or CCC (Regular copies)
$mail_port           = $PuertoCorreo;            // Server port
$mail_tp_connection  = $Con;                     // Connection security (S) or (N)

// Send email";
sc_mail_send($mail_smtp_server,
			 $mail_smtp_user,
             $mail_smtp_pass,
			 $mail_from,
			 $mail_to,
			 $mail_subject,
			 $mail_message,
			 $mail_format,
			 $mail_copies,
			 $mail_tp_copies,
			 $mail_port,
			 $mail_tp_connection);


sc_commit_trans ();

sc_redir(form_dbo_Datos_Reporte24_1,'_self');