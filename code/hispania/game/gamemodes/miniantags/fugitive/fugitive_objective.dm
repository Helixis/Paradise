/datum/objective/fug
	explanation_text = "Make contact with the Syndicate."
	martyr_compatible = 1 // Contacto es contacto, no importa si mueras

/datum/objective/fug/docs
	explanation_text = "Bring the SolGov Documents to the safezone."

/datum/objective/fug/docs/check_completion()
	for(var/obj/O in locate(/area/fug_home))
		if(istype(O, /obj/item/documents/solgov))
			return TRUE
	for(var/obj/O in locate(/area/shuttle/fug_shuttle))
		if(istype(O, /obj/item/documents/solgov))
			return TRUE
	return FALSE
