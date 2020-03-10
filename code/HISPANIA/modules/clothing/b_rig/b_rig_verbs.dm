/obj/item/b_rig/proc/toggle_helmet()
	set name = "Toggle Helmet"
	set desc = "Deploys or retracts your helmet."
	set category = "Hardsuit"
	set src = usr.contents
	if(!istype(wearer) || !wearer.belt == src)
		to_chat(usr, "<span class='warning'>The hardsuit is not being worn.</span>")
		return
	if(!check_suit_access(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	toggle_piece("helmet", usr)

/obj/item/b_rig/proc/toggle_chest()
	set name = "Toggle Chestpiece"
	set desc = "Deploys or retracts your chestpiece."
	set category = "Hardsuit"
	set src = usr.contents
	if(!check_suit_access(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	toggle_piece("chest", usr)

/obj/item/b_rig/proc/toggle_gauntlets()
	set name = "Toggle Gauntlets"
	set desc = "Deploys or retracts your gauntlets."
	set category = "Hardsuit"
	set src = usr.contents
	if(!istype(wearer) || !wearer.belt == src)
		to_chat(usr, "<span class='warning'>The hardsuit is not being worn.</span>")
		return
	if(!check_suit_access(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	toggle_piece("gauntlets", usr)

/obj/item/b_rig/proc/toggle_boots()
	set name = "Toggle Boots"
	set desc = "Deploys or retracts your boots."
	set category = "Hardsuit"
	set src = usr.contents
	if(!istype(wearer) || !wearer.belt == src)
		to_chat(usr, "<span class='warning'>The hardsuit is not being worn.</span>")
		return
	if(!check_suit_access(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	toggle_piece("boots", usr)

/obj/item/b_rig/verb/deploy_suit()
	set name = "Deploy Hardsuit"
	set desc = "Deploys helmet, gloves and boots all at once."
	set category = "Hardsuit"
	set src = usr.contents
	if(!istype(wearer) || !wearer.belt == src)
		to_chat(usr, "<span class='warning'>The hardsuit is not being worn.</span>")
		return
	if(!check_suit_access(usr))
		return
	if(!check_power_cost(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	deploy(wearer, usr)

/obj/item/b_rig/verb/toggle_seals_verb()
	set name = "Toggle Hardsuit Seals"
	set desc = "Seals or unseals your rig."
	set category = "Hardsuit"
	set src = usr.contents
	if(!istype(wearer) || !wearer.belt == src)
		to_chat(usr, "<span class='warning'>The hardsuit is not being worn.</span>")
		return
	if(!check_suit_access(usr))
		return
	var/mob/M = usr
	if(M.incapacitated())
		return
	if(flags & NODROP)
		unseal(usr)
	else
		seal(usr)