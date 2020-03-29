//These are the seeds
/obj/item/seeds/mate
	name = "pack of mate"
	desc = "These seeds will grow into a mate plant, grow it before it's cool"
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "mate_seed"
	species = "mate"
	plantname = "mate bush"
	product = /obj/item/reagent_containers/food/snacks/grown/mate
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "mate_harvest"
	icon_dead = "mate_dead"
	reagents_add = list("mate" = 1)

/obj/item/reagent_containers/food/snacks/grown/mate
	seed = /obj/item/seeds/mate
	name = "Mate"
	desc = "Very hipster"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "mate"
	tastes = list("bitter" = 1 , "hipstery" = 1)