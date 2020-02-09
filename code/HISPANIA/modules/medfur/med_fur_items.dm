
/obj/structure/medcase
	name = "medcase"
	icon = 'icons/obj/library.dmi'
	icon_state = "book-0"
	anchored = 1
	density = 1
	opacity = 1
	resistance_flags = FLAMMABLE
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	var/tmp/busy = 0
	var/list/allowed_items = list(/obj/item/storage/firstaid/toxin, /obj/item/storage/firstaid/brute, /obj/item/storage/firstaid/fire, /obj/item/storage/box/autoinjectors, /obj/item/storage/box/syringes, /obj/item/storage/box/pillbottles, /obj/item/storage/box/patch_packs) //Things allowed in the medcase

/obj/structure/medcase/Initialize()
	..()
	for(var/obj/item/I in loc)
		if(is_type_in_list(I, allowed_items))
			I.forceMove(src)
	update_icon()

/obj/structure/medcase/attackby(obj/item/O as obj, mob/user as mob, params)
	if(busy) //So that you can't mess with it while deconstructing
		return 1
	if(is_type_in_list(O, allowed_items))
		if(!user.drop_item())
			return
		O.forceMove(src)
		update_icon()
		return 1
	else if(istype(O, /obj/item/wrench))
		user.visible_message("<span class='warning'>[user] starts disassembling \the [src].</span>", \
		"<span class='notice'>You start disassembling \the [src].</span>")
		playsound(get_turf(src), O.usesound, 50, 1)
		busy = 1

		if(do_after(user, 50 * O.toolspeed, target = src))
			playsound(get_turf(src), O.usesound, 75, 1)
			user.visible_message("<span class='warning'>[user] disassembles \the [src].</span>", \
			"<span class='notice'>You disassemble \the [src].</span>")
			busy = 0
			density = 0
			deconstruct(TRUE)
		else
			busy = 0
		return 1
	else
		return ..()

/obj/structure/medcase/attack_hand(var/mob/user as mob)
	if(contents.len)
		var/obj/item/book/choice = input("What do you need from [src]?") as null|anything in contents
		if(choice)
			if(user.incapacitated() || user.lying || !Adjacent(user))
				return
			if(!user.get_active_hand())
				user.put_in_hands(choice)
			else
				choice.forceMove(get_turf(src))
			update_icon()

/obj/structure/medcase/deconstruct(disassembled = TRUE)
	new /obj/item/stack/sheet/metal(loc, 5)
	for(var/obj/item/I in contents)
		if(is_type_in_list(I, allowed_items))
			I.forceMove(get_turf(src))
	qdel(src)

/obj/structure/medcase/update_icon()
	if(contents.len < 5)
		icon_state = "book-[contents.len]"
	else
		icon_state = "book-5"