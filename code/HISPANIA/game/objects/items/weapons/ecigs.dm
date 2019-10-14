/obj/item/clothing/mask/cigarette/ecig
	name = "electronic cigarette"
	desc = "Device with modern approach to smoking."
	icon = 'icons/hispania/obj/clothing/masks.dmi'
	var/active = 0
	var/obj/item/stock_parts/cell/cigcell
	var/cartridge_type = /obj/item/reagent_containers/ecig_cartridge/med_nicotine
	var/obj/item/reagent_containers/ecig_cartridge/ec_cartridge
	var/cell_type = /obj/item/stock_parts/cell/device/standard
	w_class = WEIGHT_CLASS_TINY
	slot_flags = SLOT_EARS | SLOT_MASK
	attack_verb = list("attacked", "poked", "battered")
	body_parts_covered = 0
	var/brightness_on = 1
	chem_volume = 0 //ecig has no storage on its own but has reagent container created by parent obj
	item_state = "ecigoff"
	var/icon_empty
	var/power_usage = 0.25
	var/idle = 0
	var/idle_treshold = 30
	var/idletaste = 10
	var/idletaste_treshold = 10
	hispania_icon = TRUE
	sprite_sheets = list(
		"Human" = 'icons/hispania/mob//mask.dmi',
		"Unathi" = 'icons/hispania/mob//mask.dmi',
		"Tajaran" = 'icons/hispania/mob//mask.dmi',
		"Skrell" = 'icons/hispania/mob//mask.dmi',
		"Vox" = 'icons/hispania/mob//mask.dmi',
		"Diona" = 'icons/hispania/mob//mask.dmi',
		"Drask" = 'icons/hispania/mob//mask.dmi',
		"Grey" = 'icons/hispania/mob//mask.dmi',
		"Machine"= 'icons/hispania/mob//mask.dmi'
		)

/obj/item/clothing/mask/cigarette/ecig/New()
	..()
	if(ispath(cell_type))
		cigcell = new cell_type
	ec_cartridge = new cartridge_type(src)

/obj/item/clothing/mask/cigarette/ecig/get_cell()
	return cigcell

/obj/item/clothing/mask/cigarette/ecig/simple
	name = "cheap electronic cigarette"
	desc = "A cheap Lucky 1337 electronic cigarette, styled like a traditional cigarette."
	icon_state = "ccigoff"
	icon_off = "ccigoff"
	icon_empty = "ccigoff"
	icon_on = "ccigon"

/obj/item/clothing/mask/cigarette/ecig/simple/examine(mob/user)
	..()
	if(ec_cartridge)
		to_chat(user,"<span class='notice'>There are [round(ec_cartridge.reagents.total_volume, 1)] units of liquid remaining.</span>")
	else
		to_chat(user,"<span class='notice'>There's no cartridge connected.</span>")

/obj/item/clothing/mask/cigarette/ecig/util
	name = "electronic cigarette"
	desc = "A popular utilitarian model electronic cigarette, the ONI-55. Comes in a variety of colors."
	icon_state = "ecigoff1"
	icon_off = "ecigoff1"
	icon_empty = "ecigoff1"
	icon_on = "ecigon"
	cell_type = /obj/item/stock_parts/cell/device/high //enough for four cartridges

obj/item/clothing/mask/cigarette/ecig/util/examine(mob/user)
	..()
	if(ec_cartridge)
		to_chat(user,"<span class='notice'>There are [round(ec_cartridge.reagents.total_volume, 1)] units of liquid remaining.</span>")
	else
		to_chat(user,"<span class='notice'>There's no cartridge connected.</span>")
	if(cigcell)
		to_chat(user,"<span class='notice'>The power meter shows that there's about [round(cigcell.percent(), 25)]% power remaining.</span>")
	else
		to_chat(user,"<span class='notice'>There's no cartridge connected.</span>")

/obj/item/clothing/mask/cigarette/ecig/deluxe
	name = "deluxe electronic cigarette"
	desc = "A premium model eGavana MK3 electronic cigarette, shaped like a cigar."
	icon_state = "pcigoff1"
	icon_off = "pcigoff1"
	icon_empty = "pcigoff2"
	icon_on = "pcigon"
	cell_type = /obj/item/stock_parts/cell/device/high //enough for four catridges

/obj/item/clothing/mask/cigarette/ecig/deluxe/examine(mob/user)
	..()
	if(ec_cartridge)
		to_chat(user,"<span class='notice'>There are [round(ec_cartridge.reagents.total_volume, 1)] units of liquid remaining.</span>")
	else
		to_chat(user,"<span class='notice'>There's no cartridge connected.</span>")
	if(cigcell)
		to_chat(user,"<span class='notice'>The power meter shows that there's about [round(cigcell.percent(), 1)]% power remaining.</span>")
	else
		to_chat(user,"<span class='notice'>There's no cartridge connected.</span>")

/obj/item/clothing/mask/cigarette/ecig/proc/Deactivate()
	active = 0
	idletaste = 10
	STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/clothing/mask/cigarette/ecig/process()
	if(!cigcell)
		Deactivate()
		return
	if(!ec_cartridge)
		Deactivate()
		return

	if(idle >= idle_treshold) //idle too long -> automatic shut down
		idle = 0
		visible_message("<span class='notice'>\The [src] powers down automatically.</span>", null, 2)
		Deactivate()
		return

	idle++

	if(ishuman(loc))
		var/mob/living/carbon/human/C = loc

		if (!active || !ec_cartridge || !ec_cartridge.reagents.total_volume)//no cartridge
			if(!ec_cartridge.reagents.total_volume)
				to_chat(C, "<span class='notice'>There's no liquid left in \the [src], so you shut it down.</span>")
			Deactivate()
			return

		if (src == C.wear_mask && C.check_has_mouth()) //transfer, but only when not disabled
			idle = 0
			//here we'll reduce battery by usage, and check powerlevel - you only use batery while smoking
			if(cigcell.charge < power_usage) //if this passes, there's not enough power in the battery
				Deactivate()
				to_chat(C,"<span class='notice'>\The [src]'s power meter flashes a low battery warning and shuts down.</span>")
				return
			cigcell.use(power_usage)
			idletaste++
			for (var/datum/reagent/R in ec_cartridge.reagents.reagent_list)
				ec_cartridge.reagents.trans_id_to(C, R.id, max(REAGENTS_METABOLISM / (2 * ec_cartridge.reagents.reagent_list.len), 0.05)) //transfer at least .1 of each chem
				if(idletaste >= idletaste_treshold)
					if(ec_cartridge.reagents.reagent_list.len > 1 && R.id != "water") //no saboreas el agua si hay más ingredientes
						to_chat(C, "<span class='notice'>You can taste [R.taste_description].</span>")
			if(idletaste >= idletaste_treshold)
				idletaste = 0

/obj/item/clothing/mask/cigarette/ecig/update_icon()
	if (active)
		item_state = icon_on
		icon_state = icon_on
		set_light(0.6, 0.5, brightness_on)
	else if (ec_cartridge)
		set_light(0)
		item_state = icon_off
		icon_state = icon_off
	else
		icon_state = icon_empty
		item_state = icon_empty
		set_light(0)
	if(ismob(loc))
		var/mob/living/M = loc
		M.update_inv_wear_mask(0)
		M.update_inv_l_hand(0)
		M.update_inv_r_hand(1)


/obj/item/clothing/mask/cigarette/ecig/attackby(var/obj/item/I, var/mob/user as mob)
	if(istype(I, /obj/item/reagent_containers/ecig_cartridge))
		if (ec_cartridge)//can't add second one
			to_chat(user, "<span class='notice'>A cartridge has already been installed.</span> ")
		else if(user.unEquip(I, src))//fits in new one
			ec_cartridge = I
			update_icon()
			to_chat(user, "<span class='notice'>You insert \the [I] into \the [src].</span> ")

	if(istype(I, /obj/item/screwdriver))
		if(cigcell) //if contains powercell
			cigcell.update_icon()
			cigcell.loc = get_turf(src.loc)
			cigcell = null
			to_chat(user, "<span class='notice'>You remove \the [cigcell] from \the [src].</span>")
		else //does not contains cell
			to_chat(user, "<span class='notice'>There's no battery in \the [src].</span>")

	if(istype(I, /obj/item/stock_parts/cell/device))
		if(!cigcell && user.unEquip(I))
			I.forceMove(src)
			cigcell = I
			to_chat(user, "<span class='notice'>You install \the [cigcell] into \the [src].</span>")
			update_icon()
		else
			to_chat(user, "<span class='notice'>\The [src] already has a battery installed.</span>")


/obj/item/clothing/mask/cigarette/ecig/attack_self(mob/user as mob)
	if (active)
		Deactivate()
		to_chat(user, "<span class='notice'>You turn off \the [src].</span> ")
	else
		if(cigcell)
			if (!ec_cartridge)
				to_chat(user, "<span class='notice'>You can't use \the [src] with no cartridge installed!</span> ")
				return
			else if(!ec_cartridge.reagents.total_volume)
				to_chat(user, "<span class='notice'>You can't use \the [src] with no liquid left!</span> ")
				return
			else if(cigcell.charge < power_usage)
				to_chat(user, "<span class='notice'>\The [src]'s power meter flashes a low battery warning and refuses to operate.</span> ")
				return
			active=1
			START_PROCESSING(SSobj, src)
			to_chat(user, "<span class='notice'>You turn on \the [src].</span> ")
			update_icon()

		else
			to_chat(user, "<span class='warning'>\The [src] does not have a battery installed.</span>")

/obj/item/clothing/mask/cigarette/ecig/attack_hand(mob/user as mob)//eject cartridge
	if(user.get_inactive_hand() == src)//if being hold
		if (ec_cartridge)
			active=0
			user.put_in_hands(ec_cartridge)
			to_chat(user, "<span class='notice'>You remove \the [ec_cartridge] from \the [src].</span> ")
			ec_cartridge = null
			update_icon()
	else
		..()

/obj/item/reagent_containers/ecig_cartridge
	name = "tobacco flavour cartridge"
	desc = "A small metal cartridge, used with electronic cigarettes, which contains an atomizing coil and a solution to be atomized."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/hispania/obj/ecig.dmi'
	icon_state = "ecartridge"
	materials = list(MAT_ALUMINIUM = 50, MAT_GLASS = 10)
	volume = 20
	container_type = INJECTABLE

/obj/item/reagent_containers/ecig_cartridge/examine(mob/user as mob)//to see how much left
	. = ..()
	.  += "<span class='notice'>The cartridge has [reagents.total_volume] units of liquid remaining.</span> "

//flavours
/obj/item/reagent_containers/ecig_cartridge/med_nicotine
	name = "tobacco flavour cartridge"
	desc =  "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its tobacco flavored."
/obj/item/reagent_containers/ecig_cartridge/med_nicotine/New()
	..()
	reagents.add_reagent("nicotine", 5)
	reagents.add_reagent("water", 15)

/obj/item/reagent_containers/ecig_cartridge/high_nicotine
	name = "high nicotine tobacco flavour cartridge"
	desc = "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its tobacco flavored, with extra nicotine."
/obj/item/reagent_containers/ecig_cartridge/high_nicotine/New()
	..()
	reagents.add_reagent("nicotine", 10)
	reagents.add_reagent("water", 10)

/obj/item/reagent_containers/ecig_cartridge/orange
	name = "orange flavour cartridge"
	desc = "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its orange flavored."
/obj/item/reagent_containers/ecig_cartridge/orange/New()
	..()
	reagents.add_reagent("nicotine", 5)
	reagents.add_reagent("water", 10)
	reagents.add_reagent("orangejuice", 5)

/obj/item/reagent_containers/ecig_cartridge/watermelon
	name = "watermelon flavour cartridge"
	desc = "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its watermelon flavored."
/obj/item/reagent_containers/ecig_cartridge/watermelon/New()
	..()
	reagents.add_reagent("nicotine", 5)
	reagents.add_reagent("water", 10)
	reagents.add_reagent("watermelonjuice", 5)

/obj/item/reagent_containers/ecig_cartridge/grape
	name = "grape flavour cartridge"
	desc = "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its grape flavored."
/obj/item/reagent_containers/ecig_cartridge/grape/New()
	..()
	reagents.add_reagent("nicotine", 5)
	reagents.add_reagent("water", 10)
	reagents.add_reagent("grapejuice", 5)

/obj/item/reagent_containers/ecig_cartridge/coffee
	name = "coffee flavour cartridge"
	desc = "A small metal cartridge which contains an atomizing coil and a solution to be atomized. The label says its coffee flavored."
/obj/item/reagent_containers/ecig_cartridge/coffee/New()
	..()
	reagents.add_reagent("nicotine", 5)
	reagents.add_reagent("water", 10)
	reagents.add_reagent("coffee", 5)