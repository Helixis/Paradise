//Semilla
/obj/item/seeds/bell_pepper
	name = "pack of bell pepper"
	desc = "These seeds grow into bell peppers."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "bellpepper_seeds"
	species = "bell_pepper"
	plantname = "bell pepper tree"
	product = /obj/item/reagent_containers/food/snacks/grown/bell_pepper
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "bellp_harvest"
	icon_dead = "bellp_dead"
	reagents_add = list("nutriment" = 0.14, "sugar" = 0.12)

//Fruta
/obj/item/reagent_containers/food/snacks/grown/bell_pepper
	seed = /obj/item/seeds/bell_pepper
	name = "Bell Pepper"
	desc = "The bell pepper is the fruit of plants in the Grossum cultivar group of the species Capsicum annuum."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "bellpepper"
	tastes = list("fruity" = 1)