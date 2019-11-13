#define IV_DRAW 0
#define IV_INJECT 1

/obj/item/reagent_containers/moa
	name = "m.o.a"
	desc = "(Medbay Oxygen Asissistant) A oxigen assistant that will be sending oxygen to the pacient over a period of time."
	icon = 'icons/hispania/obj/moa.dmi'
	icon_state = "moa_shutdown"
	list_reagents = list("moa_complement" = 10000)
	volume = 10000
	w_class = WEIGHT_CLASS_HUGE
	amount_per_transfer_from_this = 1
	var/status = 3
	var/hitcost = 64
	var/obj/item/stock_parts/cell/bcell = null
	var/mode = IV_INJECT
	var/mob/living/carbon/human/injection_target

/obj/item/reagent_containers/moa/process()
	if(!injection_target)
		end_processing()
		return

	if(get_dist(get_turf(src), get_turf(injection_target)) > 1)
		to_chat(injection_target, "<span class='userdanger'>The [src]'s' needle is ripped out of you!</span>")
		injection_target.apply_damage(12, BRUTE, pick("head"))
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

/obj/item/reagent_containers/moa/attackby(obj/item/W, mob/user, params)
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

/obj/item/reagent_containers/moa/loaded/New() //this one starts with a cell pre-installed.
	..()
	status = 1
	bcell = new/obj/item/stock_parts/cell/high(src)
	update_icon()
	return

/obj/item/reagent_containers/moa/get_cell()
	return bcell

/obj/item/reagent_containers/moa/examine(mob/user)
	. = ..()
	if(bcell)
		. += "<span class='notice'>The M.O.A is [round(bcell.percent())]% charged.</span>"
	if(!bcell)
		. += "<span class='warning'>The M.O.A does not have a power source installed.</span>"

/obj/item/reagent_containers/moa/update_icon()
	if(status == 1)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_active"
	else if(status == 2)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_nocell"
	else if(status == 3)
		icon = 'icons/hispania/obj/moa.dmi'
		icon_state = "moa_shutdown"

/obj/item/reagent_containers/moa/proc/deductcharge(var/chrgdeductamt)
	if(bcell)
		if(bcell.charge < (hitcost+chrgdeductamt))
			status = 3
			playsound(loc, "sparks", 75, 1, -1)
			update_icon()

/obj/item/reagent_containers/moa/emp_act(severity)
	if(bcell)
		deductcharge(100000 / severity)
		playsound(loc, "sparks", 75, 1, -1)
		update_icon()
	..()

/obj/item/reagent_containers/moa/Destroy()
	end_processing()
	return ..()

/obj/item/reagent_containers/moa/pickup(mob/user)
	. = ..()
	update_icon()

/obj/item/reagent_containers/moa/dropped(mob/user)
	..()
	update_icon()

/obj/item/reagent_containers/moa/proc/end_processing()
	injection_target = null
	STOP_PROCESSING(SSobj, src)

/obj/item/reagent_containers/moa/proc/begin_processing(mob/target)
	injection_target = target
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/moa/attack_hand()
	..()
	update_icon()

/obj/item/reagent_containers/moa/attack(mob/living/M, mob/living/user, def_zone)
	return

obj/item/reagent_containers/moa/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(!target.reagents)
		return

	if(isliving(target))
		var/mob/living/L = target
		if(injection_target) // Removing the needle
			if(L != injection_target)
				to_chat(user, "<span class='notice'>[src] is already inserted into [injection_target]'s neck!")
				return
			if(L != user)
				L.visible_message("<span class='danger'>[user] is trying to remove [src]'s needle from [L]'s neck!</span>", \
								"<span class='userdanger'>[user] is trying to remove [src]'s needle from [L]'s neck!</span>")
				if(!do_mob(user, L))
					return
			L.visible_message("<span class='danger'>[user] removes [src]'s needle from [L]'s neck!</span>", \
								"<span class='userdanger'>[user] removes [src]'s needle from [L]'s neck!</span>")
			end_processing()
		else // Inserting the needle
			if(!L.can_inject(user, 1))
				return
			if(amount_per_transfer_from_this > 10) // We only want to be able to transfer 1, 5, or 10 units to people. Higher numbers are for transfering to other containers
				to_chat(user, "<span class='warning'>The IV bag can only be used on someone with a transfer amount of 1, 5 or 10.</span>")
				return
			if(L != user)
				L.visible_message("<span class='danger'>[user] is trying to insert [src]'s needle into [L]'s neck!</span>", \
									"<span class='userdanger'>[user] is trying to insert [src]'s needle into [L]'s neck!</span>")
				if(!do_mob(user, L))
					return
			L.visible_message("<span class='danger'>[user] inserts [src]'s needle into [L]'s neck!</span>", \
									"<span class='userdanger'>[user] inserts [src]'s needle into [L]'s neck!</span>")
			begin_processing(L)