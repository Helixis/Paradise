/////////////////Food reagents////////////////
/datum/reagent/consumable/butter
	name = "butter"
	id = "butter"
	description = "Delicious milk fat."
	reagent_state = LIQUID
	color = "#fff98f" // rgb: 255, 249, 143
	nutriment_factor = 5 * REAGENTS_METABOLISM
	taste_description = "butter"

/datum/reagent/consumable/mayonnaise
	name = "mayonnaise"
	id = "mayonnaise"
	description = "Tasty and beauty mayonnaise!"
	reagent_state = LIQUID
	color = "#FFFEF4" // rgb: 255, 254, 244
	nutriment_factor = 5 * REAGENTS_METABOLISM
	taste_description = "mayonnaise"

/datum/reagent/consumable/guacamole
	name = "guacamole"
	id = "guacamole"
	description = "greenish pasta with a good fruit flavor"
	reagent_state = LIQUID
	color = "#32CD32"
	nutriment_factor = 5 * REAGENTS_METABOLISM
	taste_description = "avocado"

/datum/reagent/consumable/nutriment/stabilized
	id = "nutriestable"
	name = "Stabilized Nutriment"
	description = "A bioengineered protien-nutrient structure designed to decompose in high saturation. In layman's terms, it won't get you fat."
	reagent_state = SOLID
	nutriment_factor = 15 * REAGENTS_METABOLISM
	color = "#664330" // rgb: 102, 67, 48

/datum/reagent/consumable/nutriment/stabilized/on_mob_life(mob/living/carbon/M)
	if(M.nutrition > NUTRITION_LEVEL_FULL - 25)
		M.adjust_nutrition(-3*nutriment_factor)
	..()
