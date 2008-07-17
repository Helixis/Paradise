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
