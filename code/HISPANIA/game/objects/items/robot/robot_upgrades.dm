/obj/item/borg/upgrade/rped
	name = "cyborg RPED"
	desc = "A rapid part exchange device for the engineering cyborg."
	icon = 'icons/hispania/obj/storage.dmi'
	icon_state = "borgrped"
	origin_tech = "engineering=4"
	require_module = TRUE
	module_type = /obj/item/robot_module/engineering

/obj/item/borg/upgrade/rped/action(mob/living/silicon/robot/R)
	if(..())
		return

	var/obj/item/storage/part_replacer/cyborg/RPED = locate() in R.module.modules
	if(RPED)
		to_chat(usr, "<span class='warning'>This unit is already equipped with a RPED module.</span>")
		return FALSE

	R.module.modules += new /obj/item/storage/part_replacer/cyborg(R.module)
	R.module.rebuild()
	return TRUE

/obj/item/borg/upgrade/crewpinpointer
	name = "medical cyborg crew pinpointer"
	desc = "A crew pinpointer module for the medical cyborg."
	icon = 'icons/obj/device.dmi'
	icon_state = "pinoff_crew"
	origin_tech = "engineering=2;biotech=1"
	require_module = TRUE
	module_type = /obj/item/robot_module/medical

/obj/item/borg/upgrade/crewpinpointer/action(mob/living/silicon/robot/R)
	if(..())
		return

	var/obj/item/pinpointer/crew/PP = locate() in R.module.modules
	if(PP)
		to_chat(usr, "<span class='warning'>This unit is already equipped with a crew pinpointer module.</span>")
		return FALSE

	R.module.modules += new /obj/item/pinpointer/crew(R.module)
	R.module.rebuild()
	return TRUE

