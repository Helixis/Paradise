/obj/item/reagent_containers/iv_bag/moa
	name = "m.o.a"
	desc = "(Medbay Oxygen Asissistant) A oxigen assistant that will be sending oxygen to the pacient over a period of time."
	icon = 'icons/hispania/obj/moa.dmi'
	icon_state = "moa_shutdown"
	list_reagents = list("moa_complement" = 10000)
	volume = 10000
	w_class = WEIGHT_CLASS_HUGE
	var/status = 3
	var/hitcost = 25
	var/obj/item/stock_parts/cell/high/bcell = null

/obj/item/reagent_containers/iv_bag/moa/process()
	if(!injection_target)
		end_processing()
		return

	if(get_dist(get_turf(src), get_turf(injection_target)) > 1)
		to_chat(injection_target, "<span class='userdanger'>The [src]'s' needle is ripped out of you!</span>")
		injection_target.apply_damage(10, BRUTE, pick("r_arm", "l_arm"))
		end_processing()
		return

	if(status >= 2)
		playsound(loc, "sound/machines/buzz-sigh.ogg", 75, 1, -1)
		return
	else
		if(reagents.total_volume && status == 1) // Injecting
			var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1) 	//The amount of reagents we'll transfer to the person
			reagents.reaction(injection_target, INGEST, fraction) 	//React the amount we're transfering.
			reagents.trans_to(injection_target, amount_per_transfer_from_this)
			deductcharge(hitcost)
			bcell.use(hitcost)
			update_icon()

/obj/item/reagent_containers/iv_bag/attack_self(mob/user)
	..()

/obj/item/reagent_containers/iv_bag/moa/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/C = W
		if(bcell)
			to_chat(user, "<span class='notice'>[src] already has a cell.</span>")
		else
			if(C.maxcharge < hitcost)
				to_chat(user, "<span class='notice'>[src] requires a higher capacity cell.</span>")
				return
			if(!user.unEquip(W))
				return
			W.loc = src
			bcell = W
			to_chat(user, "<span class='notice'>You install a cell in [src].</span>")
			status = 1
			update_icon()

	else if(istype(W, /obj/item/screwdriver))
		if(bcell)
			bcell.loc = get_turf(src.loc)
			bcell = null
			to_chat(user, "<span class='notice'>You remove the cell from the [src].</span>")
			status = 2
			update_icon()
			return
		..()
	return

/obj/item/reagent_containers/iv_bag/moa/loaded/New() //this one starts with a cell pre-installed.
	..()
	status = 1
	bcell = new/obj/item/stock_parts/cell/high(src)
	update_icon()
	return

/obj/item/reagent_containers/iv_bag/moa/get_cell()
	return bcell

/obj/item/reagent_containers/iv_bag/moa/examine(mob/user)
	. = ..()
	if(bcell)
		. += "<span class='notice'>The M.O.A is [round(bcell.percent())]% charged.</span>"
	if(!bcell)
		. += "<span class='warning'>The M.O.A does not have a power source installed.</span>"

/obj/item/reagent_containers/iv_bag/moa/update_icon()
	if(status == 1)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_active"
	else if(status == 2)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_nocell"
	else if(status == 3)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_shutdown"

/obj/item/reagent_containers/iv_bag/moa/proc/deductcharge(var/chrgdeductamt)
	if(bcell)
		if(bcell.charge < (hitcost+chrgdeductamt)) // If after the deduction the baton doesn't have enough charge for a stun hit it turns off.
			status = 3
			playsound(loc, "sparks", 75, 1, -1)
			update_icon()

/obj/item/reagent_containers/iv_bag/moa/emp_act(severity)
	if(bcell)
		deductcharge(100000 / severity)
		playsound(loc, "sparks", 75, 1, -1)
	..()
