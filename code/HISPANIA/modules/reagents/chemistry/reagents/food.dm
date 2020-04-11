/////////////////Food reagents////////////////


/datum/reagent/consumable/butter
	name = "butter"
	id = "butter"
	description = "Delicious milk fat."
	reagent_state = LIQUID
	color = "#fff98f" // rgb: 255, 249, 143
	nutriment_factor = 5 * REAGENTS_METABOLISM
	taste_description = "butter"

/datum/reagent/consumable/agave
	name = "Agave Juice"
	id = "agave"
	description = "Principal reagent to make tequila."
	color = "#C9B25D"
	taste_description = "Bland"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/anonna
	name = "Anonna Juice"
	id = "anonna"
	description = "Magic juice with lovely taste"
	color = "#C1AA8D"
	taste_description = "Sugary"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/kiwi
	name = "Kiwi Juice"
	id = "kiwi"
	description = "For some reasons kinda tastes like feathers"
	color = "#C5CA4C"
	taste_description = "Sour Sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/mango
	name = "Mango Juice"
	id = "mango"
	description = "Sweat and pulpy"
	color = "#FF9903"
	taste_description = "pulpy"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/mate
	name = "Mate"
	id = "mate"
	description = "Hipster stuff"
	color = "#948870"
	taste_description = "hipster"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/nispero
	name = "Nispero Juice"
	id = "nispero"
	description = "Weird stuff no idea what is this"
	color = "#9B723C"
	taste_description = "sour sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/peach
	name = "Peach Juice"
	id = "peach"
	description = "Coloured, juicy fruit"
	color = "#FFB5B6"
	taste_description = "deliciously sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/castor
	name = "Castor Oil"
	id = "castor_oil"
	description = "smells like beans"
	color = "#9D8F62"
	taste_description = "beans"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/castor/on_mob_life(mob/living/carbon/M)
	var/update_flags = STATUS_UPDATE_NONE
	update_flags |= M.adjustBruteLoss(-2*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	update_flags |= M.adjustFireLoss(-2*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	return ..() | update_flags

/datum/reagent/consumable/strawberry
	name = "Strawberry Juice"
	id = "strawberry"
	description = "Acidic and sweet"
	color = "#FF292E"
	taste_description = "sweet citric"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM
/datum/reagent/consumable/mayonnaise
	name = "mayonnaise"
	id = "mayonnaise"
	description = "Tasty and beauty mayonnaise!"
	reagent_state = LIQUID
	color = "#FFFEF4" // rgb: 255, 254, 244
	nutriment_factor = 5 * REAGENTS_METABOLISM
	taste_description = "mayonnaise"

