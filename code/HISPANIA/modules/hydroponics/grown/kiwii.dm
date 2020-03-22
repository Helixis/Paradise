//These are the seeds
/obj/item/seeds/kiwii //Kiwii to avoid DM problems
	name = "pack of kiwii seeds"
	desc = "Is a fruit of ovoid shape, of variable size and covered with a brown fuzzy thin skin"
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "kiwi_seeds"
	species = "kiwi"
	plantname = "Kiwii Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/money
	lifespan = 50
	endurance = 40
	weed_chance = 15 //Percentage chance per tray update to grow weeds
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/watermelon/holy)
	icon_grow = "kiwii_harvest"
	icon_dead = "kiwii_dead"
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
