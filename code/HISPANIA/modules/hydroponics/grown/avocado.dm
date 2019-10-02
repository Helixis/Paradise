//These are the seeds
/obj/item/seeds/avocado
	name = "pack of avocado seeds"
	desc = "These seeds grow into avocado trees."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "seed-avocado"
	species = "avocado"
	plantname = "Avocado Tree"
	product = /obj/item/reagent_containers/food/snacks/grown/avocado/
	lifespan = 65
	endurance = 35
	yield = 5
	maturation = 1
	production = 1
	potency = 10
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "avocado-grow"
	icon_dead = "avocado-dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("vitamin" = 0.05, "plantmatter" = 0.1)


//When it grows
/obj/item/reagent_containers/food/snacks/grown/avocado/
	seed = /obj/item/seeds/avocado
	name = "avocado"
	desc = "bruh"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "avocado"
	slice_path = /obj/item/reagent_containers/food/snacks/avocadoslice
	slices_num = 2


//Can be cut!
/obj/item/reagent_containers/food/snacks/avocadoslice
	name = "avocado slice"
	desc = "A slice of green goodness."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "avocadoslice"


/obj/item/reagent_containers/food/snacks/grown/avocado/attackby(obj/item/W as obj, mob/user, params)
	if(is_sharp(W))
		var/mob/living/carbon/human/H = user
		if(prob(50))
			var/picked_hand = pick("l_hand", "r_hand")
			if (prob(50))
				var/obj/item/organ/external/M = H.get_organ(picked_hand)
				to_chat(viewers(user), "<span class='danger'>[user] fails horribly to cut [src] and cuts [p_their()] hand right off instead!</span>")
				M.droplimb()
				H.regenerate_icons()
				return
			else
				to_chat(user, "<span class='warning'>You fail to cut [src] and cut your hand instead!</span>")
				H.apply_damage(20, BRUTE, picked_hand)
				return
		else
			return ..()