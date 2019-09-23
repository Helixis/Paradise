//These are the seeds
/obj/item/seeds/money
	name = "pack of coins"
	desc = "Money doesn't grow on trees... right?"
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "seed-money"
	species = "money"
	plantname = "Money Tree"
	product = /obj/item/grown/money
	lifespan = 60
	endurance = 35
	yield = 5
	maturation = 7
	production = 7
	potency = 7
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "money-grow"
	icon_dead = "money-dead"
	genes = list()

//When it grows
/obj/item/grown/money
	seed = /obj/item/seeds/money
	name = "wad of bills"
	desc = "A nicely arranged wad of bills. Open to reveal its contents."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "wad"
	burn_state = FLAMMABLE

/obj/item/reagent_containers/grown/money/attack_self(mob/user)
	new /obj/item/stack/spacecash/c10(get_turf(user))
	to_chat(user, "<span class='notice'>You open [src], revealing 10 credits.</span>")
	user.drop_item()
	qdel(src)
