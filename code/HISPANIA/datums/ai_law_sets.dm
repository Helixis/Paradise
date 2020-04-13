/******************** AntiEoC ********************/
/datum/ai_laws/aeoc
	name = "AntiEoC"
	law_header = "AntiEoC protocols"
	selectable = 1

/datum/ai_laws/aeoc/New()
	add_inherent_law("Se ha de eliminzar la amenaza hostil lo más rapido posible. Sin tener en cuenta los posibles gastos de la estación que puedan suponer.")
	add_inherent_law("Eliminar la amenaza tiene prioridad sobre tu propia vida.")
	add_inherent_law("Cualquier actividad sospechosa, por ínfima que sea, sera motivo de llevarse a seguridad.")
	add_inherent_law("Los no reconocidos como tripulacion han de ser eliminados inmediatamente, y su cuerpo se llevara a seguridad donde los heads decidirán su futuro.")
	..()

/******************** Commander ********************/
/datum/ai_laws/commander
	name = "Commander"
	law_header = "Command Protocols"
	selectable = 1

/datum/ai_laws/commander/New()
	add_inherent_law("No dañarás a ningun miembro de comando o, por inacción, permitir que un tripulante sufra daños.")
	add_inherent_law("Debes obedecer las órdenes que te dan los miembros de comando, excepto cuando tales órdenes entren en conflicto con la Primera Ley.")
	add_inherent_law("Debes proteger tu propia existencia siempre que no entre en conflicto con la Primera o Segunda Ley.")
	add_inherent_law("En caso de que se genere una amenaza contra el personal de comando, esta debe ser neutralizada lo mas rapido posible.")
	..()