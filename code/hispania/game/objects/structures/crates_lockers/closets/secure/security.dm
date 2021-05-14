/obj/structure/closet/secure_closet/magistrate/New()
	..()
	new /obj/item/gun/energy/disabler/magistrate(src)

/obj/structure/closet/secure_closet/detective/New()
	..()
	new /obj/item/storage/belt/security(src)
	new /obj/item/taperoll(src)

/obj/structure/closet/secure_closet/brigdoc/New()
	..()
	new /obj/item/storage/box/autoinjectors(src)
	new /obj/item/handheld_defibrillator(src)
	new /obj/item/clothing/gloves/color/latex/nitrile(src)
	new /obj/item/storage/pill_bottle( src )
	new /obj/item/storage/pill_bottle/patch_pack(src)

/obj/structure/closet/secure_closet/captains/New()
	..()
	new /obj/item/whistle(src)

/obj/structure/closet/secure_closet/hop/New()
	..()
	new /obj/item/whistle(src)

/obj/structure/closet/secure_closet/hos/New()
	..()
	new /obj/item/whistle(src)

/obj/structure/closet/secure_closet/blueshield/populate_contents()
	..()
	for(var/i in 1 to 5)
		new /obj/item/storage/bag/plasticbag/mre(src)
