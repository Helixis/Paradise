//These are the seeds
/obj/item/seeds/mango
	name = "pack of mango"
	desc = "It has an ovoid shape, non-edible rind and variable colour, from of pale yellow to dark red."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "mango_seed"
	species = "mango"
	plantname = "mango tree"
	product = /obj/item/reagent_containers/food/snacks/grown/mango
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "mango_harvest"
	icon_dead = "mango_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("mango" = 0.14, "sugar" = 0.12)

/obj/item/reagent_containers/food/snacks/grown/mango
	seed = /obj/item/seeds/mango
	name = "Mango"
	desc = "It has an ovoid shape, non-edible rind and variable colour, from of pale yellow to dark red."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "mango"
	tastes = list("sweet" = 1, "juicy"=1)
