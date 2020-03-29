//These are the seeds
/obj/item/seeds/strawberry
	name = "pack of strawberry"
	desc = "These seeds grow into strawberries."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "strawberry_seeds"
	species = "strawberry"
	plantname = "strawberry bush"
	product = /obj/item/reagent_containers/food/snacks/grown/strawberry
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "straw_harvest"
	icon_dead = "straw_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	//mutatelist = list(/obj/item/seeds/strawberry/silicon)   //Tengo unas dudas respecto a esto
	reagents_add = list("strawberry" = 1)

/obj/item/reagent_containers/food/snacks/grown/strawberry
	seed = /obj/item/seeds/strawberry
	name = "Strawberry"
	desc = " The fruit of passion is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "strawberry"
	tastes = list("acid" = 1, "sweet" = 1)