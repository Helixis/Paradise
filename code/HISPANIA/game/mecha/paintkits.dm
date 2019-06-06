/obj/item/paintkit/hispania
	name = "aplu paint kit"
	desc =  "A kit that contains all the necessary tools and pieces to recolor an APLU mech"
	var/colorines
	colorines = list("black", "death")


/obj/item/paintkit/hispania/attack_self(mob/user as mob)
	var/list/L = colorines

	var/t1 = input(user, "Please select a color to lock in on.", "paintkit") as null|anything in L
	if(!t1 || (!user.is_in_active_hand(src) || user.stat || user.restrained()))
		return
	if(t1 == "black")
		var/turf/T = get_turf(src)
		new /obj/item/paintkit/hispania/black(T)
		qdel(src)

	if(t1 == "death")
		var/turf/T = get_turf(src)
		new /obj/item/paintkit/hispania/death(T)
		qdel(src)

/obj/item/paintkit/hispania_hack
	name = "aplu customisation kit"
	desc = "A generic kit containing all the needed tools and parts to turn a mech into another mech."
	icon_state = "paintkit_2"
	var/colorines

	colorines = list("titansfist", "griffin")


/obj/item/paintkit/hispania_hack/attack_self(mob/user as mob)
	var/list/L = colorines

	var/t1 = input(user, "Please select a color to lock in on.", "paintkit") as null|anything in L
	if(!t1 || (!user.is_in_active_hand(src) || user.stat || user.restrained()))
		return
	if(t1 == "titansfist")
		var/turf/T = get_turf(src)
		new /obj/item/paintkit/hispania_hack/titansfist(T)
		qdel(src)

	if(t1 == "griffin")
		var/turf/T = get_turf(src)
		new /obj/item/paintkit/hispania_hack/griffin(T)
		qdel(src)


/obj/item/paintkit/hispania_hack/titansfist
	name = "Mercenary APLU \"Ripley\" kit"
	desc = "A kit containing all the needed tools and parts to turn an APLU \"Ripley\" into a Titan's Fist worker mech."
	icon_state = "paintkit_2"

	new_name = "APLU \"Titan's Fist\""
	new_desc = "This ordinary mining Ripley has been customized to look like a unit of the Titans Fist."
	new_icon2 = 'icons/hispania/mecha/ripley_titan.dmi'
	allowed_types = list("ripley")

/obj/item/paintkit/hispania_hack/griffin
	name = "Griffin APLU customisation kit"
	desc = "A kit containing all the needed tools and parts to turn an ordinary APLU into a Griffin worker mech."
	icon_state = "paintkit_2"

	new_name = "APLU \"Griffin\""
	new_desc = "The mech of The Griffin, the ultimate supervillain! The station will tremble under your feet (or maybe not)."
	new_icon2 = 'icons/hispania/mecha/ripley_griffin.dmi'
	allowed_types = list("ripley","firefighter")

/obj/item/paintkit/hispania/death
	name = "Death paint kit"
	desc = "A kit that contains all the necessary tools and pieces to recolor an APLU mech"

	new_name = "APLU \"Death\""
	new_desc = "A APLU of a dubious red tone. Make your co-workers look at you with suspicion!"
	new_icon2 = 'icons/hispania/mecha/ripley_death.dmi'
	allowed_types = list("ripley","firefighter")

/obj/item/paintkit/hispania/black
	name = "Black paint kit"
	desc = "A kit that contains all the necessary tools and pieces to recolor an APLU mech"

	new_name = "APLU \"Black\""
	new_desc = "A darkest night-colored APLU. Make your co-workers, for a few seconds, think that you're related to sec in some way."
	new_icon2 = 'icons/hispania/mecha/ripley_black.dmi'
	allowed_types = list("ripley","firefighter")
