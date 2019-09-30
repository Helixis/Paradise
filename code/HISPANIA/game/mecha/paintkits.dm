/obj/item/paintkit/hispania                 // estos son los paintkit de recolor
	name = "aplu paint kit"
	desc =  "A kit that contains all the necessary tools and pieces to recolor an APLU mech"
	var/list/colored = list("black", "death")
	w_class = WEIGHT_CLASS_SMALL
	//aca la lista de paintkits de recolores
	var/list/paintkit_name = list("red and black", "black")
	var/list/paintkit_type = list( /obj/item/paintkit/hispania/death,
								/obj/item/paintkit/hispania/black)

/obj/item/paintkit/hispania/attack_self(mob/user as mob)
	var/obj/item/paintkit/hispania/paint_name = input(user, "Please select a color to lock in on.", "paintkit") as null|anything in paintkit_name
	if(!paint_name || (!user.is_in_active_hand(src) || user.stat || user.restrained()))
		return
	var/paint_number = paintkit_name.Find(paint_name)
	qdel(src)
	var/obj/item/paintkit/hispania/paint = paintkit_type[paint_number]
	usr.put_in_hands(new paint(src))

/obj/item/paintkit/hispania/hack               // estos son los painkit de alta personalizacion
	name = "aplu customisation kit"
	desc = "A generic kit containing all the needed tools and parts to turn a mech into another mech."
	icon_state = "paintkit_2"
	//esto es la lista de paintkits de alta personalización
	paintkit_name = list("titansfist", "griffin")
	paintkit_type = list(/obj/item/paintkit/hispania/hack/titansfist,
						/obj/item/paintkit/hispania/hack/griffin)

//paintkit de alta personalización//
/obj/item/paintkit/hispania/hack/titansfist
	name = "Mercenary APLU \"Ripley\" kit"
	desc = "A kit containing all the needed tools and parts to turn an APLU \"Ripley\" into a Titan's Fist worker mech."

	new_name = "APLU \"Titan's Fist\""
	new_desc = "This ordinary mining Ripley has been customized to look like a unit of the Titans Fist."
	new_icon2 = 'icons/hispania/mecha/ripley/ripley_titan.dmi'
	allowed_types = list("ripley")

/obj/item/paintkit/hispania/hack/griffin
	name = "Griffin APLU customisation kit"
	desc = "A kit containing all the needed tools and parts to turn an ordinary APLU into a Griffin worker mech."

	new_name = "APLU \"Griffin\""
	new_desc = "The mech of The Griffin, the ultimate supervillain! The station will tremble under your feet (or maybe not)."
	new_icon2 = 'icons/hispania/mecha/ripley/ripley_griffin.dmi'
	allowed_types = list("ripley","firefighter")

//paintkit de solo recolor//
/obj/item/paintkit/hispania/death
	name = "Death paint kit"
	desc = "A kit that contains all the necessary tools and pieces to recolor an APLU mech"

	new_name = "APLU \"Death\""
	new_desc = "A APLU of a dubious red tone. Make your co-workers look at you with suspicion!"
	new_icon2 = 'icons/hispania/mecha/ripley/ripley_death.dmi'
	allowed_types = list("ripley","firefighter")

/obj/item/paintkit/hispania/black
	name = "Black paint kit"
	desc = "A kit that contains all the necessary tools and pieces to recolor an APLU mech"

	new_name = "APLU \"Black\""
	new_desc = "A darkest night-colored APLU. Make your co-workers, for a few seconds, think that you're related to sec in some way."
	new_icon2 = 'icons/hispania/mecha/ripley/ripley_black.dmi'
	allowed_types = list("ripley","firefighter")

