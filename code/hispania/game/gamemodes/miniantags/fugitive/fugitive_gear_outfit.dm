#define WAND_OPEN "Open Door"
#define WAND_BOLT "Toggle Bolts"

/datum/outfit/fugitive
	name = "Fugitive"

	uniform = /obj/item/clothing/under/color/orange/prison/fugitive
	back = /obj/item/storage/backpack/satchel_flat
	belt = /obj/item/storage/fancy/cigarettes/cigpack_syndicate
	gloves = /obj/item/clothing/gloves/color/black/thief
	mask = /obj/item/clothing/mask/cigarette/syndicate
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/sunglasses/big
	pda = /obj/item/pda/chameleon
	id = /obj/item/card/id/prisoner/random
	head = /obj/item/clothing/head/soft/grey

	backpack_contents = list(
		/obj/item/documents/solgov = 1,
		/obj/item/pendrive = 1
		)

	l_hand = /obj/item/clothing/gloves/color/yellow
	r_hand = /obj/item/flashlight/flare/glowstick/red
	l_pocket = /obj/item/lighter/zippo
	r_pocket = /obj/item/door_remote/omni/access_tuner/fugitive

/datum/outfit/fugitive2
	name = "The Fugitive Friend"

	uniform = /obj/item/clothing/under/mafia/vest
	suit = /obj/item/clothing/suit/jacket/miljacket/white
	belt = /obj/item/storage/fancy/cigarettes/cigpack_syndicate
	mask = /obj/item/clothing/mask/cigarette/syndicate
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	head = /obj/item/clothing/head/soft/grey

	l_pocket = /obj/item/lighter/zippo

/datum/outfit/fugitive3
	name = "The Stolen Ship Owner"

	uniform = /obj/item/clothing/under/victsuit/red
	gloves = /obj/item/clothing/gloves/color/black
	belt = /obj/item/storage/belt/fannypack/black
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big

/obj/item/clothing/under/color/orange/prison/fugitive
	desc = "It's standardised SolGOV prisoner-wear. Its suit sensors are broken."
	icon = 'icons/hispania/mob/suit.dmi'
	icon_state = "orange"
	item_state = "orange_s"
	hispania_icon = TRUE
	item_color = "orange_d"
	has_sensor = FALSE
	sensor_mode = SENSOR_OFF

/obj/item/door_remote/omni/access_tuner/fugitive
	name = "first generation access tuner"
	desc = "An old first generation device used for illegally interfacing with doors. Barely working."
	icon = 'icons/hispania/obj/device.dmi'
	icon_state = "hacktool-fug"
	item_state = "hacktool"
	hack_speed = 40
	var/probability = 16.66

/obj/item/door_remote/omni/access_tuner/fugitive/attack_self(mob/user)
	switch(mode)
		if(WAND_OPEN)
			mode = WAND_BOLT
		if(WAND_BOLT)
			mode = WAND_OPEN

	to_chat(user, "<span class='notice'>Now in mode: [mode].</span>")

/obj/item/door_remote/omni/access_tuner/fugitive/afterattack(obj/machinery/door/airlock/D, mob/user)
	if(!istype(D))
		return
	if(busy)
		to_chat(user, "<span class='warning'>[src] is alreading interfacing with a door!</span>")
		return
	flick("hacktool-fug-w",src)
	busy = TRUE
	to_chat(user, "<span class='notice'>[src] is attempting to interface with [D]...</span>")
	if(do_after(user, hack_speed, target = D))
		if(!prob(probability))
			probability += 16.66
			to_chat(user, "<span class='warning'>[src] did a malfunction, try again!</span>")
			flick("hacktool-fug-n",src)
			do_sparks(3, 1, D)
		else
			probability = 16.66
			if(D.is_special)
				to_chat(user, "<span class='danger'>[src] cannot access this kind of door!</span>")
				return
			if(!(D.arePowerSystemsOn()))
				to_chat(user, "<span class='danger'>[D] has no power!</span>")
				return
			if(!D.requiresID())
				to_chat(user, "<span class='danger'>[D]'s ID scan is disabled!</span>")
				return
			if(D.check_access(src.ID))
				D.add_hiddenprint(user)
				flick("hacktool-fug-y",src)
				switch(mode)
					if(WAND_OPEN)
						if(D.density)
							D.open()
						else
							D.close()
					if(WAND_BOLT)
						if(D.locked)
							D.unlock()
						else
							D.lock()
			else
				flick("hacktool-fug-n",src)
				to_chat(user, "<span class='danger'>[src] does not have access to this door.</span>")
	busy = FALSE

/obj/item/pendrive
	name = "special-kind pendrive"
	desc = "Who knows what this thing can do."
	icon = 'icons/hispania/obj/device.dmi'
	lefthand_file = 'icons/hispania/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/hispania/mob/inhands/items_righthand.dmi'
	icon_state = "pendrive"
	item_state = "pendrive"

/obj/item/pendrive/examine(mob/living/M)
	. = ..()
	var/datum/game_mode/fugitive/G = SSticker.mode.eventmode
	if(G.fugitivo)
		. += "<span class='notice'>There's an tag attached to the pendrive. \"Le Owner [G.fugitivo.current]\".</span>"

/obj/item/documents/solgov
	desc = "\"Top Secret\" SolGOV prision documents printed on special copy-protected paper. It is filled with complex diagrams and lists of names, dates and coordinates."
	icon = 'icons/hispania/obj/bureaucracy.dmi'
	icon_state = "docs_sol"

#undef WAND_OPEN
#undef WAND_BOLT
