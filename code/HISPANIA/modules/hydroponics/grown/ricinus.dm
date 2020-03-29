//Semilla
/obj/item/seeds/ricinus
	name = "pack of ricinu"
	desc = "These seeds will grow into a castor oil plant, used for extracting castor oil... And nothing else."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "ricinus_seeds"
	species = "ricinus"
	plantname = "ricinus bush"
	product = /obj/item/reagent_containers/food/snacks/grown/ricinus
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "ricinus_harvest"
	icon_dead = "ricinus_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("castor_oil" = 0.30, "sugar" = 0.12)

//Fruta
/obj/item/reagent_containers/food/snacks/grown/ricinus
	seed = /obj/item/seeds/ricinus
	name = "Ricinus"
	desc = "Ricinus communis, the castor bean or castor oil plant, is a species of perennial flowering plant"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "ricinus"
	tastes = list("beans" = 1)