//Semillas
/obj/item/seeds/anonna
	name = "pack of anonna"
	desc = "Annona species are taprooted, evergreen or semideciduous, tropical trees or shrubs."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "annona_seeds"
	species = "anonna"
	plantname = "anonna tree"
	product = /obj/item/reagent_containers/food/snacks/grown/anonna
	lifespan = 55
	endurance = 35
	yield = 5
	potency = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "annona_harvest"
	icon_dead = "annona_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/anonna/anonna_reticulata)
	reagents_add = list("anonna" = 0.14, "sugar" = 0.12)

/obj/item/seeds/anonna/anonna_reticulata
	name = "pack of anonna reticulata"
	desc = "These seeds grow into an anonna reticulata plant, the edgy sister of the anonna."
	icon_state = "annonareticulata_seeds"
	species = "anonna reticulata"
	plantname = "anonna reticulata tree"
	product = /obj/item/reagent_containers/food/snacks/grown/anonna/reticulata
	reagents_add = list("anonna" = 0.15, "mutagen" = 0.05)
	rarity = 40

//Fruta
/obj/item/reagent_containers/food/snacks/grown/anonna
	seed = /obj/item/seeds/anonna
	name = "Anonna"
	desc = "Annona species are taprooted, evergreen or semideciduous, tropical trees or shrubs."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "annona"
	tastes = list("sugary" = 1)

/obj/item/reagent_containers/food/snacks/grown/anonna/reticulata
	seed = /obj/item/seeds/anonna/anonna_reticulata
	name = "Anonna"
	desc = "The edgy sister of the anonna."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "annonareticulata"
	tastes = list("sugary" = 1, "edgy" = 1)