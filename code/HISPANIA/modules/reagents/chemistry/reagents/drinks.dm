/datum/reagent/consumable/drink/drakeblood
	name = "Drake Blood"
	id = "drakeblood"
	description = "The raw essence of a Drake."
	color = "##F9800F"
	drink_icon = "drakeblood
	drink_name = "Glass of drake blood
	drink_desc = "The raw essence of a Drake RAWR"
	taste_description = "fresh blood."

/datum/reagent/consumable/drink/drakeblood/on_mob_life(mob/living/M)
	var/update_flags = STATUS_UPDATE_NONE
	if((ishuman(M) && COMIC in M.mutations) || issmall(M))
		update_flags |= M.adjustBruteLoss(-1, FALSE)
		update_flags |= M.adjustFireLoss(-1, FALSE)
	return ..() | update_flags


///Hispania drinks


/datum/reagent/consumable/drink/rainbowjuice
	name = "Rainbow Juice"
	id = "rainbowjuice"
	description = "A colorful mixture of fruit juices."
	color = "#FF8EC8"
	nutriment_factor = 2 * REAGENTS_METABOLISM
	drink_icon = "rainbowjuice"
	drink_name = "Rainbow Juice"
	drink_desc = "A colorful mixture of fruit juices."
	taste_description = "gayness"

/datum/reagent/consumable/drink/unclegits_specialmilk
	name= "Uncle Git's Special Milk"
	id = "unclegits_specialmilk"
	description = "It is sticky and has a strong chlorine smell."
	color = "#FFFEC6"
	nutriment_factor = 2 * REAGENTS_METABOLISM
	drink_icon = "unclegits_specialmilk"
	drink_name = "Uncle Git's Special Milk"
	drink_desc = "It is sticky and has a strong chlorine smell."
	taste_description = "someone else's child"

//
