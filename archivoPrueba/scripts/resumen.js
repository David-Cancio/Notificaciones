    var mainMenu =
    [
    _cmSplit,
    [null,'Home','../default.asp',null,'Home page'],
    _cmSplit,
    [null,'Casos','#',null,'Casos',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas SECLO','#',null,'Multas SECLO',
    ['<img src="../images/menu/edit.png" />','Bandeja de Entrada','../Certificados/AbmCertificadosSECLOIngreso.asp?Area=SECLO',null,'Ingreso de Certificados de Multas del Seclo'],
    ['<img src="../images/menu/edit.png" />','Ingreso de Certificados','../Casos/AbmCertificadoSeclo.asp?Area=SECLO',null,'Ingreso de Certificados de Multas del Seclo'],
    ['<img src="../images/menu/edit.png" />','Casos','../Casos/AbmCaso.asp?TipoJuicio=MULTAS SECLO',null,'Casos del Seclo'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Bandeja de Pagos SECLO','../Certificados/PagosLeySECLO.asp',null,'Bandeja de Pagos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Pago de Boletas Judiciales en BNA (Archivo)  Conv. 4643','../Pagos/AbmPagoArchivo.asp?Convenio=4643&Area=SECLO',null,'Bandeja de Pagos de Seclo por Archivo'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Supervisión de Casos','../Casos/CasoSupervision.asp?TipoJuicio=MULTAS SECLO',null,'Supervisión de casos']
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas Ley 18695','#',null,'Multas Ley 18695',
    ['<img src="../images/menu/edit.png" />','Competencia Plena','#',null,'Competencia Plena',
    ['<img src="../images/menu/edit.png" />','Bandeja de Entrada CPL','../ExpedientesCPL/ExpedienteCPLIngreso.asp',null,'Bandeja de Entrada de Multas de CPL'],
    ['<img src="../images/menu/edit.png" />','Carga del Expediente','../ExpedientesCPL/AbmExpedienteCPL.Asp?Area=DIF&Tipo=CP',null,'Carga de ExpedienteCPL'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Carga de Sumarios','../Sumarios/AbmSumario.Asp?Area=DIF&Tipo=CP',null,'Carga de Sumario'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Casos','../Casos/AbmCaso.asp?TipoJuicio=DIF CP CASO',null,'Casos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Bandeja de Pagos CPL','../ExpedientesCPL/PagosLey18695.asp',null,'Bandeja de Pagos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Pago de Boletas Judiciales en BNA (Archivo) Conv. 4587','../Pagos/AbmPagoArchivo.asp?Convenio=4587&Area=DIF CP',null,'Bandeja de Pagos de Competencia Plena por Archivo'],
    ['<img src="../images/menu/edit.png" />','Pago de Boletas Judiciales en BNA (Archivo) Conv. 5468','../Pagos/AbmPagoArchivo.asp?Convenio=5468&Area=DIF CP',null,'Bandeja de Pagos de Competencia Plena por Archivo'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Supervisión de Casos','../Casos/CasoSupervision.asp?TipoJuicio=DIF CP CASO',null,'Supervisión de casos']
    ],
    ['<img src="../images/menu/edit.png" />','Obstrucción PNRT','#',null,'Obstrucción PNRT',
    ['<img src="../images/menu/edit.png" />','Carga de Sumario','../Sumarios/AbmSumario.Asp?Area=DIF&Tipo=OBS',null,'Carga de Sumario'],
    ['<img src="../images/menu/edit.png" />','Casos','../Casos/AbmCaso.asp?TipoJuicio=DIF OBS CASO',null,'Casos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Supervisión de Casos','../Casos/CasoSupervision.asp?TipoJuicio=DIF OBS CASO',null,'Supervisión de casos']
    ]
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas PNRT','#',null,'Multas pnrt',
    ['<img src="../images/menu/edit.png" />','Bandeja de Entrada PNRT','../Certificados/CertificadosPNRTIngreso.asp',null,'Bandeja de Entrada de Multas del PNRT'],
    ['<img src="../images/menu/edit.png" />','Multas PNRT','../Casos/AbmCaso.asp?TipoJuicio=MULTAS PNRT',null,'Alta baja y modificación de Multas del PNRT'],
    ['<img src="../images/menu/edit.png" />','Bandeja de Pagos PNRT','../Certificados/PagosPNRT.asp',null,'Bandeja de Pagos del PNRT'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Boletas Judiciales (por Archivo) Conv. 3278','../Pagos/AbmPagoArchivo.asp?Convenio=3278&Area=PNRT',null,'Bandeja de Pagos del PNRT por Archivo'],
    ['<img src="../images/menu/edit.png" />','Boletas Judiciales (por Archivo) Conv. 5469','../Pagos/AbmPagoArchivo.asp?Convenio=5469&Area=PNRT',null,'Bandeja de Pagos del PNRT por Archivo'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Supervisión de Casos','../Casos/CasoSupervision.asp?TipoJuicio=MULTAS PNRT',null,'Supervisión de casos']
    ],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Otros Casos','../casos/AbmCaso.asp?TipoJuicio=OTROS JUICIOS',null,'Alta baja y modificación de Casos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Todos los casos','../casos/AbmCaso.asp?TipoJuicio=',null,'Alta baja y modificación de Casos']
    ],
    _cmSplit,
    [null,'Sentencias','#',null,'Sentencias',
    ['<img src="../images/menu/search_text.png" />','Sentencias','../Sentencias/Sentencias.asp?Area=SENTENCIAS',null,'Alta baja y modificación de Sentencias']
    ],
    _cmSplit,
    [null,'Tablas','#',null,'Tablas',
    ['<img src="../images/menu/edit.png" />','Tipo de caso','../Tablas/AbmTipoCaso.asp',null,'Tipos de casos'],
    ['<img src="../images/menu/language.png" />','Areas','../Tablas/AbmArea.asp',null,'Areas'],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Infractores','#',null,'Infractores',
    ['<img src="../images/menu/users_002.png" />','Infractores','../Tablas/AbmPersona.asp',null,'Personas'],
    ['<img src="../images/menu/media.png" />','Provincias','../Tablas/AbmProvincia.asp',null,'Provincias'],
    ['<img src="../images/menu/edit.png" />','Tipos de Documento','../Tablas/AbmTipoDocumento.asp',null,'Tipos de Documentos'],
    ['<img src="../images/menu/edit.png" />','Tipo Personeria','../Tablas/AbmTipoPersoneria.asp',null,'Tipos de Personerias']
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Procesales','#',null,'Procesales',
    ['<img src="../images/menu/users_002.png" />','Abogados','../Tablas/AbmAbogado.asp',null,'Abogados'],
    ['<img src="../images/menu/language.png" />','Oficiales ad hoc','../Tablas/AbmOficialAdHoc.asp',null,'Oficial Ad-Hoc'],
    _cmSplit,
    ['<img src="../images/menu/language.png" />','Oficinas','../Tablas/AbmOficina.asp',null,'Oficinas'],
    ['<img src="../images/menu/language.png" />','Tipo Oficina','../Tablas/AbmTipoOficina.asp',null,'Tipo Oficina'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Tipo de Juicio','../Tablas/AbmTipoJuicio.asp',null,'Tipo del Juicio'],
    ['<img src="../images/menu/edit.png" />','Etapa','../Tablas/AbmEtapa.asp',null,'Etapas'],
    ['<img src="../images/menu/edit.png" />','Estado','../Tablas/AbmEstado.asp',null,'Estado'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Rol Procesal','../Tablas/AbmTabla.asp?Tabla=RolProcesal&TablaDescripcion=Roles procesales',null,'Roles procesales'],
    ['<img src="../images/menu/document.png" />','Materia','../Tablas/AbmMateria.asp',null,'Roles procesales'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Tipo Certificado','../Tablas/AbmTipoCertificado.asp',null,'Tipo Certificado'],
    ['<img src="../images/menu/users_002.png" />','Infracción (PNRT)','../Tablas/AbmInfraccionPNRT.asp',null,'Infracciones del PNRT']
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Juzgados','#',null,'Juzgados',
    ['<img src="../images/menu/edit.png" />','Jurisdicciones','../Tablas/AbmTabla.asp?Tabla=Jurisdiccion&TablaDescripcion=Jurisdicciones',null,'Jurisidicciones'],
    ['<img src="../images/menu/edit.png" />','Fueros','../Tablas/AbmFuero.asp',null,'Fueros'],
    ['<img src="../images/menu/edit.png" />','Juzgados','../Tablas/AbmJuzgado.asp',null,'Juzgados'],
    ['<img src="../images/menu/edit.png" />','Secretarías','../Tablas/AbmSecretaria.asp',null,'Secretarías']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Modelos','#',null,'Modelos',
    ['<img src="../images/menu/edit.png" />','Origen de Datos','../TablasModelos/AbmOrigenDato.asp',null,'Origenes de Datos'],
    ['<img src="../images/menu/edit.png" />','Campos de Datos','../TablasModelos/AbmTag.asp',null,'Tags'],
    ['<img src="../images/menu/edit.png" />','Campos de Origen de Datos','../TablasModelos/AbmOrigenDatoTag.asp',null,'Campos de Orígenes de Datos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Plantillas','../TablasModelos/AbmPlantilla.asp',null,'Campos de Plantilla'],
    ['<img src="../images/menu/edit.png" />','Tipo de Plantillas','../Tablas/AbmTipoPlantilla.asp',null,'Campos de Tipo de Plantillas'],
    _cmSplit,
    ['<img src="../images/menu/document.png" />','Modelos','../TablasModelos/AbmModelo.asp',null,'Modelos'],
    _cmSplit,
    ['<img src="../images/menu/document.png" />','Modelos Oficinas','../TablasModelos/AbmModeloOficina.asp',null,'Modelos Oficinas']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Movimientos','#',null,'Movimientos',
    ['<img src="../images/menu/edit.png" />','Tipos de Movimientos','../Tablas/AbmTabla.asp?Tabla=TipoMovimiento&TablaDescripcion=Tipos de movimiento',null,'Tipos de movimientos'],
    ['<img src="../images/menu/edit.png" />','Tipos de Movimientos Contables','../Tablas/AbmTipoMovContable.asp',null,'Tipos de movimientos contables'],
    ['<img src="../images/menu/edit.png" />','Tipos de Oficio','../Tablas/AbmTipoOficio.asp',null,'Tipos de  Oficios']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Bancos','#',null,'Bancos',
    ['<img src="../images/menu/edit.png" />','Ctas. Rec. Bancos','../Tablas/AbmBanco.asp',null,'Bancos'],
    ['<img src="../images/menu/edit.png" />','Ctas. Rec. Sucursales','../Tablas/AbmBancoSucursal.asp',null,'Sucursales'],
    ['<img src="../images/menu/edit.png" />','Ctas. Rec. Cuentas','../Tablas/AbmBancoCuenta.asp',null,'Cuentas'],
    _cmSplit,
    ['<img src="../images/menu/document.png" />','Tipos de Pagos','../Tablas/AbmTipoPago.asp',null,'Tipos de Pagos'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Tipos de Cuentas Bancarias','../Tablas/AbmTabla.asp?Tabla=TipoCuentaBCRA&TablaDescripcion=Tipos de Cuentas del BCRA',null,'Tipos de Cuentas Bancarias']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Liquidaciones','#',null,'Liquidaciones',
    ['<img src="../images/menu/edit.png" />','Tipos de Liquidación','../Tablas/AbmTipoLiquidacion.asp',null,'Tipo Liquidacion'],
    ['<img src="../images/menu/edit.png" />','Tipo de Liquidación por Area','../Tablas/AbmAreaTipoLiquidacion.asp',null,'Area Tipo Liquidacion'],
    ['<img src="../images/menu/edit.png" />','Tipos de Boletas','../Tablas/AbmTipoBoleta.asp',null,'Tipo Boleta'],
    ['<img src="../images/menu/edit.png" />','Tipo de Calculo','../Tablas/AbmTipoCalculo.asp',null,'Tipo de Calculo']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Convenios con el BNA','#',null,'Intereses',
    ['<img src="../images/menu/edit.png" />','Convenios BNA','../Tablas/AbmConvenioBNA.asp',null,'Convenio BNA'],
    ['<img src="../images/menu/edit.png" />','Formato del Convenio BNA','../Tablas/AbmConvenioBNACampos.asp',null,'Convenio BNA Campos']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Intereses','#',null,'Intereses',
    ['<img src="../images/menu/install.png" />','Tipos de Intereses','../Tablas/AbmInteres.asp',null,'Tipos de Intereses'],
    ['<img src="../images/menu/language.png" />','Tablas de Intereses','../Tablas/AbmInteresItem.asp',null,'Tabla de Intereses'],
    ['<img src="../images/menu/edit.png" />','Feriados','../Tablas/AbmFeriado.asp',null,'Feriado']
    ],
    _cmSplit,
    ['<img src="../images/menu/document.png" />','Información','../Tablas/AbmInformacion.asp',null,'Sitios de interés'],
    ['<img src="../images/menu/edit.png" />','Tipos de Información','../Tablas/AbmTipoInformacion.asp',null,'Tipos de información'],
    _cmSplit,
    ['<img src="../images/menu/users_002.png" />','Usuarios','../Tablas/AbmUsuario.asp',null,'Usuarios'],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Permisos','#',null,'Permisos',
    ['<img src="../images/menu/document.png" />','Objetos','../Seguridad/AbmObjeto.asp',null,'Objetos'],
    ['<img src="../images/menu/users.png" />','Grupos','../Seguridad/AbmGrupo.asp',null,'Grupos'],
    ['<img src="../images/menu/install.png" />','Permisos','../Seguridad/AbmPermiso.asp',null,'Permisos']
    ],
    _cmSplit,
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','WebService','#',null,'WebService',
    ['<img src="../images/menu/install.png" />','WS Agenda','../ws/wsrest.asp?_Servicio=Juicios&_Recurso=AlertaProceso&_Accion=Alta',null,'Web Service de alertas']
    ]
    ],
    _cmSplit,
    [null,'Consultas','#',null,'Consultas',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas SECLO','#',null,'Consultas Multas SECLO',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Pagos','#',null,'Consultas Pagos',
    ['<img src="../images/menu/search_text.png" />','Pagos por Oficina','../Consultas/ConsultaPagos.asp?Area=SECLO',null,'Consulta de pagos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Pagos por Abogado','../Consultas/ConsultaPagosPorAbogado.asp?Area=SECLO',null,'Consulta de pagos por Abogado'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Recaudacion Diaria','../Consultas/ConsultaRecaudacion.asp?Area=SECLO',null,'Consulta de Recaudacion Diaria']
    ],
    ['<img src="../images/menu/search_text.png" />','Liquidaciones','../Consultas/ConsultaLiquidaciones.asp?Area=SECLO',null,'Consulta de liquidaciones efectuadas'],
    ['<img src="../images/menu/search_text.png" />','Saldo de Casos a fecha','../Consultas/ConsultaCapitalAdeudado.asp?Area=SECLO',null,'Consulta de saldos de casos activos anteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Casos sin movimientos a fecha','../Consultas/ConsultaMovimientoCaso.asp?Area=SECLO',null,'Consulta de casos sin movimientos posteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Estado de Casos','../Consultas/ConsultaPorEstado.asp?Area=SECLO',null,'Consulta de casos por estado'],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Boletas','#',null,'Consulta Boletas',
    ['<img src="../images/menu/search_text.png" />','Boletas por Oficina','../Consultas/ConsultaBoletas.asp?Area=SECLO',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas por Abogado','../Consultas/ConsultaBoletasPorAbogado.asp?Area=SECLO',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas Vencidas','../Consultas/ConsultaBoletasVencidas.asp?Area=SECLO',null,'Consulta de Boletas Vencidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas a Vencer','../Consultas/ConsultaBoletasAVencer.asp?Area=SECLO',null,'Consulta de Boletas a Vencer']
    ]
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas Ley 18695','#',null,'Multas Ley 18695',
    ['<img src="../images/menu/edit.png" />','Competencia Plena','#',null,'Competencia Plena',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Pagos','#',null,'Consultas Pagos',
    ['<img src="../images/menu/search_text.png" />','Pagos por Oficina','../Consultas/ConsultaPagos.asp?Area=DIF&Tipo=CP',null,'Consulta de pagos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Pagos por Abogado','../Consultas/ConsultaPagosPorAbogado.asp?Area=DIF&Tipo=CP',null,'Consulta de pagos por Abogado'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Recaudacion Diaria','../Consultas/ConsultaRecaudacion.asp?Area=DIF&Tipo=CP',null,'Consulta de Recaudacion Diaria']
    ],
    ['<img src="../images/menu/search_text.png" />','Liquidaciones','../Consultas/ConsultaLiquidaciones.asp?Area=DIF&Tipo=CP',null,'Consulta de liquidaciones efectuadas'],
    ['<img src="../images/menu/search_text.png" />','Casos por Juzgado','../Consultas/ConsultaCasosPorJuzgado.asp?Area=DIF&Tipo=CP',null,'Consulta de casos por juzgado'],
    ['<img src="../images/menu/search_text.png" />','Saldo de Casos a fecha','../Consultas/ConsultaCapitalAdeudado.asp?Area=DIF&Tipo=CP',null,'Consulta de saldos de casos activos anteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Casos sin movimientos a fecha','../Consultas/ConsultaMovimientoCaso.asp?Area=DIF&Tipo=CP',null,'Consulta de casos sin movimientos posteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Estado de Casos','../Consultas/ConsultaPorEstado.asp?Area=DIF&Tipo=CP',null,'Consulta de casos por estado'],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Boletas','#',null,'Consulta Boletas',
    ['<img src="../images/menu/search_text.png" />','Boletas por Oficina','../Consultas/ConsultaBoletas.asp?Area=DIF&Tipo=CP',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas por Abogado','../Consultas/ConsultaBoletasPorAbogado.asp?Area=DIF&Tipo=CP',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas Vencidas','../Consultas/ConsultaBoletasVencidas.asp?Area=DIF&Tipo=CP',null,'Consulta de Boletas Vencidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas a Vencer','../Consultas/ConsultaBoletasAVencer.asp?Area=DIF&Tipo=CP',null,'Consulta de Boletas a Vencer']
    ]
    ],
    ['<img src="../images/menu/edit.png" />','Obstrucción PNRT','#',null,'Obstrucción PNRT',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Pagos','#',null,'Consultas Pagos',
    ['<img src="../images/menu/search_text.png" />','Pagos por Oficina','../Consultas/ConsultaPagos.asp?Area=DIF&Tipo=OBS',null,'Consulta de pagos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Pagos por Abogado','../Consultas/ConsultaPagosPorAbogado.asp?Area=DIF&Tipo=OBS',null,'Consulta de pagos por Abogado'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Recaudacion Diaria','../Consultas/ConsultaRecaudacion.asp?Area=DIF&Tipo=OBS',null,'Consulta de Recaudacion Diaria']
    ],
    ['<img src="../images/menu/search_text.png" />','Liquidaciones','../Consultas/ConsultaLiquidaciones.asp?Area=DIF&Tipo=OBS',null,'Consulta de liquidaciones efectuadas'],
    ['<img src="../images/menu/search_text.png" />','Casos por Juzgado','../Consultas/ConsultaCasosPorJuzgado.asp?Area=DIF&Tipo=OBS',null,'Consulta de casos por juzgado'],
    ['<img src="../images/menu/search_text.png" />','Saldo de Casos a fecha','../Consultas/ConsultaCapitalAdeudado.asp?Area=DIF&Tipo=OBS',null,'Consulta de saldos de casos activos anteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Casos sin movimientos a fecha','../Consultas/ConsultaMovimientoCaso.asp?Area=DIF&Tipo=OBS',null,'Consulta de casos sin movimientos posteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Estado de Casos','../Consultas/ConsultaPorEstado.asp?Area=DIF&Tipo=OBS',null,'Consulta de casos por estado'],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Boletas','#',null,'Consulta Boletas',
    ['<img src="../images/menu/search_text.png" />','Boletas por Oficina','../Consultas/ConsultaBoletas.asp?Area=DIF&Tipo=OBS',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas por Abogado','../Consultas/ConsultaBoletasPorAbogado.asp?Area=DIF&Tipo=OBS',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas Vencidas','../Consultas/ConsultaBoletasVencidas.asp?Area=DIF&Tipo=OBS',null,'Consulta de Boletas Vencidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas a Vencer','../Consultas/ConsultaBoletasAVencer.asp?Area=DIF&Tipo=OBS',null,'Consulta de Boletas a Vencer']
    ]
    ]
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas PNRT','#',null,'Consultas Multas PNRT',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Pagos','#',null,'Consultas Pagos',
    ['<img src="../images/menu/search_text.png" />','Pagos por Oficina','../Consultas/ConsultaPagos.asp?Area=PNRT',null,'Consulta de pagos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Pagos por Abogado','../Consultas/ConsultaPagosPorAbogado.asp?Area=PNRT',null,'Consulta de pagos por Abogado'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Recaudacion Diaria','../Consultas/ConsultaRecaudacion.asp?Area=PNRT',null,'Consulta de Recaudacion Diaria']
    ],
    ['<img src="../images/menu/search_text.png" />','Liquidaciones','../Consultas/ConsultaLiquidaciones.asp?Area=PNRT',null,'Consulta de liquidaciones efectuadas'],
    ['<img src="../images/menu/search_text.png" />','Casos por Juzgado','../Consultas/ConsultaCasosPorJuzgado.asp?Area=PNRT',null,'Consulta de casos por juzgado'],
    ['<img src="../images/menu/search_text.png" />','Saldo de Casos a fecha','../Consultas/ConsultaCapitalAdeudado.asp?Area=PNRT',null,'Consulta de saldos de casos activos anteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Casos sin movimientos a fecha','../Consultas/ConsultaMovimientoCaso.asp?Area=PNRT',null,'Consulta de casos sin movimientos posteriores a fecha'],
    ['<img src="../images/menu/search_text.png" />','Estado de Casos','../Consultas/ConsultaPorEstado.asp?Area=PNRT',null,'Consulta de casos por estado'],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Boletas','#',null,'Consulta Boletas',
    ['<img src="../images/menu/search_text.png" />','Boletas por Oficina','../Consultas/ConsultaBoletas.asp?Area=PNRT',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas por Abogado','../Consultas/ConsultaBoletasPorAbogado.asp?Area=PNRT',null,'Consulta de Boletas Emitidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas Vencidas','../Consultas/ConsultaBoletasVencidas.asp?Area=PNRT',null,'Consulta de Boletas Vencidas'],
    ['<img src="../images/menu/search_text.png" />','Boletas a Vencer','../Consultas/ConsultaBoletasAVencer.asp?Area=PNRT',null,'Consulta de Boletas a Vencer']
    ],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Oficios BCRA','../Consultas/ConsultaOficiosBCRA.asp',null,'Consultas']
    ],
    ['<img src="../images/menu/search_text.png" />','Casos de Abogados por Juzgado','../Consultas/ConsultaCasosDeAbogadosPorJuzgado.asp',null,'Consultas'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Sentencias','../Consultas/ConsultaSentencias.asp?Area=SENTENCIAS',null,'Consultas'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Auditoría','../Seguridad/AbmAudit.asp?permiso=consulta de auditoria',null,'Auditoría'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Auditoría Casos P.T.N.','../Consultas/ConsultaCasosAdvocatus.asp',null,'Auditoría de Causas P.T.N.']
    ],
    [null,'Información','../Informacion/Informacion.asp',null,'Sitios de interés'],
    _cmSplit,
    [null,'Estadísticas','#',null,'Estadisticas',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas SECLO','#',null,'Multas SECLO',
    ['<img src="../images/menu/search_text.png" />','Casos por Oficina','../Estadisticas/JuiciosPorPeriodo.asp?Area=SECLO&Consulta=TipoOficina',null,'Estadística de Casos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Casos por Etapa','../Estadisticas/PorEtapa.asp?Area=SECLO',null,'Estadística de Casos por Etapa'],
    ['<img src="../images/menu/search_text.png" />','Casos por Abogado','../Estadisticas/PorAbogado.asp?Area=SECLO',null,'Estadística de Casos por Abogado']
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas Ley 18695','#',null,'Multas Ley 18695',
    ['<img src="../images/menu/edit.png" />','Competencia Plena','#',null,'Competencia Plena',
    ['<img src="../images/menu/search_text.png" />','Casos por Oficina','../Estadisticas/JuiciosPorPeriodo.asp?Area=DIF&Tipo=CP&Consulta=TipoOficina',null,'Estadística de Casos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Casos por Etapa','../Estadisticas/PorEtapa.asp?Area=DIF&Tipo=CP',null,'Estadística de Casos por Etapa'],
    ['<img src="../images/menu/search_text.png" />','Casos por Abogado','../Estadisticas/PorAbogado.asp?Area=DIF&Tipo=CP',null,'Estadística de Casos por Abogado']
    ],
    ['<img src="../images/menu/edit.png" />','Obstrucción PNRT','#',null,'Obstrucción PNRT',
    ['<img src="../images/menu/search_text.png" />','Casos por Oficina','../Estadisticas/JuiciosPorPeriodo.asp?Area=DIF&Tipo=OBS&Consulta=TipoOficina',null,'Estadística de Casos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Casos por Etapa','../Estadisticas/PorEtapa.asp?Area=DIF&Tipo=OBS',null,'Estadística de Casos por Etapa'],
    ['<img src="../images/menu/search_text.png" />','Casos por Abogado','../Estadisticas/PorAbogado.asp?Area=DIF&Tipo=OBS',null,'Estadística de Casos por Abogado']
    ]
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas PNRT','#',null,'Estadisticas de Multas PNRT',
    ['<img src="../images/menu/search_text.png" />','Casos por Oficina','../Estadisticas/JuiciosPorPeriodo.asp?Area=PNRT&Consulta=TipoOficina',null,'Estadística de Casos por Oficina'],
    ['<img src="../images/menu/search_text.png" />','Casos por Etapa','../Estadisticas/PorEtapa.asp?Area=PNRT',null,'Estadística de Casos por Etapa'],
    ['<img src="../images/menu/search_text.png" />','Casos por Abogado','../Estadisticas/PorAbogado.asp?Area=PNRT',null,'Estadística de Casos por Abogado']
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Sentencias','#',null,'Estadisticas de Sentencias',
    ['<img src="../images/menu/search_text.png" />','Sentencias por Tipo','../Estadisticas/PorTipo.asp?Area=SENTENCIAS',null,'Estadística por Tipo de Caso']
    ]
    ],
    [null,'Procesos','#',null,'Procesos',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Multas PNRT','#',null,'Multas pnrt',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Oficios BCRA','#',null,'Oficios BCRA',
    ['<img src="../images/menu/edit.png" />','Envio de Oficios a AFIP','../Procesos/OficiosBCRA.asp?Area=PNRT',null,'Oficios a transferir a BCRA'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Oficios pendientes de Confirmacion AFIP','../Procesos/OficiosBCRAEnviadosAFIP.asp?Area=PNRT',null,'Oficios sin respuesta del AFIP'],
    ['<img src="../images/menu/edit.png" />','Oficios confirmados por AFIP','../Procesos/OficiosBCRAConfirmadosAFIP.asp?Area=PNRT',null,'Oficios con respuesta del AFIP'],
    ['<img src="../images/menu/edit.png" />','Oficios con Respuesta del BCRA','../Procesos/OficiosBCRARespuestasBCRA.asp?Area=PNRT',null,'Oficios con respuesta del BCRA'],
    _cmSplit,
    ['<img src="../images/menu/search_text.png" />','Ingreso de confirmacion de AFIP','../Procesos/OficiosBCRAArchivoRecepcion.asp?Area=PNRT',null,'Proceso de archivo que carga las respuesta de AFIP'],
    ['<img src="../images/menu/search_text.png" />','Ingreso de respuestas del BCRA','../Procesos/OficiosBCRAArchivoRespuesta.asp?Area=PNRT',null,'Proceso de archivo con respuestas BCRA'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Lotes Enviados a AFIP','../Procesos/OficiosBCRALotes.asp',null,'Lotes enviados a AFIP'],
    ['<img src="../images/menu/edit.png" />','Lotes Respuesta AFIP','../Procesos/OficiosBCRALotesConfirmacion.asp',null,'Lotes de respuesta de confirmación de AFIP'],
    ['<img src="../images/menu/edit.png" />','Lotes Respuesta BCRA','../Procesos/OficiosBCRALotesRespuesta.asp',null,'Lotes de respuesta de BCRA']
    ]
    ],
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Radicación de Causas','#',null,'Radicación de Causas',
    ['<img width="16px" height="16px" src="../images/menu/blank.png" />','Radicación On Line CFSS','#',null,'',
    ['<img src="../images/menu/edit.png" />','Casos a Iniciar','../Procesos/CasoRadicacion.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Generación de Lote','../Procesos/RadCasos.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    ['<img src="../images/menu/edit.png" />','Resultado del Sorteo','../Procesos/ResSorteo.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Consulta de Casos Radicados','../Procesos/ConsultaDeCasosRadicados.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    ['<img src="../images/menu/edit.png" />','Consulta de Casos Sorteados','../Procesos/ConsultaDeResultados.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    ['<img src="../images/menu/edit.png" />','Consulta de Casos con Error','../Procesos/ConsultaCasosConError.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Consulta de Lotes Radicados (s/Sorteo)','../Procesos/ConsultarLotesRadicados.asp?radica=CFSS',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],
    ['<img src="../images/menu/edit.png" />','Consulta de Lotes Sorteados','../Procesos/ConsultaLotesSorteados.asp?radica=CFSS',null,'Consulta de Casos Sorteados de la Camara Federal Seguridad Social'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Ir al sitio de la Camara de Seg. Soc.','../Procesos/ConsultarSitioCFSS.asp',null,'Casos sin Radicar de la Camara Federal Seguridad Social'],

    ]
    ]
    ],
    [null,'Configuración','#',null,'Administracion',
    ['<img src="../images/menu/edit.png" />','Cache','../Main/Cache.asp',null,'Administrar Cache'],
    ['<img src="../images/menu/edit.png" />','Variables','../Seguridad/AbmVariable.asp',null,'Variables'],
    ['<img src="../images/menu/edit.png" />','Diccionario','../Seguridad/AbmDiccionario.asp',null,'Diccionario'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Database info','../Seguridad/AbmDatabaseInfo.asp',null,'Entorno'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Contadores','../Tablas/AbmContador.asp',null,'Contadores'],
    ['<img src="../images/menu/edit.png" />','Tipos de contador','../Tablas/AbmTipoContador.asp',null,'Tipos de contador'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Archivos','../Tablas/AbmArchivo.asp',null,'Archivos'],
    ['<img src="../images/menu/edit.png" />','Tipos de archivo','../Tablas/AbmTipoArchivo.asp',null,'Tipos de archivo'],
    ['<img src="../images/menu/edit.png" />','Tipos de formato','../Tablas/AbmTipoFormato.asp',null,'Tipos de formato'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Alertas','../Alertas/AbmAlerta.asp',null,'Alertas'],
    ['<img src="../images/menu/edit.png" />','Definición de Alertas','../Alertas/AbmAlertaDefinicion.asp',null,'Definición de Alertas'],
    _cmSplit,
    ['<img src="../images/menu/edit.png" />','Auditoría','../Seguridad/AbmAudit.asp?permiso=tablas audit',null,'Auditoría'],
    ['<img src="../images/menu/edit.png" />','Reglas de auditoría','../Seguridad/AbmAuditRegla.asp',null,'Reglas de auditoría'],
    _cmSplit,
    ['<img src="../images/menu/language.png" />','Tipo de selección de abogados','../Tablas/AbmConfSeleccionAbogado.asp',null,'Configuración de Selección de Abogados'],
    ['<img src="../images/menu/language.png" />','Jerarquia de las oficinas','../Tablas/AbmOficinaAcceso.asp',null,'Configuración de la Jerarquia de las Oficinas']
    ],
    _cmSplit,
    [null,'Oficina Activa','../Tablas/SeleccionOficina.asp',null,'Selección de Oficina Activa'],
    [null,'Salir','../Salir/Salir.asp',null,'Salir']
    ];

cmDraw('mainMenuID', mainMenu, 'hbr', cmThemeOffice, 'ThemeOffice');

    function ShowHideControl( Control ) {
	if (Control == null) {return;}
    if (Control.style.display != 'none') {
        Control.style.display = 'none';
	} else {
        Control.style.display = 'block';
	}
}

    //Redondeo la cantidad ingresada con los decimales pedidos
    function round(cantidad, decimales) {	
	var cantidad = parseFloat(cantidad);
    var decimales = parseFloat(decimales);

    return Math.round(cantidad * Math.pow(10, decimales)) / Math.pow(10, decimales);
}

    function formatNumber( value, decimals ) {
	return parseFloat(value).toFixed( decimals ).toString();
}

    // Validaciones para los KeyPress en los Inputs

    function validKeyEvent( e, nameControl, typeControl ) {
	
	// Valido la Tecla
	return validKey( getEvent(e), nameControl, typeControl );
	
}


    function validKey( e, nameControl, typeControl ) {

	var modo = document.getElementById('Modo').value.toUpperCase();

    if ( modo == 'ALTA' || modo == 'MODIFICACION' ) {
		
		switch(typeControl) {
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
    default:	// Text Free
			
		}
	}
    else if ( modo == 'CONSULTA' || modo == 'BROWSE' ) {
		switch(typeControl) {
		case 'INTEGER':
    case 'FLOAT', 'DECIMAL':
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

	// Sino MOZILLA me suprime la tecla BACKSPC
	if (keyCode >= 32)
    return ( c < '0' || c > '9' ) ? false : true ;

    return true;
	
}

    // Valida INTEGER en el KeyPress para la Busqueda
    function validKeyIntegerSearch(e, nameControl) {
	
	var keyCode = getKeyCode(e);
    var c = String.fromCharCode(keyCode);
    var charValidos;

    // Establezco los Caracteres Validos
    charValidos = '<>=.0123456789';

	// Sino MOZILLA me suprime la tecla BACKSPC
	if (keyCode >= 32)
        return (charValidos.indexOf(c) == -1) ? false : true ;

        return true;
}

        // Valida DECIMAL en el KeyPress
        function validKeyFloat(e, nameControl) {
	
	var keyCode = getKeyCode(e);
        var c = String.fromCharCode(keyCode);

	// Sino MOZILLA me suprime la tecla BACKSPC
	if (keyCode >= 32) {
		if (!(( c >= '0' && c <= '9' ) || c == "."))
        return false;
        else
        if ( c == "."  && document.getElementById(nameControl).value.indexOf('.') != -1 )
        return false
	}

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

        // Sino MOZILLA me suprime la tecla BACKSPC
        if (keyCode < 32)
        return true;


        // Establezco que separador va a usar...
        if ( document.getElementById(nameControl).value.indexOf('-') != -1 )	// Busco lo ingresado anteriormente
        sep = '-';
        else if ( document.getElementById(nameControl).value.indexOf('/') != -1 )
        sep = '/';

        if ( sep == '' && ( c == '/' || c == '-' ) )					// No ingreso nada, tomo el actual
        sep = c;

        // Establezco los Caracteres Validos
        charValidos = '0123456789' + sep;

        if ( charValidos.indexOf(c) == -1 ) // Solo acepto 012345689/-
        return false;
        else {
            len = document.getElementById(nameControl).value.length;
        if ( c == sep ) {	// Controlo que no ponga mas de 2 Separadores
			if ( len > 0 ) {
            pos = document.getElementById(nameControl).value.indexOf(sep);
        if ( pos != -1 ) {
					if ( document.getElementById(nameControl).value.substring(pos + 1, len).indexOf(sep) != -1 )
        return false;
				}
			}	else
        return false;
		}
	}

        return true;
}

        // Valida DATETIME en el KeyPress para la Busqueda
        function validKeyDateTimeSearch(e, nameControl) {
	
	var keyCode = getKeyCode(e);
        var c = String.fromCharCode(keyCode);
        var charValidos;

        // Establezco los Caracteres Validos
        charValidos = '<>=./-0123456789:';

	// Sino MOZILLA me suprime la tecla BACKSPC
	if (keyCode >= 32) {
		if ( charValidos.indexOf(c) == -1 ) // Solo acepto 012345689/-
            return false;
	}

            return true;
}

            // Valida DATETIME en el KeyPress
            function validKeyDateTime(e, nameControl) {

	var keyCode = getKeyCode(e);
            var c = String.fromCharCode(keyCode);
            var pos;
            var sep = '';
            var len;
            var charValidos;

            if (keyCode < 32)
            return true;

            // Establezco que separador va a usar...
            if ( document.getElementById(nameControl).value.indexOf('-') != -1 )	// Busco lo ingresado anteriormente
            sep = '-';
            else if ( document.getElementById(nameControl).value.indexOf('/') != -1 )
            sep = '/';

            if ( sep == '' && ( c == '/' || c == '-' ) )					// No ingreso nada, tomo el actual
            sep = c;

            // Establezco los Caracteres Validos
            charValidos = '0123456789:' + sep;

            if ( charValidos.indexOf(c) == -1 ) // Solo acepto 012345689/-
            return false;
            else {
	
		switch(c) { // El Swith esta por claridad de Programa (se podia unificar)
		case sep:	// Controlo que no ponga mas de 2 Separadores de Fecha
            len = document.getElementById(nameControl).value.length;
			if ( len > 0 ) {		// Controlo que no empice con un Separador
                pos = document.getElementById(nameControl).value.indexOf(sep);
            if ( pos != -1 ) {
					if ( document.getElementById(nameControl).value.substring(pos + 1, len).indexOf(sep) != -1 )
            return false;
				}
			}
            else
            return false;

            case ':':	// Controlo que no ponga mas de 2 Separadores de Hora
            len = document.getElementById(nameControl).value.length;
			if ( len > 0 ) {		// Controlo que no empice con un Separador
                pos = document.getElementById(nameControl).value.indexOf(':');
            if ( pos != -1 ) {
					if ( document.getElementById(nameControl).value.substring(pos + 1, len).indexOf(':') != -1 )
            return false;
				}
			}
            else
            return false;
		}
	}
            return true;
}

            // Valida INTEGER en el KeyPress para la Busqueda
            function validKeyChars( e, nameControl , charValidos ) {

	var modo = document.getElementById('Modo').value.toUpperCase();

            var keyCode = getKeyCode(e);
            var c = String.fromCharCode(keyCode);

            if (keyCode < 32)
            return true;

            if ( modo == 'CONSULTA' || modo == 'BROWSE' )
            charValidos += '<>=.'

                if ( charValidos.indexOf(c) == -1 ) // Solo acepto 012345689/-
                return false;

                return true;
}


                // Validaciones de Formatos de Datos con Expresiones Regulares
                function validFmtDate(valor) {
	var valid = false
                var strFecha

                //Formato #9/#9/9999
                if (/^\d{1, 2}(-|[/])\d{1, 2}(-|[/])\d{4}$/.test(valor)) {
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
  return (/^\d{1, 2}(-|[/])\d{1, 2}(-|[/])\d{4}( )\d{1, 2}(:)\d{1, 2}(:)\d{1, 2}$/.test(valor));
}

                function validFmtDateSearch(valor) {
	// Valido
	// <>=#9/#9/9999
	// #9/#9/9999
	// #9/#9/9999..#9/#9/9999

	var valid = false;

	// Valido <>=#9/#9/9999
                        valid = (/^((<|>|=|>=|<=|<>)\d{1, 2}(-|[/])\d{1, 2}(-|[/])\d{4})$/.test(valor))

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
                                    valid = (/^((<|>|=|>=|<=|<>)(-|[+]){0, 1}(\d)+)$/.test(valor))

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

	return (/^(-|[+]){0, 1}(\d)(.){0, 1}(\d)*$/.test(valor));
}

                                        function validFmtFloatSearch(valor) {
	// Valido
	// <>=#9.#
	// #9.#
	// #9.#..#9.#

	var valid = false;

	// Valido <>=#9.#
                                                valid = (/^((<|>|=|>=|<=|<>)(-|[+]){0, 1}(\d)(.){0, 1}(\d)*)$/.test(valor))

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

    function ConfirmEvent( Message, Accion ) {
	if (window.confirm( Message ) ) {
        FireEvent(Accion);
	}
}

    function FireEvent( Accion, Page ) {
	if (Page != null) {
        document.Formulario.action = Page;
	}
    if (Accion != null) {
        document.Formulario.Accion.value = Accion;
		/*
		// edito el parámetro page, le agreo accion en el querystring
		// ej: page.asp?accion=modificar o page.asp?param=value&accion=modificar
		if (Page != null && Page.indexOf('?accion=')==-1 && Page.indexOf('&accion=')==-1) {
			//Page + = ( Page.indexOf('?')==-1 ? '?' : '&' ) + 'accion=' + Accion;
			if (Page.indexOf('?')==-1) {Page += '?'} else {Page += '&'}
    Page += 'accion=' + Accion
    document.Formulario.action = Page;
		}
    */
	}

    document.Formulario.submit();
}

    function restorePageState() {
var restoreControlFocus;
    var restoreTabFocus;
    var controlFocus;
    var tabFocus;
    var restoreScrollTop;
    var tmp;
    var tabSetName;
    var modo;

    // ControlFocus
    restoreControlFocus = document.getElementById('restoreControlFocus');
    if (restoreControlFocus != null) {
        tmp = 'document.getElementById("' + restoreControlFocus.value + '");'
		controlFocus = eval(tmp);
    restoreControlFocus.value = '';

    if (controlFocus != null) {
        controlFocus.focus();
		}
	}

    // TabFocus
    modo = document.getElementById('Modo');
    tabSetName = document.getElementById('tabSetName');
    restoreTabFocus = document.getElementById('restoreTabFocus');

    if ( (modo!=null) && (modo.value=="Consulta") )//si estoy en consulta que no se acuerde mas
    restoreTabFocus.value=''

    if ( (restoreTabFocus != null)  && (tabSetName !=null )){

        tmp = 'document.getElementById("' + tabSetName.value + "_" + restoreTabFocus.value + '");'
		tabFocus = eval(tmp);

    if (tabFocus != null) {
        tabOnClick(tabSetName.value + "_" + restoreTabFocus.value);
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
	if (parseInt(Pagina) <= 1 && parseInt(document.Formulario.Pagina.value) == 1) {
        alert('Ya se encuentra en la primer página');
    return;
	}
	if ( (parseInt(Pagina) > parseInt(document.Formulario.Pagina.value)) && (document.Formulario.AtEof.value != '0') ) {
        alert('Se encuentra en la última página');
    return;
	}
    document.Formulario.Pagina.value = Pagina;
    FireEvent( 'IrPagina' );
}

    function IdClickValue( value ) {
        document.Formulario.Id.value = value;
}

    function IdClick( Control ) {
        document.Formulario.Id.value = Control.value;
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
	if (rowSelected == null) {
        clearInitial(element); 
	} else {
        rowSelected.className = getRowClass(rowSelected);
	}
    rowSelected=element;
    element.className=selectedClass;
    IdClickValue(id)
}

    function rowOnMouseOver( element ) {
        element.style.cursor = 'pointer';
    if (element.className==selectedClass) {
        rowSelected = element;
	}
    element.className=overClass;
}

    function rowOnMouseOut( element ) {
        element.style.cursor = 'default';
    if (element==rowSelected) {
        element.className = selectedClass;
    return;
	}
    setRowClass( element );
}

    function setRowClass( element ) {
var rowClass = getRowClass( element );
    if (rowClass != '') {
        element.className = rowClass; 
	}
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
        setRowClass(sibling);
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
				if (ctrlKey) {IrPagina(parseInt(document.Formulario.Pagina.value) - 1);}
			}
    case 34: { //PageDown
				if (ctrlKey) {IrPagina(parseInt(document.Formulario.Pagina.value) + 1);}
			}
		} // switch
	} // with
}

    function IdComboClick( Control ) {
var A
    A = Control.value.split("&")
    with (Formulario) {
        Id.value = A[0];
    SelCodigo.value = A[1];
    SelDescripcion.value = A[2];
	}
}

    function IrComboPagina( Control ) {
        IrPagina(Control.options[Control.selectedIndex].value);
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
				if (ctrlKey) {IrPagina(parseInt(document.Formulario.Pagina.value) - 1);}
			}
    case 34: {
				if (ctrlKey) {IrPagina(parseInt(document.Formulario.Pagina.value) + 1);}
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

    function SwapShowControl ( Control ) {
	if (Control==null) return;
    if (Control.style.display == 'none')
    Control.style.display = 'inline';
    else
    Control.style.display = 'none';
	
}

    function HideControl( Control ) {
  if (Control==null) return;
    if (Control.style.display == 'none') return;
    Control.style.display = 'none';
}

    function ShowControl( Control ) {
  if (Control==null) return;
    if (Control.style.display == 'inline') return;
    Control.style.display = 'inline';
}

    function SwapShowControlName ( ControlName ) {
        SwapShowControl(document.getElementById(ControlName));
}

    function ShowControlName( ControlName ) {
        ShowControl(document.getElementById(ControlName));
}

    function HideControlName( ControlName ) {
        HideControl(document.getElementById(ControlName));
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
    if (combo.onchange!=null) {combo.onchange()};

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
    if (combo.onchange!=null) {combo.onchange()};
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
    if (modo=='CONSULTA' || modo=='BROWSE') {combo.className = cssConsulta};
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
        function (cXPathString, xNode) {
            if (!xNode) { xNode = this; }

            var oNSResolver = this.createNSResolver(this.documentElement)

            var aItems = this.evaluate(cXPathString, xNode, oNSResolver,
                XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null)

            var aResult = [];
            for (var i = 0; i < aItems.snapshotLength; i++) {
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
        function (cXPathString, xNode) {
            if (!xNode) { xNode = this; }
            var xItems = this.selectNodes(cXPathString, xNode);
            if (xItems.length > 0) {
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

    function addWindowEvent(nameEvent, handlerEvent) {
	
	if( window.addEventListener ) {
        window.addEventListener(nameEvent, InitPersona, false);
	} else if( document.addEventListener ) {
        document.addEventListener(nameEvent, InitPersona, false);
	} else if( window.attachEvent ) {
        window.attachEvent('on' + nameEvent, InitPersona);
	}
}


    function Left(n){
	if (n <= 0)
    return "";
	else if (n > String(this).length)
    return this;
    else
    return String(this).substring(0,n);
}

    function Right(n){
    if (n <= 0)
    return "";
    else if (n > String(this).length)
    return this;
    else {
       var iLen = String(this).length;
    return String(this).substring(iLen, iLen - n);
    }
}

    // Agrego las funciones a la clase string
    String.prototype.left = Left
    String.prototype.right = Right

    // ----------------------------------------------------------------------
    // Dado un TextArea y un [Text] limita el tamaño en informa el remanente
    // ----------------------------------------------------------------------
    function textCounter(fieldName, cntfieldName, maxlimit) {
var field = $(fieldName)
    var cntfield
	
	if (field.value.length > maxlimit) // if too long...trim it!
    field.value = field.value.substring(0, maxlimit);
    else if (cntfieldName != '') 	// otherwise, update 'characters left' counter
    {
        cntfield = $(cntfieldName)
		cntfield.value = maxlimit - field.value.length;
	}
		
}
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

    if (Titulo == null) {Titulo = 'Ayuda';}
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

    if (Titulo == null) {Titulo = 'Ayuda';}
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
