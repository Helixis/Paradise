/////////////////Food reagents////////////////


/datum/reagent/consumable/butter
	name = "Butter"
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
	color = "#FEFEFE"
	taste_description = "Bland"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/anonna
	name = "Anonna Juice"
	id = "anonna"
	description = "Magic juice with lovely taste"
	color = "#FEFEFE"
	taste_description = "Sugary"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/kiwi
	name = "Kiwi Juice"
	id = "kiwi"
	description = "For some reasons kinda tastes like feathers"
	color = "#FEFEFE"
	taste_description = "Sour Sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/mango
	name = "Mango Juice"
	id = "mango"
	description = "Sweat and pulpy"
	color = "#FEFEFE"
	taste_description = "pulpy"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/mate
	name = "Mate"
	id = "mate"
	description = "Hipster stuff"
	color = "#FEFEFE"
	taste_description = "hipster"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/nispero
	name = "Nispero Juice"
	id = "nispero"
	description = "Weird stuff no idea what is this"
	color = "#FEFEFE"
	taste_description = "sour sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/peach
	name = "Peach Juice"
	id = "peach"
	description = "Coloured, juicy fruit"
	color = "#FEFEFE"
	taste_description = "deliciously sweet"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/castor
	name = "Castor Oil"
	id = "castor_oil"
	description = "smells like beans"
	color = "#FEFEFE"
	taste_description = "beans"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM

/datum/reagent/consumable/castor/on_mob_life(mob/living/carbon/M)
	var/update_flags = STATUS_UPDATE_NONE
	update_flags |= M.adjustBruteLoss(-1*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	update_flags |= M.adjustFireLoss(-1*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	return ..() | update_flags

/datum/reagent/consumable/strawberry
	name = "Strawberry Juice"
	id = "strawberry"
	description = "Acidic and sweet"
	color = "#FEFEFE"
	taste_description = "sweet citric"
	metabolization_rate = 0.15 * REAGENTS_METABOLISM
