/obj/machinery/relwartic
	name = "\improper father relic"
	desc = "You should not be seeing this."
	icon = 'icons/hispania/obj/machines/wartic.dmi'
	icon_state = "ar134_active"
	anchored = 1
	density = 1
	max_integrity = 500
	var/delay = 60
	var/warticst = TRUE
	var/on_icon = "ar134_active"
	var/off_icon = "ar134"
	light_range = 6
	light_power = 6.5
	light_color = LIGHT_COLOR_ORANGE
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 70)

/obj/machinery/relwartic/wrench_act(mob/user, obj/item/I)
	. = TRUE
	if(warticst == FALSE)
		if(!I.use_tool(src, user, 0, volume = 0))
			return
		default_unfasten_wrench(user, I, time = 60)
	else
		to_chat(user, "<span class='notice'>The [src]'s seems to be active, try to turn it off whith your analyzer.</span>")

/obj/machinery/relwartic/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/analyzer))
		to_chat(user, "<span class='notice'>Analyzing... [src]'s</span>")
		to_chat(user, "<span class='notice'>The [src]'s seems to be under control, now you can place it somewhere else.</span>")
		light_range = 1
		light_power = 1.5
		warticst = FALSE