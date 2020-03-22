//These are the seeds
/obj/item/seeds/coconut
	name = "pack of coconut seeds"
	desc = "These seeds grow into coconut palms."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "coconut_seeds"
	species = "coconut"
	plantname = "Coconut palm"
	product = /obj/item/grown/coconut
	lifespan = 55
	endurance = 35
	yield = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "coco_harvest"
	icon_dead = "coco_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	mutatelist = list(/obj/item/seeds/coconut/bombonut)
	reagents_add = list("vitamin" = 0.04, "plantmatter" = 0.1, "sugar" =0.01)


//When it grows
/obj/item/grown/coconut
	seed = /obj/item/seeds/coconut
	name = "Coconut"
	desc = "A seed? A nut? A fruit?"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "coconut_bet"
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 2
	throw_range = 3
	attack_verb = list("hit", "bludgeoned", "whacked")
	var/coconut_wacked = /obj/item/reagent_containers/food/drinks/grown/coconut
	var/wacked_name = "Coconut drink"

/obj/item/grown/coconut/New()
	..()

//Attack with sharp object will make holes on it
/obj/item/grown/coconut/attackby(obj/item/W, mob/user, params)
	if(is_sharp(W))
		user.show_message("<span class='notice'>You make a [wacked_name] by cutting \the [src] and making some holes on it!</span>", 1)
		new coconut_wacked(user.loc, 1)
		qdel(src)

//Here's the drink
/obj/item/reagent_containers/food/drinks/grown/coconut
	name = "Coconut drink"
	desc = "Full of juice"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "coconutdrink"
	item_state = "coconutdrink"
	list_reagents = list("ale" = 30)
	var/coconut_sliced = /obj/item/reagent_containers/food/snacks/grown/coconutsliced
	var/sliced_name = "sliced coconut"


//Attack the drink with sharp will cut it in half
/obj/item/reagent_containers/food/drinks/grown/coconut/attackby(obj/item/W, mob/user, params)
	if(is_sharp(W))
		user.show_message("<span class='notice'>You cut \the [src] in half to make [sliced_name] </span>", 1)
		var/obj/item/reagent_containers/food/snacks/grown/coconutsliced/C = new coconut_sliced(user.loc, 2)
		qdel(src)
		usr.put_in_active_hand(C)


//Here's the food
obj/item/reagent_containers/food/snacks/grown/coconutsliced
	name = "sliced coconut"
	desc = "A coconut split in half"
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "coconut_slice"
	filling_color = "#FF4500"
	bitesize = 2



//BOMBONUT HERE//

/obj/item/seeds/coconut/bombonut
	name = "pack of bombonut seeds"
	desc = "The explosive variety of coconuts."
	icon = 'icons/hispania/obj/hydroponics/seeds.dmi'
	icon_state = "bombonut_seeds"
	species = "bombonut"
	plantname = "bombonout palm"
	mutatelist = list()
	product = /obj/item/reagent_containers/food/snacks/grown/bombonut
	lifespan = 35
	endurance = 35
	yield = 5
	growing_icon = 'icons/hispania/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "bombo_harvest"
	icon_dead = "bombo_dead"
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("plantmatter" = 0.1, "sorium" = 0.7)

/obj/item/reagent_containers/food/snacks/grown/bombonut
	name = "bombonut"
	desc = "The explosive variety of coconuts."
	icon = 'icons/hispania/obj/hydroponics/harvest.dmi'
	icon_state = "bombonut"
	volume = 150 //big boom boom
	seed = /obj/item/seeds/coconut/bombonut

/obj/item/reagent_containers/food/snacks/grown/bombonut/ex_act(severity)
	qdel(src) //Lo borramos para evitar explosiones repetidas en misma tile

/obj/item/reagent_containers/food/snacks/grown/bombonut/attack_self(mob/living/user) //Avisamos a un admin y se guarda en log que el usuario detonara esto
	var/area/A = get_area(user)
	user.visible_message("<span class='warning'>[user] plucks the stem from [src]!</span>", "<span class='userdanger'>You pluck the stem from [src], which begins to hiss loudly!</span>")
	message_admins("[user] ([user.key ? user.key : "no key"]) primed a bombonout for detonation at [A] ([user.x], [user.y], [user.z]) <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>(JMP)</a>")
	log_game("[user] ([user.key ? user.key : "no key"]) primed a bombonout for detonation at [A] ([user.x],[user.y],[user.z]).")
	prime()

/obj/item/reagent_containers/food/snacks/grown/bombonut/deconstruct(disassembled = TRUE)
	if(!disassembled)
		prime()
	if(!QDELETED(src))
		qdel(src)

/obj/item/reagent_containers/food/snacks/grown/bombonut/proc/prime()
	icon_state = "cherry_bomb_lit"
	playsound(src, 'sound/goonstation/misc/fuse.ogg', seed.potency, 0)
	reagents.set_reagent_temp(1000) //Sets off the black powder