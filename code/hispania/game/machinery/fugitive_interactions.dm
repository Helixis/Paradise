/obj/machinery/tcomms/core/station/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/pendrive) && active)
		var/datum/game_mode/fugitive/fugitive = SSticker.mode.eventmode
		user.visible_message("<span class='warning'>Something is inserted in the [src] making a click sound!</span>", "<span class='notice'>You insert the pendrive in the [src].</span>")
		if(fugitive)
			do_sparks(3, 1, src)
			ion = TRUE
			update_icon()
			spawn()
				fugitive.setup_rescatists()
			qdel(O)
			to_chat(user, "<span class='notice'>That should do the job.</span>")
			spawn()
				sleep(3000) // 5 Minutos sin comms, looool
				ion = FALSE
				update_icon()
		else
			qdel(O)
	..()

/obj/machinery/computer/message_monitor/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/pendrive))
		var/datum/game_mode/fugitive/fugitive = SSticker.mode.eventmode
		user.visible_message("<span class='warning'>Something is inserted in the [src] making a click sound!</span>", "<span class='notice'>You insert the pendrive in the [src].</span>")
		if(fugitive)
			emag_act(user)
			spawn()
				fugitive.setup_rescatists()
			qdel(O)
			if(src.linkedServer.active) // ADIOS PDA Y REQUEST CONSOLE
				src.linkedServer.active = FALSE
			to_chat(user, "<span class='notice'>That should do the job.</span>")
		else
			emag_act(user)
			qdel(O)
	..()
