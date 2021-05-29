/obj/machinery/embedded_controller/radio/airlock/airlock_controller/simple_pump
	name = "Pump Controller"

/obj/machinery/embedded_controller/radio/airlock/airlock_controller/simple_pump/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "SimplePumpController", name, 470, 290, master_ui, state)
		ui.open()

/obj/machinery/embedded_controller/radio/airlock/airlock_controller/simple_pump/ui_data(mob/user)
	var/list/data = list()

	data["chamber_pressure"] = round(program.memory["chamber_sensor_pressure"])
	data["processing"] = program.memory["processing"]

	return data


/obj/machinery/embedded_controller/radio/airlock/airlock_controller/simple_pump/ui_act(action, params)
	if(..())
		return

	add_fingerprint(usr)

	var/list/allowed_actions = list("cycle_ext", "cycle_int", "abort")
	if(action in allowed_actions)	//anti-HTML-hacking checks
		program.receive_user_command(action)

	return TRUE
