/obj/item/mounted/frame/bell_frame
	name = "bell frame"
	desc = "Used for building bells."
	icon = 'icons/hispania/obj/door_bells.dmi'
	icon_state = "bell_frame"
	mount_reqs = list("simfloor")

/obj/item/mounted/frame/bell_frame/do_build(turf/on_wall, mob/user)
	to_chat(user, "You begin attaching [src] to \the [on_wall].")
	playsound(get_turf(src), 'sound/machines/click.ogg', 75, 1)
	var/constrdir = user.dir
	var/constrloc = get_turf(user)
	var/obj/machinery/big_bell/newbell
	if(!do_after(user, 30, target = on_wall))
		return
	newbell = new /obj/machinery/big_bell(constrloc)
	newbell.dir = constrdir
	user.visible_message("[user] attaches \the [src] to \the [on_wall].", \
		"You attach \the [src] to \the [on_wall].")
	qdel(src)

/obj/machinery/big_bell
	name = "big door bell"
	desc = "A light fixture under construction."
	icon = 'icons/hispania/obj/door_bells.dmi'
	icon_state = "big_bell"
	anchored = TRUE
	layer = 5
	max_integrity = 200
	armor = list("melee" = 50, "bullet" = 10, "laser" = 10, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50)

/obj/machinery/big_bell/attack_hand(mob/user as mob)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/external/temp = H.bodyparts_by_name["r_hand"]
		if(H.hand)
			temp = H.bodyparts_by_name["l_hand"]
		if(temp && !temp.is_usable())
			to_chat(H, "<span class='notice'>You try to move your [temp.name], but cannot!</span>")
			return
	if(anchored)
		playsound(src, 'sound/misc/ding.ogg', 60)
	add_fingerprint(user)
	return

/obj/machinery/big_bell/wrench_act(mob/living/user, obj/item/I)
	. = TRUE
	to_chat(user, "<span class='notice'>You begin to dismantle [src].</span>")
	if(!I.use_tool(src, user, 30, volume = I.tool_volume))
		return
	new /obj/item/stack/sheet/plasteel(get_turf(loc), 2)
	TOOL_DISMANTLE_SUCCESS_MESSAGE
	qdel(src)

/obj/machinery/big_bell/deconstruct(disassembled = TRUE)
	if(!(flags & NODECONSTRUCT))
		new /obj/item/stack/sheet/plasteel(loc, 2)
	qdel(src)
