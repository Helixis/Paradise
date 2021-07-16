/obj/item/kitchen/utensil/New()
	..()
	icon = (hispania_icon ? 'icons/hispania/obj/kitchen.dmi' : icon)
	lefthand_file = (hispania_icon ? 'icons/hispania/mob/inhands/items_lefthand.dmi' : lefthand_file)
	righthand_file = (hispania_icon ? 'icons/hispania/mob/inhands/items_righthand.dmi' : righthand_file)

/obj/item/kitchen/utensil/goldfork
	name = "golden fork"
	desc = "A fork, but classy"
	icon_state = "goldfork"
	item_state = "goldenfork"
	item_state = "knife"
	hispania_icon = TRUE

/obj/item/kitchen/utensil/goldspoon
	name = "golden spoon"
	desc = "A spoon, but classy"
	icon_state = "goldspoon"
	item_state = "goldenspoon"
	hispania_icon = TRUE
	attack_verb = list("attacked", "poked")
