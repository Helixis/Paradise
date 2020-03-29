//These are the seeds
/obj/item/seeds/nispero
	name = "pack of nispero"
	desc = "These seeds will grow into a small níspero tree, a small sour-sweet fruit that can also be used to make an alcoholic beverage"
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "nispero_seed"
	species = "nispero"
	plantname = "nispero tree"
	product = /obj/item/reagent_containers/food/snacks/grown/nispero
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "nispero_harvest"
	icon_dead = "nispero_dead"
	reagents_add = list("nispero" = 0.14, "sugar" = 0.12, "nutriment" = 0.10)

/obj/item/reagent_containers/food/snacks/grown/nispero
	seed = /obj/item/seeds/nispero
	name = "Nispero"
	desc = "A small sour-sweet fruit that can also be used to make an alcoholic beverage"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "nispero"
	tastes = list("sour" = 1, "sweet" = 1)
