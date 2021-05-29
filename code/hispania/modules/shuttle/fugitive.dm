/obj/machinery/computer/shuttle/fug
	name = "White Death Shuttle Console"
	desc = "Used to call and send the SIT shuttle."
	icon = 'icons/hispania/obj/computer.dmi'
	icon_screen = "fug_shuttle"
	icon_keyboard = "fug_key"
	req_access = null
	bubble_icon = "syndibot"
	shuttleId = "fug_ship"
	possible_destinations = "homefug;fug_custom"
	resistance_flags = INDESTRUCTIBLE

/obj/machinery/computer/camera_advanced/shuttle_docker/fug
	name = "White Death shuttle navigation computer"
	desc = "Used to designate a precise transit location for the White Death shuttle."
	req_access = null
	icon = 'icons/hispania/obj/computer.dmi'
	icon_screen = "fug_move"
	icon_keyboard = "fug_key"
	shuttleId = "fug_ship"
	shuttlePortId = "fug_custom"
	bubble_icon = "syndibot"
	view_range = 13
	x_offset = -5
	y_offset = -4
