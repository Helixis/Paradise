//Semillas
/obj/item/seeds/prickly_pear
	name = "pack of prickly pear cactus"
	desc = "These seeds will grow into a prickly pear cactus, it's fruit can be eaten."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "pricklypearlcactus_seed"
	species = "prickly cactus"
	plantname = "prickly cactus"
	product = /obj/item/reagent_containers/food/snacks/grown/prickly_pear
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "prickly_harvest"
	icon_dead = "prickly_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/prickly_pear/san_pedro)
	reagents_add = list("nutriment" = 0.06, "sugar" = 0.02)

/obj/item/seeds/prickly_pear/san_pedro
	name = "pack of san pedro cactus"
	desc = "These seeds will grow into a San Pedro cactus."
	icon_state = "sanpedrocactus_seed"
	species = "san pedro cactus"
	plantname = "san pedro cactus"
	icon_grow = "pedro_harvest"
	icon_dead = "pedro_dead"
	product = /obj/item/reagent_containers/food/snacks/grown/prickly_pear/san_pedro
	mutatelist = list(/obj/item/seeds/prickly_pear/san_pedro/peyote)
	reagents_add = list("nutriment" = 0.06, "sugar" = 0.02, "lsd" = 0.02)

/obj/item/seeds/prickly_pear/san_pedro/peyote
	name = "pack of peyote"
	desc = "These seeds grow into a useless decorative peyote cactus."
	icon_state = "peyote_seed"
	species = "peyote cactus"
	plantname = "peyote cactus"
	icon_grow = "peyote_harvest"
	icon_dead = "peyote_dead"
	product = /obj/item/reagent_containers/food/snacks/grown/prickly_pear/san_pedro/peyote
	mutatelist = list(/obj/item/seeds/prickly_pear/san_pedro/peyote)
	reagents_add = list("lsd" = 1)

//Fruta
/obj/item/reagent_containers/food/snacks/grown/prickly_pear
	seed = /obj/item/seeds/prickly_pear
	name = "Prickly Pear"
	desc = "The red fruit or pear of this cactus are also known as tuna."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "pricklypearlcactus"
	tastes = list("sweet" = 1, "bland" = 1)

/obj/item/reagent_containers/food/snacks/grown/prickly_pear/san_pedro
	seed = /obj/item/seeds/prickly_pear/san_pedro
	name = "San Pedro Cactus"
	desc = "I can see colors now"
	icon_state = "sanpedrocactus"
	force = 7
	throwforce = 7
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 4
	throw_range = 5
	attack_verb = list("hit", "sliced")
	tastes = list("weird" = 1, "watery" = 1)

/obj/item/reagent_containers/food/snacks/grown/prickly_pear/san_pedro/peyote
	seed = /obj/item/seeds/prickly_pear/san_pedro/peyote
	name = "Peyote"
	desc = "Now i can see the future, the past and all the true."
	icon_state = "peyote"
	tastes = list("fun" = 1)