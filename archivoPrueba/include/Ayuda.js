	

var HelpWindow = null

function HideHelpWindow() {
	if (HelpWindow == null) {	return; 
	} else {
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
	
	Pagina = "<% =Map("Ayuda/QuickHelp.asp?")%>" + 
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
	
	Pagina = "<% =Map("Ayuda/QuickHelp.asp?")%>" + 
		"Titulo=" + Titulo + "&" +
		"Mensaje=" + Mensaje
	
	Options = "toolbar=no,location=no,directories=no,status=no," +
	"scrollbars=1,resizable=no,titlebar=no," + 
	"height=400,width=380,top=10,left=10";
		
	HelpWindow = window.open(Pagina, 'Ayuda', Options);
}

</script>