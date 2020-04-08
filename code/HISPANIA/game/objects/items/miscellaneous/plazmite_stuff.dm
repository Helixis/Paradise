//Plasma Digerido (Cura un poco quemadura y bruto pero bastante toxinas)

/obj/item/dig_plasma
	name = "digested plasma"
	desc = "Plasma digested by plazmites smells kinda funny."
	icon = 'icons/hispania/obj/mining.dmi'
	icon_state = "plazdig"
	item_state = "plazdig"
	origin_tech = "biotech=3"

/obj/item/dig_plasma/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(proximity_flag)
		applyto(target, user)

/obj/item/dig_plasma/attack_self(mob/user)
	applyto(user, user)

/obj/item/dig_plasma/proc/applyto(atom/target, mob/user)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.stat == DEAD)
			to_chat(user, "<span class='notice'>[src] is useless on the dead.</span>")
			return
		if(H != user)
			H.visible_message("[user] forces [H] to apply [src]...")
		else
			to_chat(user, "<span class='notice'>You start to drink and bite [src]. Tastes weird but your wounds heal.</span>")
		H.adjustBruteLoss(-5)
		H.adjustFireLoss(-5)
		H.adjustToxLoss(-50)
		user.drop_item()
		qdel(src)

//Por si solo es inutil, pero nos permite generar infusiones curativas

/obj/item/plaz_cat
	name = "plazmite catalyst"
	desc = "Main reagent to make healing infusions."
	icon = 'icons/hispania/obj/mining.dmi'
	icon_state = "plazcata"
	item_state = "plazcata"
	origin_tech = "biotech=5"

//Linterna de Cartiplaz
/obj/item/flashlight/lamp/plazlamp
	name = "plazmite lamp"
	desc = "A lamp make with bones, plazmite cartilage and watch sinew."
	icon = 'icons/hispania/obj/mining.dmi'
	icon_state = "plazlamp"
	item_state = "plazlamp"
	brightness_on = 9
	light_color = LIGHT_COLOR_YELLOW
	w_class = WEIGHT_CLASS_BULKY
	flags = CONDUCT
	materials = list()
	on = TRUE

////INFUSIONES////

/obj/item/reagent_containers/food/drinks/mushroom_bowl/salgel
	name = "water of life"
	desc = "Contains healing properties perfect for combat."
	list_reagents = list("salglu_solution" = 35, "omnizine" = 1, "sal_acid"= 3, "menthol" = 5, "teporone" = 5)

/obj/item/reagent_containers/food/drinks/mushroom_bowl/seltup
	name = "peaceful home"
	desc = "Contains healing properties for the badly wounded."
	list_reagents = list("hydrocodone" = 3, "mitocholide" = 2, "salglu_solution" = 25, "omnizine" = 1, "salbutamol" = 10, "ephedrine" = 2, "atropine" = 5)

/obj/item/reagent_containers/food/drinks/mushroom_bowl/seltox
	name = "purification brew"
	desc = "Contains healing properties for spiritual damage."
	list_reagents = list("lavaland_extract" = 2, "charcoal" = 20, "omnizine" = 2, "pen_acid" = 20)
