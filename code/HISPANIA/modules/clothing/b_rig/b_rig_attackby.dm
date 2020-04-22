/obj/item/b_rig/attackby(obj/item/W as obj, mob/user as mob)

	if(!istype(user,/mob/living))
		return 0
	..()
