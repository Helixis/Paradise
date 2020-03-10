/obj/item/b_rig/attackby(obj/item/W as obj, mob/user as mob)

	if(!istype(user,/mob/living)) return 0

	// Pass repair items on to the chestpiece.
	if(chest && (istype(W,/obj/item/stack) || istype(W, /obj/item/weldingtool)))
		return chest.attackby(W,user)

	// Lock or unlock the access panel.
	if(W.GetID())
		if(subverted)
			locked = 0
			to_chat(user, "<span class='danger'>It looks like the locking system has been shorted out.</span>")
			return
		if((!req_access || !req_access.len) && (!req_one_access || !req_one_access.len))
			locked = 0
			to_chat(user, "<span class='danger'>\The [src] doesn't seem to have a locking mechanism.</span>")
			return
		if(security_check_enabled && !src.allowed(user))
			to_chat(user, "<span class='danger'>Access denied.</span>")
			return
		locked = !locked
		to_chat(user, "You [locked ? "lock" : "unlock"] \the [src] access panel.")
		return
	else if(istype(W,/obj/item/crowbar))
		if(!open && locked)
			to_chat(user, "The access panel is locked shut.")
			return
		open = !open
		to_chat(user, "You [open ? "open" : "close"] the access panel.")
		return
	if(open)
		// Air tank.
		if(istype(W,/obj/item/tank)) //Todo, some kind of check for suits without integrated air supplies.

			if(air_supply)
				to_chat(user, "\The [src] already has a tank installed.")
				return

			user.unEquip(W)
			air_supply = W
			W.forceMove(src)
			to_chat(user, "You slot [W] into [src] and tighten the connecting valve.")
			return
		else if(!cell && istype(W,/obj/item/stock_parts/cell))

			to_chat(user, "You jack \the [W] into \the [src]'s battery mount.")
			user.unEquip(W)
			W.forceMove(src)
			src.cell = W
			return
		else if(istype(W,/obj/item/wrench))

			if(!air_supply)
				to_chat(user, "There is not tank to remove.")
				return
			if(user.r_hand && user.l_hand)
				air_supply.forceMove(get_turf(user))
			else
				user.put_in_hands(air_supply)
			to_chat(user, "You detach and remove \the [air_supply].")
			air_supply = null
			return
		else if(istype(W,/obj/item/screwdriver))

			var/list/current_mounts = list()
			if(cell) current_mounts   += "cell"
			var/to_remove = input("Which would you like to modify?") as null|anything in current_mounts
			if(!to_remove)
				return
			if(istype(src.loc,/mob/living/carbon/human) && to_remove != "cell")
				var/mob/living/carbon/human/H = src.loc
				if(H. == src)
					to_chat(user, "You can't remove an installed device while the hardsuit is being worn.")
					return
			switch(to_remove)
				if("cell")
					if(cell)
						to_chat(user, "You detatch \the [cell] from \the [src]'s battery mount.")
						if(user.r_hand && user.l_hand)
							cell.forceMove(get_turf(user))
						else
							user.put_in_hands(cell)
						cell = null
					else
						to_chat(user, "There is nothing loaded in that mount.")
		return
	..()

/obj/item/b_rig/emag_act(var/remaining_charges, var/mob/user)
	if(!subverted)
		req_access.Cut()
		req_one_access.Cut()
		locked = 0
		subverted = 1
		to_chat(user, "<span class='danger'>You short out the access protocol for the suit.</span>")
		return 1
