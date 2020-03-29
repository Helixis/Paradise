//Semilla
/obj/item/seeds/peach
	name = "pack of peach"
	desc = "These seeds grow into thicc juicy bouncy peaches."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "peach_seed"
	species = "peach"
	plantname = "peach tree"
	product = /obj/item/reagent_containers/food/snacks/grown/peach
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "peach_harvest"
	icon_dead = "peach_dead"
	reagents_add = list("peach" = 0.14, "sugar" = 0.12)

//Fruta
/obj/item/reagent_containers/food/snacks/grown/peach
	seed = /obj/item/seeds/peach
	name = "Peach"
	desc = "The peach is a round, coloured, juicy fruit, typically eaten in summer."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "peach"
	tastes = list("deliciously sweet" = 1)