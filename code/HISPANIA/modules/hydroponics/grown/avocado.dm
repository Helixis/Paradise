//These are the seeds
/obj/item/seeds/avocado
	name = "pack of avocado seeds"
	desc = "These seeds grow into avocado trees."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "seed-avocado"
	species = "avocado"
	plantname = "Avocado Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/avocado/
	lifespan = 50
	endurance = 35
	yield = 3
	maturation = 6
	production = 4
	potency = 30
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "avocado-grow"
	icon_dead = "avocado-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("vitamin" = 0.05, "plantmatter" = 0.1)


//When it grows
/obj/item/reagent_containers/food/snacks/grown/avocado/
	seed = /obj/item/seeds/avocado
	name = "avocado"
	desc = "An unusually fatty fruit containing a single large seed."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "avocado"
	slice_path = /obj/item/reagent_containers/food/snacks/avocadoslice
	slices_num = 2


//Can be cut!
/obj/item/reagent_containers/food/snacks/avocadoslice
	name = "avocado slice"
	desc = "A slice of green goodness."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "avocado_cut"


/obj/item/reagent_containers/food/snacks/grown/avocado/attackby(obj/item/W as obj, mob/user, params)
	if(is_sharp(W))
		var/mob/living/carbon/human/H = user
		if(prob(5))
			var/picked_hand = pick("l_hand", "r_hand")
			var/obj/item/organ/external/M = H.get_organ(picked_hand)
			if (prob(99))
				to_chat(user, "<span class='warning'>You fail to cut [src] and cut your hand instead!</span>")
				H.apply_damage(20, BRUTE, picked_hand)
				M.fracture()
				return
			else
				to_chat(viewers(user), "<span class='danger'>[user] fails horribly to cut [src] and cuts [p_their()] hand right off instead!</span>")
				user.emote("scream")
				M.droplimb()
				H.regenerate_icons()
				return
		else
			return ..()