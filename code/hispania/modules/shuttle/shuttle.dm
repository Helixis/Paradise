/obj/machinery/computer/shuttle/tsf
	name = "TSF Shuttle Control"
	desc = "Used to control the Trans Solar Federation Shuttle."
	circuit = /obj/item/circuitboard/tsf
	shuttleId = "tsf"
	possible_destinations = "tsf_away;tsf_home"

/obj/machinery/computer/shuttle/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/mineral/plasma))
		if(fuel >= fuel_limit)
			visible_message("[src] the fuel system its full")
			return
		var/obj/item/stack/sheet/S = I
		S.use(1)
		fuel = fuel + 50
		update_icon()
		to_chat(user, "<span class='notice'>You insert [I] in [src], and the console converts the plasma into fuel.</span>")
	else
		return ..()

/obj/machinery/computer/shuttle/update_icon()
	if(fuel == fuel_limit/4  || fuel > 0)
		icon_state = "console_1"
	if(fuel == fuel_limit/2)
		icon_state = "console_2"
	if(fuel > fuel_limit/2 && fuel < fuel_limit)
		icon_state = "console_3"
	if(fuel == fuel_limit)
		icon_state = "console_4"
	if(fuel == 0)
		icon_state = "console_0"

/obj/machinery/computer/shuttle/Initialize()
	fuel = fuel_limit
	..()
