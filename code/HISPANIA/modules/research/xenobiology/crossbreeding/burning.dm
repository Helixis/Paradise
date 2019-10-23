/*
Burning extracts:
	Have a unique, primarily offensive effect when
	filled with 10u plasma and activated in-hand.
*/
/obj/item/slimecross/burning
	name = "burning extract"
	desc = "It's boiling over with barely-contained energy."
	effect = "burning"
	icon_state = "burning"
	container_type = INJECTABLE

/obj/item/slimecross/burning/Initialize()
	. = ..()
	create_reagents(10, INJECTABLE | DRAWABLE)

/obj/item/slimecross/burning/attack_self(mob/user)
    if(!reagents.has_reagent("plasma_dust",  10))
        to_chat(user, "<span class='warning'>This extract needs to be full of plasma to activate!</span>")
        return
    reagents.remove_reagent("plasma_dust",  10)
    to_chat(user, "<span class='notice'>You squeeze the extract, and it absorbs the plasma!</span>")
    playsound(src, 'sound/effects/bubbles.ogg', 50, TRUE)
    playsound(src, 'sound/magic/fireball.ogg', 50, TRUE)
    do_effect(user)

/obj/item/slimecross/burning/proc/do_effect(mob/user) //If, for whatever reason, you don't want to delete the extract, don't do ..()
	qdel(src)
	return

/obj/item/slimecross/burning/grey
	colour = "grey"
	effect_desc = "Creates a hungry and speedy slime that will love you forever."

/obj/item/slimecross/burning/grey/do_effect(mob/user)
	var/mob/living/simple_animal/slime/S = new(get_turf(user),"grey")
	S.visible_message("<span class='danger'>A baby slime emerges from [src], and it nuzzles [user] before burbling hungrily!</span>")
	S.Friends[user] = 20 //Gas, gas, gas
	S.bodytemperature = T0C + 400 //We gonna step on the gas.
	S.set_nutrition(S.get_hunger_nutrition()) //Tonight, we fight!
	..()

/obj/item/slimecross/burning/orange
	colour = "orange"
	effect_desc = "Expels pepperspray in a radius when activated."

/obj/item/slimecross/burning/orange/do_effect(mob/user)
	user.visible_message("<span class='danger'>[src] boils over with a caustic gas!</span>")
	var/datum/reagents/R = new/datum/reagents(100)
	R.add_reagent("condensedcapsaicin", 100)

	var/datum/effect_system/smoke_spread/chem/smoke = new
	smoke.set_up(R,  get_turf(user), TRUE)
	smoke.start(3)
	..()

/obj/item/slimecross/burning/yellow
	colour = "yellow"
	effect_desc = "Electrocutes people near you."

/obj/item/slimecross/burning/yellow/do_effect(mob/user)
	user.visible_message("<span class='danger'>[src] explodes into an electrical field!</span>")
	playsound(get_turf(src), 'sound/weapons/zapbang.ogg', 50, TRUE)
	for(var/mob/living/M in range(4,get_turf(user)))
		if(M != user)
			var/mob/living/carbon/C = M
			if(istype(C))
				C.electrocute_act(25,src)
			else
				M.adjustFireLoss(25)
			to_chat(M, "<span class='danger'>You feel a sharp electrical pulse!</span>")
	..()

/obj/item/slimecross/burning/darkblue
	colour = "dark blue"
	effect_desc = "Expels a burst of chilling smoke while also filling you with cryoxadone."

/obj/item/slimecross/burning/darkblue/do_effect(mob/user)
	user.visible_message("<span class='danger'>[src] releases a burst of chilling smoke!</span>")
	var/datum/reagents/R = new/datum/reagents(100)
	R.add_reagent("frostoil", 40)
	user.reagents.add_reagent("cryoxadone",10)
	var/datum/effect_system/smoke_spread/chem/smoke = new
	smoke.set_up(R,  get_turf(user), TRUE)
	smoke.start(3)
	..()

/obj/item/slimecross/burning/red
	colour = "red"
	effect_desc = "Makes nearby slimes rabid, and they'll also attack their friends."

/obj/item/slimecross/burning/red/do_effect(mob/user)
	user.visible_message("<span class='danger'>[src] pulses a hazy red aura for a moment, which wraps around [user]!</span>")
	for(var/mob/living/simple_animal/slime/S in view(7, get_turf(user)))
		if(user in S.Friends)
			var/friendliness = S.Friends[user]
			S.Friends = list()
			S.Friends[user] = friendliness
		else
			S.Friends = list()
		S.rabid = 1
		S.visible_message("<span class='danger'>The [S] is driven into a dangerous frenzy!</span>")
	..()

/obj/item/slimecross/burning/oil
	colour = "oil"
	effect_desc = "Creates an explosion after a few seconds."

/obj/item/slimecross/burning/oil/do_effect(mob/user)
	user.visible_message("<span class='warning'>[user] activates [src]. It's going to explode!</span>", "<span class='danger'>You activate [src]. It crackles in anticipation</span>")
	addtimer(CALLBACK(src, .proc/boom), 50)

/obj/item/slimecross/burning/oil/proc/boom()
	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/explosion2.ogg', 200, TRUE)
	for(var/mob/living/M in range(2, T))
		new /obj/effect/temp_visual/explosion(get_turf(M))
		M.ex_act(EXPLODE_HEAVY)
	qdel(src)
