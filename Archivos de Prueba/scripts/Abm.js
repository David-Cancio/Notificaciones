function ConfirmEvent( Message, Accion ) {
	if (window.confirm( Message ) ) { FireEvent( Accion ); }
}

function SetOrden( Orden ) {
	document.Formulario.Orden.value = Orden;
}

function FireEvent( Accion, Page ) {
	if (Page != null) { document.getElementById('Formulario').action = Page; }
	if (Accion != null) { document.getElementById('Accion').value = Accion; }
	document.getElementById('Formulario').submit();
}

function restorePageState() {
var restoreControlFocus;
var restoreTabFocus;
var controlFocus;
var tabFocus;
var restoreScrollTop;
var jsEval;
var tabSetName;
var modo;

	// ControlFocus
	restoreControlFocus = document.getElementById('restoreControlFocus');
	if (restoreControlFocus != null) {
		tmp = 'document.getElementById("' + restoreControlFocus.value + '");'
		controlFocus = eval(tmp);
		restoreControlFocus.value = '';

		if (controlFocus != null) { controlFocus.focus(); }
	}
	
	// TabFocus
	modo = document.getElementById('Modo');
	tabSetName = document.getElementById('tabSetName');
	restoreTabFocus = document.getElementById('restoreTabFocus');
	
	if ( (modo!=null) && (modo.value=="Consulta") ) {//si estoy en consulta que no se acuerde mas
		restoreTabFocus.value=''	
	}
	
	if ( (restoreTabFocus != null)  && (tabSetName !=null )){
		
		jsEval = 'document.getElementById("' + tabSetName.value+"_"+restoreTabFocus.value + '");'
		tabFocus = eval(jsEval);
		
		if (tabFocus != null) {
			tabOnClick(tabSetName.value+"_"+restoreTabFocus.value);			
			tabFocus.focus();
		}
	}

	// ScrollTop	
	restoreScrollTop = document.getElementById('restoreScrollTop');

	if (restoreScrollTop != null) {
		if (restoreScrollTop.value != '') {
			document.body.scrollTop = restoreScrollTop.value;
		}
		restoreScrollTop.value = "";
	}
}

function savePageState(controlFocus, tabFocus) {
var restoreControlFocus;
var restoreTabFocus;
var restoreScrollTop;
var pos;
			
	restoreTabFocus		= document.getElementById('restoreTabFocus');
	restoreControlFocus = document.getElementById('restoreControlFocus');
	restoreScrollTop	= document.getElementById('restoreScrollTop');
			
		if ((restoreTabFocus != null) && (tabFocus != null)){
			var focusId;
			focusId = tabFocus.id;
			pos = focusId.indexOf( '_', 4); // tab_12345_ busco la posición del segundo _
			restoreTabFocus.value = focusId.substr( pos + 1); // traigo el resto del nombre del tab			 
		}
		
		if ( (restoreControlFocus != null) && (controlFocus != null)) {
				restoreControlFocus.value = controlFocus.id;
		}

		if (restoreScrollTop != null) {
			restoreScrollTop.value = document.body.scrollTop;
		}
		return;
}

function IrPagina( Pagina ) {
var paginaControl = document.getElementById('Pagina');
	if (parseInt(Pagina) <= 1 && parseInt(paginaControl.value) == 1) {
		alert( 'Ya se encuentra en la primer página');
		return;
	}
	if ( (parseInt(Pagina) > parseInt(paginaControl.value)) && (document.getElementById('AtEof').value != '0') ) {
		alert( 'Se encuentra en la última página');
		return;
	}
	paginaControl.value = Pagina;
	FireEvent( 'IrPagina' );
}

function IdClickValue( value ) {
	document.getElementById('Id').value = value;
}

function IdClick( Control ) {
	document.getElementById('Id').value = Control.value;
}

function RadClick( radControl , hidControl) {
	hidControl.value = radControl.value;
}

// document.getElementById('tableImprimirControls')  -- si todo funciona bien, borrar esto 17-02-2006!!!

// BEGIN - funciones para desplegar la fila seleccionada
// maneja el mouseOver, mouseOut y onclick
// deja marcada en otro color la fila seleccionada y graba en el hidden input el id

var rowSelected;

var oddClass = 'tablaAbmImpar';
var evenClass = 'tablaAbmPar';
var selectedClass = 'tablaAbmSelected';
var overClass = 'tablaAbmOver';

function rowOnClick( element, id ) { 
	// busco la tabla que tenga className = selectedClass
	// y la limpio
	if (rowSelected == null) {  clearInitial( element ); } 
	else { rowSelected.className=getRowClass( rowSelected ); }
	
	rowSelected=element;
	element.className=selectedClass;
	IdClickValue(id)
}

function rowOnMouseOver( element ) {
	element.style.cursor='pointer';
	if (element.className==selectedClass) { rowSelected=element; }
	element.className=overClass;
}

function rowOnMouseOut( element ) {
	element.style.cursor='default';
	if (element==rowSelected) { 
		element.className=selectedClass;
		return;
	}
	setRowClass( element );
}

function setRowClass( element ) {
var rowClass = getRowClass( element );
	if (rowClass != '') { element.className = rowClass; }
	return;	
}

function getRowClass( element ) {
var numRow;
	numRow = element.getAttribute("numrow");
	if (numRow == null) { return ''; }
	return numRow % 2 == 0 ? evenClass : oddClass;
}

function clearInitial( element ) {
var siblings;
var sibling;
var c;

	siblings = element.parentNode.getElementsByTagName( 'table' );
	
	for (c=0; c < siblings.length ; c++) {
		sibling = siblings[c];
		if (sibling.className == selectedClass) {
			setRowClass( sibling );
			return;
		}
	}

}

function HandleAbmKey() {
var Mess
var keyCode, ctrlKey

	with (event) {

		//window.alert( keyCode );
		switch (keyCode) {
			//case 45: FireEvent('Agregar');break; // Insert
			//case 46: FireEvent('Eliminar');break; // Delete
			//case 13: FireEvent('Modificar');break; // Enter
			case 33: { // PageUp
				if (ctrlKey) { IrPagina( parseInt(document.Formulario.Pagina.value) - 1 );}
			}
			case 34: { //PageDown
				if (ctrlKey) { IrPagina( parseInt(document.Formulario.Pagina.value) + 1 );}
			}
		} // switch
	} // with
}

function IdComboClick( Control ) {
var selectedValues
	selectedValues = Control.value.split("&")
	with (Formulario) {
		Id.value = selectedValues[0];
		SelCodigo.value = selectedValues[1];
		SelDescripcion.value = selectedValues[2];
	}
}

function IrComboPagina( Control ) {
	IrPagina( Control.options[Control.selectedIndex].value );
}

function CambiarCantFilas( Control ) {
	document.Formulario.CantFilas.value = Control.options[Control.selectedIndex].value;
	document.Formulario.Pagina.value = "1";
	FireEvent( 'IrPagina' );	
}

function Ordenar( Campo ) {
	document.Formulario.Orden.value = Campo;
	document.Formulario.Pagina.value = "1";
	FireEvent( 'IrPagina' );	
}

function HandleComboKey() {
var Mess
var keyCode, ctrlKey

	with (event) {

		//window.alert( keyCode );

		switch (keyCode) {
			case 13: Seleccionar();break; // Enter
			case 33: {
				if (ctrlKey) { IrPagina( parseInt(document.Formulario.Pagina.value) - 1 );}
			}
			case 34: {
				if (ctrlKey) { IrPagina( parseInt(document.Formulario.Pagina.value) + 1 );}
			}
		} // switch
	} // with
}

function Imprimir() {
	with (document.getElementById('tableImprimirControls')) {
		style.display = 'none';
		window.print(); 
		style.display = 'block';
	}
}

// show / hide controls

// si element es un string, devuelve document.getElementById(element)
// si no retorna element
function getElement( element ) {
	if (typeof element == 'string') { return document.getElementById(element); }
	return element;
}

function SwapShowControl ( Control ) {
	if (Control==null) return;
	if (Control.style.display == 'none') 
		Control.style.display = 'inline';
	else
		Control.style.display = 'none';
	
}

function HideControl( Control ) {
	Control = getElement( Control );
  if (Control==null) return;
  if (Control.style.display == 'none') { return; }
  Control.style.display = 'none';
}

function ShowControl( Control ) {
	Control = getElement( Control );
  if (Control==null) return;
  if (Control.style.display == 'inline') { return; }
  Control.style.display = 'inline';
}

function ShowHideControl( Control ) {
	Control = getElement( Control );
	if (Control == null) { return; }
	if (Control.style.display != 'none') { Control.style.display = 'none'; } 
	else { Control.style.display = 'block'; }
}

function refreshChildCombo( xmlData, controlName, idField, descriptionField, parentControlName1, parentIdField1 ) {
var combo, comboValue, option;
var doc, nodes, i, node, xPath;
var parent, parents, parentCount;
var xPathConditions, xPathCondition;

var modo;

	// no encontré el combo a refrescar
	combo = document.getElementById(controlName);
	if (combo == null) { return; }

	// guardo el elemento actualmente seleccionado
	comboValue = combo.options[combo.selectedIndex].value;

	//alert( 'refreshChildCombo, controlName=' + controlName + ',comboValue=' + comboValue);

	// no especificaron ningún parent
	if (arguments.length < 4) { return; }

	// proceso los parents
	parents = new Array();
	parentCount = 1;
	for (i=4; i<arguments.length; i=i+2) {
		parent = new Object();
		parent.controlName = arguments[i];
		parent.idField = arguments[i+1];
		parent.xmlAttribute = 'p' + parentCount + '';
		parent.control = document.getElementById(parent.controlName);
		parent.controlValue = (parent.control == null) ? '' : parent.control.value;
		parents.push(parent);
		parentCount ++;
	}
	
	// primero lo deshabilito
	comboEnable( combo, false );

	removeAllOptions( combo );
	addOption( combo, '', '--Seleccione--');
	// por si hay otra combo que depende de esta
	if (combo.onchange!=null) { combo.onchange() };
	
	// Si alguno de los que depende está vacío, dejo la combo vacía
	for (i=0; i<parents.length; i++) {
		parent = parents[i];
		//uno de los parents está vacío, dejo la combo vacía y disabled
		if (parent.controlValue == '') { return; }
	}
	
	doc = loadXML( xmlData );
	
	// proceso el valor de cada padre para armar la condicion del xPath
	xPathConditions = new Array();
	for (i=0; i<parents.length; i++) {
		parent = parents[i];
		//xPathConditions.push('@' + parent.idField + '="' + parent.controlValue + '"');
		xPathConditions.push('@' + parent.xmlAttribute + '="' + parent.controlValue + '"');
	}
	xPathCondition = xPathConditions.join(' and ');
	xPath = 'data/r[' + xPathCondition  + ']';

	// defino el metodo selectNodes y selectSingleNode para Mozilla Firefox
	mozillaXPath();
	nodes = doc.selectNodes( xPath );

	// no hay nodos que cumplan la condicion
	if (nodes.length==0) { return; }

	comboEnable( combo, true );

	for (i=0; i<nodes.length; i++) {
		node = nodes[i];
		addOption( combo, 
			node.selectSingleNode('@v').nodeValue, 
			node.selectSingleNode('@t').nodeValue );
	}

	// vuelvo a seleccionar el elemento anteriormente seleccionado
	for (i=0; i<combo.options.length; i++) {
		option = combo.options[i];
		if (option.value == comboValue) {
			combo.selectedIndex = i;
			if (combo.onchange!=null) { combo.onchange() };
			return;
		}
	}

}

function loadXML( xml ) {
	if (window.ActiveXObject) {
		var doc = new ActiveXObject("Microsoft.XMLDOM");
		doc.async = 'false';
		doc.loadXML( xml );
	} else {
		// firefox
		var parser = new DOMParser();
		var doc = parser.parseFromString( xml, 'text/xml');
	}
	return doc;
}

function comboEnable( combo, value ) {
var cssEnabled = 'formobj';
var cssDisabled = 'formobjDisabled';
var cssConsulta = 'formobjConsulta';

	if (value) {
		combo.disabled = false;
		combo.contentEditable = 'true';
		combo.className = cssEnabled;
		modo = document.getElementById('Modo') == null ? '' : document.getElementById('Modo').value.toUpperCase();
		if (modo=='CONSULTA' || modo=='BROWSE') { combo.className = cssConsulta };
	} else {
		combo.disabled = true;
		combo.contentEditable = 'false';
		combo.className = cssDisabled;
	}
	return;
}

function addOption( select, value, text )
{
	var option = document.createElement('option');
	option.value = value;
	option.text = text;

	try {
		select.add(option, null); // standards compliant; doesn't work in IE
	}
	catch(ex) {
		select.add(option); // IE only
	}
}

function removeAllOptions( select )
{
	while (select.length > 0) {
		select.remove(select.length - 1);
	}
}

function mozillaXPath() {

	// check for XPath implementation 
	if( document.implementation.hasFeature("XPath", "3.0") ) { 
		// prototying the XMLDocument 
		XMLDocument.prototype.selectNodes = 
		function(cXPathString, xNode) { 
			if( !xNode ) { xNode = this; }

			var oNSResolver = this.createNSResolver(this.documentElement) 

			var aItems = this.evaluate(cXPathString, xNode, oNSResolver,
				XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null) 
		
			var aResult = [];
			for( var i = 0; i < aItems.snapshotLength; i++) { 
				aResult[i] = aItems.snapshotItem(i);
			} 
			return aResult;
		} 

		// prototying the Element 
		Element.prototype.selectNodes = 
		function(cXPathString) { 
			if(this.ownerDocument.selectNodes) { 
				return this.ownerDocument.selectNodes(cXPathString, this);
			} else{throw "For XML Elements Only"; } 
		} 
	} 

	// check for XPath implementation 
	if( document.implementation.hasFeature("XPath", "3.0") ) { 
		// prototying the XMLDocument 
		XMLDocument.prototype.selectSingleNode = 
		function(cXPathString, xNode) { 
			if( !xNode ) { xNode = this; }
			var xItems = this.selectNodes(cXPathString, xNode);
			if( xItems.length > 0 ) { 
				return xItems[0];
			} else { 
				return null;
			} 
		} 

		// prototying the Element 
		Element.prototype.selectSingleNode = 
		function(cXPathString) {
			if(this.ownerDocument.selectSingleNode) { 
				return this.ownerDocument.selectSingleNode(cXPathString, this);
			} else{throw "For XML Elements Only";} 
		} 
	} 

}

function getEvent( e ) {
	if (window.event) {
		return window.event;		// IE
	} else {
		return e;								// FF
	}
}

function getKeyCode( e ) {
	if (window.event) {
		return window.event.keyCode;
	} else {
		return e.which;
	}
}


function getTarget( e ) {
	if (window.event) {
		return window.event.srcElement;		// IE
	} else {
		return e.target;									// FF
	}
}


// ayuda.js
var HelpWindow = null

function HideHelpWindow() {
	if (HelpWindow == null) {	return; } 
	else {
		HelpWindow.close();
		HelpWindow = null;
	}
}

function ShowHelpWindow(Titulo, Mensaje) {
var Pagina
var Options

	if (Titulo == null) {Titulo='Ayuda';}
	if (Mensaje == null) {return;}
	if (Mensaje == '') {return;}
	
	Pagina = "../Ayuda/QuickHelp.asp?" + 
		"Titulo=" + Titulo + "&" +
		"Mensaje=" + Mensaje

	Options = "toolbar=no,location=no,directories=no,status=no," +
	"scrollbars=no,resizable=no,titlebar=no," + 
	"height=320,width=350,top=100,left=10";
		
	HelpWindow = window.open(Pagina, 'Ayuda', Options);
}

function ShowHelpWindowScroll(Titulo, Mensaje) {
var Pagina
var Options

	if (Titulo == null) {Titulo='Ayuda';}
	if (Mensaje == null) {return;}
	if (Mensaje == '') {return;}
	
	Pagina = "../Ayuda/QuickHelp.asp?" + 
		"Titulo=" + Titulo + "&" +
		"Mensaje=" + Mensaje
	
	Options = "toolbar=no,location=no,directories=no,status=no," +
	"scrollbars=1,resizable=no,titlebar=no," + 
	"height=400,width=380,top=10,left=10";
		
	HelpWindow = window.open(Pagina, 'Ayuda', Options);
}

// valid.js
// Validaciones para los KeyPress en los Inputs
function validKeyEvent( e, nameControl, dataType ) {
	return validKey( getEvent(e), nameControl, dataType );
}

function validKey( e, nameControl, dataType ) {

	var modo = document.getElementById('Modo').value.toUpperCase();
	
	if ( modo == 'ALTA' || modo == 'MODIFICACION' ) {
		
		switch(dataType) {
		case 'INTEGER':			
			return validKeyInteger(e, nameControl);
			break;
			
		case 'FLOAT', 'DECIMAL':
			return validKeyFloat(e, nameControl);
			break;
			
		case 'DATE':
			return validKeyDate(e, nameControl);
			break;
			
		case 'DATETIME':
			return validKeyDateTime(e, nameControl);
			break;
			
		case 'TEXTUPPER':
			return validKeyTextUpper(e, nameControl);
			break;
			
		case 'TEXTLOWER':
			return validKeyTextLower(e, nameControl);
			break;
			
		case 'TIME':
			return validKeyTime(e, nameControl);
			break;
		default:	// Text Free
			
		}
	}
	else if ( modo == 'CONSULTA' || modo == 'BROWSE' ) {
		switch(dataType) {
		case 'INTEGER':
		case 'FLOAT': 
		case 'DECIMAL':
			return validKeyIntegerSearch(e, nameControl);
			break;

		case 'DATETIME':
			return validKeyDateTimeSearch(e, nameControl);
			break;

		default:	// Text Free
			
		}
	}
	
	return true;
}

// Valida INTEGER en el KeyPress
function validKeyTextUpper(e, nameControl) {
	
	// Solo se puede cambiar el valor del KeyCode en IE (DESPUES LO VEMOS!!!)
	if (window.event)
		e.keyCode = String.fromCharCode(e.keyCode).toUpperCase().charCodeAt(0);
	
	return true;
}

// Valida INTEGER en el KeyPress
function validKeyTextLower(e, nameControl) {
	
	// Solo se puede cambiar el valor del KeyCode en IE (DESPUES LO VEMOS!!!)
	if (window.event)
		e.keyCode = String.fromCharCode(e.keyCode).toLowerCase().charCodeAt(0);
	
	return true;
}

// Valida INTEGER en el KeyPress
function validKeyInteger(e, nameControl) {
	
	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
	
	return ( c < '0' || c > '9' ) ? false : true;
}

// Valida INTEGER en el KeyPress para la Busqueda
function validKeyIntegerSearch(e, nameControl) {
	
	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	var charValidos;
	
	// Establezco los Caracteres Validos
	charValidos = '<>=.0123456789';
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
	
	return (charValidos.indexOf(c) == -1) ? false : true;
}

// Valida DECIMAL en el KeyPress
function validKeyFloat(e, nameControl) {
	
	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);

	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC

	// Establezco los Caracteres Validos
	//charValidos = '0123456789.-' + sep;
	charValidos = '0123456789.-';

	if ( charValidos.indexOf(c) == -1 ) return false; // Solo acepto 012345689.-

	// ya había un punto decimal
	if ( c == "."  && document.getElementById(nameControl).value.indexOf('.') != -1 ) return false
	
	return true;
}

// Valida DATE en el KeyPress
function validKeyDate(e, nameControl) {

	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	var pos;
	var sep = '';
	var len;
	var charValidos;
	
	var value = document.getElementById(nameControl).value;
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
	
	sep = getSeparator( value, c );	
	
	// Establezco los Caracteres Validos
	charValidos = '0123456789' + sep;
	
	if ( charValidos.indexOf(c) == -1 ) return false; // Solo acepto 012345689/-

	switch(c) { // El Switch esta por claridad de Programa (se podia unificar)
		case sep:	
			if ( value.length <= 0 ) return false; // Controlo que no empiece con un Separador de Fecha Hora
			if ( value.count(sep) >= 2 ) return false;
			break
	}
	
	return true;
}

// Valida DATETIME en el KeyPress para la Busqueda
function validKeyDateTimeSearch(e, nameControl) {
	
	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	var charValidos;
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
	
	// Establezco los Caracteres Validos
	charValidos = ' <>=./-0123456789:';
	
	if (charValidos.indexOf(c) == -1) return false // Solo acepto 012345689/-
		
	return true;
}

// Valida DATETIME en el KeyPress
function validKeyDateTime(e, nameControl) {

	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	var sep = '';
	var sepHora = ':';					//caracter utilizado para separar la fecha de la hora
	var sepFechaHora = ' ';			//caracter utilizado para separar la fecha de la hora
	var charValidos;

	var value = document.getElementById(nameControl).value;
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC

	sep = getSeparator( value, c );	// infiero el separador según lo tipeado anteriormente

	// Establezco los Caracteres Validos
	charValidos = '0123456789' + sep + sepHora + sepFechaHora;
	
	if ( charValidos.indexOf(c) == -1 ) return false // Solo acepto 012345689/-
	
	switch(c) { // El Swith esta por claridad de Programa (se podia unificar)

		case sepFechaHora:	// Controlo que no ponga mas de 1 Separador de Fecha de la Hora
			if ( value.length <= 0 ) return false; // Controlo que no empiece con un Separador de Fecha Hora
			if ( value.indexOf(sepFechaHora) != -1 ) return false; // ya había un separador
			break;
			
		case sep:	// Controlo que no ponga mas de 2 Separadores de Fecha
			if ( value.length <= 0 ) return false; // Controlo que no empiece con un Separador
			if ( value.count(sep) >= 2 ) return false;
			break;
			
		case sepHora:	// Controlo que no ponga mas de 2 Separadores de Hora
			if ( value.length <= 0 ) return false; // Controlo que no empiece con un Separador
			if ( value.count(sepHora) >= 2 ) return false;
			break;
	}

	return true;
}

// Valida TIME en el KeyPress
function validKeyTime(e, nameControl) {

	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	var sep = ':';
	var charValidos;

	var value = document.getElementById(nameControl).value;
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
		
	// Establezco los Caracteres Validos
	charValidos = '0123456789' + sep;
	
	if ( charValidos.indexOf(c) == -1 ) return false; // Solo acepto 012345689/-
	
	switch(c) { // El Switch esta por claridad de Programa (se podia unificar)
		case ':':	
			if ( value.length <= 0 ) return false;		// Controlo que no empiece con un Separador
			if ( value.count(sep) >= 2 ) return false; // Controlo que no ponga mas de 2 Separadores de Hora
			break;			
	}
	return true;
}

// Valida INTEGER en el KeyPress para la Busqueda
function validKeyChars( e, nameControl , charValidos ) {

	var modo = document.getElementById('Modo').value.toUpperCase();

	var keyCode = getKeyCode(e);
	var c = String.fromCharCode(keyCode);
	
	if (keyCode < 32) return true; // Sino MOZILLA suprime la tecla BACKSPC
	
	if ( modo == 'CONSULTA' || modo == 'BROWSE' )
		charValidos += '<>=.'
	
	if ( charValidos.indexOf(c) == -1 ) return false; // Solo acepto 012345689/-
		
	return true;
}

// Validaciones de Formatos de Datos con Expresiones Regulares
function validFmtDate(valor) {
	var valid = false
	var strFecha
	
	//Formato #9/#9/9999
	if (/^\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4}$/.test(valor)) {
		if (!dateValid(FmtStrDate('mm/dd/yyyy', 'dd/mm/yyyy'))) {
			alert('Se encuentra en la última página');
		} else {
		
		}
		
		//reemplazar - por /
		//split /
		//armar string con fecha mm/dd/yyyy
		//dateValid
	} else {
		alert('Formato de Fecha Inválido');
	}
  return (valid);
  //!dateValid(vDateValueCheck)
}

function validFmtDateTime(valor) {
	//Formato #9/#9/9999 #9:#9:#9
  return (/^\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4}( )\d{1,2}(:)\d{1,2}(:)\d{1,2}$/.test(valor));
}

function validFmtDateSearch(valor) {
	// Valido
	// <>=#9/#9/9999
	// #9/#9/9999
	// #9/#9/9999..#9/#9/9999

	var valid = false;

	// Valido <>=#9/#9/9999
	valid = (/^((<|>|=|>=|<=|<>)\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4})$/.test(valor))
	
	// Valido #9/#9/9999
	if (!valid) {
		valid = (/^\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4}$/.test(valor));
	}
	
	// Valido #9/#9/9999..#9/#9/9999
	if (!valid) {
		valid = (/^\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4}(..)\d{1,2}(-|[/])\d{1,2}(-|[/])\d{4}$/.test(valor));
	}

  return (valid);
}

function validFmtInteger(valor) {
	// Valido
	// #9

	return (/^(\d)+$/.test(valor));
}

function validFmtIntegerSearch(valor) {
	// Valido
	// <>=#9
	// #9
	// #9..#9

	var valid = false;

	// Valido <>=#9
	valid = (/^((<|>|=|>=|<=|<>)(-|[+]){0,1}(\d)+)$/.test(valor))
	
	// Valido #9
	if (!valid) {
		valid = (/^(-|[+]){0,1}(\d)+$/.test(valor));
	}
	
	// Valido #9..#9
	if (!valid) {
		valid = (/^(-|[+]){0,1}((\d)+)(..)(-|[+]){0,1}((\d)+)$/.test(valor));
	}

  return (valid);
}

//El Nombre esta mal esto no es Float... 
function validFmtFloat(valor) {
	// Valido
	// #9.#

	return (/^(-|[+]){0,1}(\d)(.){0,1}(\d)*$/.test(valor));
}

function validFmtFloatSearch(valor) {
	// Valido
	// <>=#9.#
	// #9.#
	// #9.#..#9.#

	var valid = false;

	// Valido <>=#9.#
	valid = (/^((<|>|=|>=|<=|<>)(-|[+]){0,1}(\d)(.){0,1}(\d)*)$/.test(valor))
	
	// Valido #9
	if (!valid) {
		valid = (/^(-|[+]){0,1}(\d)(.){0,1}(\d)*$/.test(valor));
	}
	
	// Valido #9..#9
	if (!valid) {
		valid = (/^(-|[+]){0,1}(\d)(.){0,1}(\d)*(..)(-|[+]){0,1}(\d)(.){0,1}(\d)*$/.test(valor));
	}

  return (valid);
}

//infiero cuál es el separador utilizado a partir de lo tipeado por el usuario
function getSeparator( prevValue, charTyped ) {
	var sep = ''

	// Establezco que separador va a usar...
	// Busco lo ingresado anteriormente
	if ( prevValue.indexOf('-') != -1 ) sep = '-';
	else if ( prevValue.indexOf('/') != -1 ) sep = '/';
	else if ( prevValue.indexOf('.') != -1 ) sep = '.';
	else {		//todavía no tipeó ningún separador
		if ( '-/.'.indexOf(charTyped) != -1) {
			sep = charTyped;
		}
	}
	return sep;		
}

if (!String.prototype.count) {
	String.prototype.count = function( subStr ) {
	var i = 0;
	var pos;
	var str = this;

		pos = str.indexOf(subStr);
		while ( pos != -1 ) {
			i++;
			str = str.substring(pos + 1)
			pos = str.indexOf(subStr);
		}
		return i;
	}
}

/*
si en specs hay un center=fullscreen=yes|no|1|0
recalcula left y top para que la ventana aparezca centrada
*/
function windowOpen( url, name, specs, replace ) {
var dicSpecs;
var center;
var width, height
var left, top
var win;

	dicSpecs = stringToDic( specs )

	center = ( dicSpecs.center == null ? '0': dicSpecs.center );

	if ( isOneOf( center.toString(), 'yes', '1' ) ) {
		width = parseFloat( ( dicSpecs.width == null ? '800': dicSpecs.width ) );
		height = parseFloat( ( dicSpecs.height == null ? '510': dicSpecs.height ) );
    left = (window.screen.width/2) - (width/2);
    top = (window.screen.height/2) - (height/2);
    left = left.toString()
    top = top.toString()
    dicSpecs.left = left;
    dicSpecs.top = top;
    dicSpecs.screenX = left;
    dicSpecs.screenY = top;
		specs = dicToString( dicSpecs );
	}
	
	if (dicSpecs.center != null ) {
		dicSpecs.center = null;
		specs = dicToString( dicSpecs );
	}
     
	win = window.open( url, name, specs, replace );
	win.focus();
	
	return win;
}

function isOneOf() {
var obj;
var c
	if ( arguments.length <= 1 ) return false;
	obj = arguments[0];

	for ( c=1; c < arguments.length; c++ ) {
		if ( obj == arguments[c] ) return true;
	}
	return false;
}

function stringToDic( text, sep, equal ) {
var dic;
var aPairs;
var pair;
var aPair;
var c;

	sep = ( sep == null ? ',' : sep );
	equal = ( equal == null ? '=' : equal );

	dic = new Object;
	aPairs = text.split( sep );
	
	for ( c=0; c < aPairs.length; c++ ) {
		pair = aPairs[c];
		aPair = pair.split( equal );
		if (aPair.length > 0) {
			if (aPair.lenght == 1) aPair.push( '' );
			dic[aPair[0]] = aPair[1];
		}
	}
	return dic;

}

function dicToString( dic, sep, equal ) {
var key;
var text;

	sep = ( sep == null ? ',' : sep );
	equal = ( equal == null ? '=' : equal );

	text = '';
	
	for ( key in dic ) {
		text += key + equal + dic[key] + sep ;
	}
	if ( text.charAt( text.length -1 ) == sep ) text = text.substring( 0, text.length -1 );

	return text;
}