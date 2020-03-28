//Semilla
/obj/item/seeds/agave
	name = "pack of agave"
	desc = "These seeds grow into agave, used to create tequila"
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "agave_seed"
	species = "agave"
	plantname = "agave bush"
	product = /obj/item/reagent_containers/food/snacks/grown/agave
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "agave_harvest"
	icon_dead = "agave_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("agave" = 0.04)

//Fruta
/obj/item/reagent_containers/food/snacks/grown/agave
	seed = /obj/item/seeds/agave
	name = "Agave"
	desc = "Used to create tequila"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "agave"
	wine_power = 0.5
	tastes = list("bland" = 1)