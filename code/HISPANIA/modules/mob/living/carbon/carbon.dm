/mob/living/carbon/proc/check_mask_eat(var/obj/item/reagent_containers/food/toEat, mob/user)
	var/skip_check = 0
	if(istype(toEat, /obj/item/reagent_containers/food/pill/patch)) //Permite aplicar parches, por alguna razon son comida
		skip_check = 1
	if(istype(toEat, /obj/item/reagent_containers/food/pill)) //Permite aplicar pildoras pero envia un mensaje
		to_chat(user, "<span class='notice'>You push the pill through a small place between the mask and the mouth.</span>")
		skip_check = 1
	if(!skip_check)
		var/covered = 0
		var/snowflek = 0
		if(wear_mask && (wear_mask.flags_cover & MASKCOVERSMOUTH))
			if(istype(head, /obj/item/clothing/head/helmet/space/plasmaman) || istype(wear_mask, /obj/item/clothing/mask/breath/vox)) //Asi los plamaman y vox no mueren de hambre
				snowflek = 1
			else
				covered = 1
		if(wear_mask && (wear_mask.flags_cover & MASKCOVERSMOUTH) && !wear_mask.mask_adjusted)
			if(snowflek)
				if(!istype(wear_mask, /obj/item/clothing/mask/breath))
					covered = 1
			else
				covered = 1
		if(covered)
			if(user == src)
				to_chat(user, "<span class='warning'>Your mouth is covered, preventing you from ingesting [toEat]!</span>")
			else
				visible_message("<span class='warning'>[user] pushes [toEat] into the face of [src], but their mouth is covered!</span>")
			return FALSE
	return TRUE
