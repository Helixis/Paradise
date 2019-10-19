#define IV_TAKING 0
#define IV_INJECTING 1

/obj/machinery/iv_drip/moa
	name = "\improper IV drip"
	icon = 'icons/hispania/obj/moa_drip.dmi'
	icon_state = "stand"
	anchored = FALSE
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	var/obj/item/reagent_containers/iv_bag/bag/moa = null

/obj/machinery/iv_drip/moa/update_icon()
	cut_overlays()

	if(bag)
		add_overlay("hangingbag")
		if(bag.reagents.total_volume)
			var/image/filling = image('icons/hispania/obj/moa_drip.dmi', src, "hangingbag-fluid")
			add_overlay(filling)

/obj/machinery/iv_drip/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/iv_bag/moa))
		if(bag)
			to_chat(user, "<span class='warning'>[src] already has an m.o.a!</span>")
			return
		if(!user.drop_item())
			return

		I.forceMove(src)
		bag = I
		to_chat(user, "<span class='notice'>You attach [I] to [src].</span>")
		update_icon()
	else if (bag && istype(I, /obj/item/reagent_containers))
		bag.attackby(I)
		I.afterattack(bag, usr, TRUE)
		update_icon()
	else
		return ..()

#undef IV_TAKING
#undef IV_INJECTING