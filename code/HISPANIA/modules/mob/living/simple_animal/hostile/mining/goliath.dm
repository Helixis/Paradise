#define ANCIENT 3
#define ADULT 2
#define SUBADULT 1
#define JUVENILE 0
#define WILD 0
#define PASSIVE 1
#define TAMED 2
#define NOT_DRACONIAN 0
#define DRACONIAN 1
#define FULL_DRACONIAN 2
#define MEAT /obj/item/reagent_containers/food/snacks/monstermeat
#define CORE /obj/item/organ/internal/regenerative_core
#define FLORA /obj/item/reagent_containers/food/snacks/grown/ash_flora
#define ORGANS /obj/item/organ/internal
#define DIAMOND /obj/item/stack/ore/diamond
#define CYBERORGAN /obj/item/organ/internal/cyberimp
#define DRAGONSBLOOD /obj/item/dragons_blood
#define GROWTH_MAX 1200

/mob/living/simple_animal/hostile/asteroid/goliath
	var/growth = 1200 // Out of 1200.
	var/growth_stage = ADULT // Can be ANCIENT, ADULT, SUBADULT, JUVENILE.
	var/tame_progress = 0
	var/tame_stage = WILD // Can be WILD, PASSIVE, TAMED.
	var/picking_candidates = FALSE
	var/food_wanted = MEAT // Meat by default.
	var/feed_cooldown = 0
	var/draconian = NOT_DRACONIAN // Can be NOT_DRACONIAN, DRACONIAN, FULL_DRACONIAN.
	var/mutable_appearance/draconian_overlay
	var/aux_tentacles = 3 // Auxillary tentacles. The total amount of tentacles is 1 + [aux_tentacles] + [extra_tentacles].
	var/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient/leader = null
	var/list/ghost_volunteers[0]

/mob/living/simple_animal/hostile/asteroid/goliath/juvenile
	name = "juvenile goliath"
	desc = "A small red animal. It looks like it can run fast!"
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "goliath_baby"
	icon_aggro = "goliath_baby"
	icon_living = "goliath_baby"
	icon_dead = "goliath_baby_dead"
	pre_attack_icon = "goliath_baby2"
	speak_emote = list("chirps")
	vision_range = 4
	speed = 1
	move_to_delay = 3
	maxHealth = 100
	health = 100
	obj_damage = 50
	ranged_cooldown_time = 60
	aux_tentacles = 0
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	growth = 0
	growth_stage = JUVENILE
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	gender = NEUTER
	environment_smash = 1
	sentience_type = SENTIENCE_OTHER
	loot = list()

/mob/living/simple_animal/hostile/asteroid/goliath/juvenile/subadult
	growth = 599

/mob/living/simple_animal/hostile/asteroid/goliath/examine(mob/user)
	. = ..()
	if(stat != DEAD)
		var/list/msgs = list()
		if(draconian)
			msgs += "<span class='warning'>It has streaks of magma coursing through its body!</span>"
		if(key)
			msgs += "<span class='warning'>It appears to be more aware of its surroundings.</span>"
		if(tame_stage == PASSIVE)
			msgs += "<span class='notice'>It appears to be passive.</span>"
		if(tame_stage == TAMED)
			msgs += "<span class='notice'>It appears to have been tamed.</span>"
		if((tame_stage != TAMED) && (growth_stage != ADULT && growth_stage != ANCIENT)) // No need to let people know if it wants to eat something if it's tamed
			switch(food_wanted)
				if(MEAT)
					msgs += "<span class='notice'>You think you could feed it something...</span>"
				if(CORE)
					msgs += "<span class='notice'>It seems to want to eat something refreshing!</span>"
				if(FLORA)
					msgs += "<span class='notice'>It seems to want to eat something envigorating!</span>"
				if(ORGANS)
					msgs += "<span class='notice'>It seems to want to eat something soft!</span>"
				if(DIAMOND)
					msgs += "<span class='notice'>It seems to want to eat something crunchy!</span>"
		. += msgs

/mob/living/simple_animal/hostile/asteroid/goliath/Stat()
	..()
	if(statpanel("Status"))
		if(growth_stage != ADULT && growth_stage != ANCIENT)
			stat(null, "Growth: [(growth*100)/GROWTH_MAX]%.")
		else
			stat(null, "Growth: Complete.")

/mob/living/simple_animal/hostile/asteroid/goliath/proc/reroll_food() // Picking a random preferred food to eat
	if(tame_stage == WILD && tame_progress <= 599)
		food_wanted = MEAT
	else
		var/list/food = list(CORE,FLORA,ORGANS,DIAMOND)
		food_wanted = pick(food)

/mob/living/simple_animal/hostile/asteroid/goliath/proc/handle_growth()
	if(growth >= 600 && growth_stage == JUVENILE && !stat) // Grow to subadult
		name = "subadult goliath"
		growth_stage = SUBADULT
		maxHealth += 50
		health += 50
		speed = 2
		move_to_delay = 4
		obj_damage = 70
		melee_damage_lower = 15
		melee_damage_upper = 15
		desc = "A medium-sized red animal."
		speak_emote = list("growls")
		icon_state = "goliath_subadult"
		icon_aggro = "goliath_subadult"
		icon_living = "goliath_subadult"
		icon_dead = "goliath_subadult_dead"
		pre_attack_icon = "goliath_subadult2"
		environment_smash = 2
		aux_tentacles = 1
		add_draconian_effect()
	if(growth >= 1200 && growth_stage == SUBADULT && !stat) // Grow to adult
		name = "goliath"
		growth_stage = ADULT
		maxHealth += 150
		health += 150
		speed = 3
		move_to_delay = 40
		obj_damage = 100
		ranged_cooldown_time = 120
		harm_intent_damage = 1
		melee_damage_lower = 25
		melee_damage_upper = 25
		desc = "A hulking, armor-plated beast with long tendrils arching from its back."
		speak_emote = list("bellows")
		icon_state = "goliath"
		icon_living = "goliath"
		icon_aggro = "goliath"
		icon_dead = "goliath_dead"
		pre_attack_icon = "goliath2"
		attacktext = "pulverizes"
		attack_sound = 'sound/weapons/punch1.ogg'
		move_force = MOVE_FORCE_VERY_STRONG
		move_resist = MOVE_FORCE_VERY_STRONG
		pull_force = MOVE_FORCE_VERY_STRONG
		environment_smash = 2
		aux_tentacles = 3
		crusher_loot = /obj/item/crusher_trophy/goliath_tentacle
		butcher_results = list(/obj/item/reagent_containers/food/snacks/monstermeat/goliath = 2, /obj/item/stack/sheet/animalhide/goliath_hide = 1, /obj/item/stack/sheet/bone = 2, /obj/item/reagent_containers/food/snacks/meat = 1)
		loot = list()
		stat_attack = UNCONSCIOUS
		robust_searching = TRUE
		add_draconian_effect()
		if(tame_stage != TAMED) // If you didn't manage to tame it before it grew up, I got bad news for 'ya.
			tame_progress = 0
			handle_tame_progress()

/mob/living/simple_animal/hostile/asteroid/goliath/proc/handle_tame_progress()
	if(tame_progress <= 599 && tame_stage != WILD) // Become feral if left alone for too long
		tame_stage = WILD
		visible_message("<span class='warning'>[src] looks frenzied!</span>")
		food_wanted = MEAT
		faction = list("mining")
	if(tame_progress >= 600 && tame_stage == WILD) // Become neutral
		tame_stage = PASSIVE
		visible_message("<span class='warning'>[src] looks pacified...</span>")
		reroll_food()
		faction |= "neutral"
	if(tame_progress >= 2400 && !picking_candidates && !key) // Become player controlled
		picking_candidates = TRUE
		becomeaware()
	if(tame_progress >= 2400 && key && tame_stage == PASSIVE) // Become tamed if you're already player controlled.
		to_chat(src, "<span class='biggerdanger'>You have been tamed!</span>")
		to_chat(src, "<span class='danger'>You have been introduced to the non-aggressive way of living by being fed and treated well, but you have also been disowned by the creatures you previously coexisted with.</span>")
		tame_stage = TAMED
		faction = list("neutral")
		leader.goliaths_owned--
		leader = null

/mob/living/simple_animal/hostile/asteroid/goliath/proc/becomeaware() // Becoming tamed and player controlled
	visible_message("<span class='notice'>\The [src] looks around...</span>")
	ghost_volunteers.Cut()
	request_player()
	spawn(600)
		if(ghost_volunteers.len)
			var/mob/dead/observer/O
			while(!istype(O) && ghost_volunteers.len)
				O = pick_n_take(ghost_volunteers)
			if(istype(O) && check_observer(O))
				if(leader)
					leader.goliaths_owned--
					leader = null
				picking_candidates = FALSE
				tame_stage = TAMED
				faction = list("neutral")
				ckey = O.ckey
				to_chat(src, "<span class='biggerdanger'>You are a young goliath!</span>")
				to_chat(src, "<span class='danger'>You have been introduced to the non-aggressive way of living by being fed and treated well, but you have also been disowned by the creatures you previously coexisted with.</span>")
				mind.assigned_role = "Tamed Goliath"
				visible_message("<span class='notice'>[src] roars! He looks happy.</span>")
		else
			visible_message("<span class='notice'>\The [src] looks undecided...</span>")
			tame_progress = 2100
			picking_candidates = FALSE
	return

/mob/living/simple_animal/hostile/asteroid/goliath/proc/request_player()
	for(var/mob/dead/observer/O in GLOB.player_list)
		if(check_observer(O))
			to_chat(O, "<span class='boldnotice'>\A [src] is being tamed. (<a href='?src=[O.UID()];jump=\ref[src]'>Teleport</a> | <a href='?src=[UID()];signup=\ref[O]'>Sign Up</a>)</span>")

/mob/living/simple_animal/hostile/asteroid/goliath/proc/check_observer(mob/dead/observer/O)
	if(cannotPossess(O))
		return FALSE
	if(!O.can_reenter_corpse)
		return FALSE
	if(O.client)
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/asteroid/goliath/Topic(href, href_list)
	if("signup" in href_list)
		var/mob/dead/observer/O = locate(href_list["signup"])
		if(!O)
			return
		volunteer(O)

/mob/living/simple_animal/hostile/asteroid/goliath/proc/volunteer(mob/dead/observer/O)
	if(!picking_candidates)
		to_chat(O, "Not looking for a ghost, yet.")
		return
	if(!istype(O))
		to_chat(O, "<span class='warning'>Error.</span>")
		return
	if(O in ghost_volunteers)
		to_chat(O, "<span class='notice'>Removed from registration list.</span>")
		ghost_volunteers.Remove(O)
		return
	if(!check_observer(O))
		to_chat(O, "<span class='warning'>You cannot be \a [src].</span>")
		return
	if(cannotPossess(O))
		to_chat(O, "<span class='warning'>Upon using the antagHUD you forfeited the ability to join the round.</span>")
		return
	to_chat(O, "<span class='notice'>You've been added to the list of ghosts that may become this [src]. Click again to unvolunteer.</span>")
	ghost_volunteers.Add(O)

/mob/living/simple_animal/hostile/asteroid/goliath/proc/add_draconian_effect() // Apply the draconian overlay
	cut_overlay(draconian_overlay)
	var/status
	if(draconian == NOT_DRACONIAN)
		return
	if(stat == DEAD)
		status = "_dead"
	if(growth_stage == JUVENILE)
		draconian_overlay = mutable_appearance('icons/mob/lavaland/lavaland_monsters.dmi', "goliath_glow_juvenile[status]")
	else if(growth_stage == SUBADULT)
		draconian_overlay = mutable_appearance('icons/mob/lavaland/lavaland_monsters.dmi', "goliath_glow_subadult[status]")
	else if(growth_stage == ADULT)
		draconian_overlay = mutable_appearance('icons/mob/lavaland/lavaland_monsters.dmi', "goliath_glow_adult[status]")
	if(draconian == DRACONIAN)
		draconian_overlay.alpha = 150
	if(draconian == FULL_DRACONIAN)
		draconian_overlay.alpha = 255
	add_overlay(draconian_overlay)

/mob/living/simple_animal/hostile/asteroid/goliath/attackby(obj/item/O, mob/user, params) // Feeding to tame
	if(istype(O, food_wanted))
		if(growth_stage == ADULT && growth_stage == ANCIENT)
			return
		if(!stat && feed_cooldown <= 0)
			switch(food_wanted)
				if(MEAT)
					tame_progress += rand(200, 350)
				if(DIAMOND)
					var/obj/item/stack/ore/diamond/D = O
					if(D.amount != 1)
						to_chat(user, "<span class='warning'>\The [src] only wants one diamond!</span>") // So that you don't accidentally feed more than one diamond
						return
					else
						tame_progress += rand(250, 400)
				if(CORE)
					var/obj/item/organ/internal/regenerative_core/R = O
					if(!R.inert)
						tame_progress += rand(250, 450)
						adjustBruteLoss(-25)
					else
						tame_progress += rand(150, 250) // Inert cores don't count a lot
						visible_message("<span class='notice'>\The [src] didn't like [O] too much...</span>")
				if(FLORA)
					tame_progress += rand(150, 350)
				if(ORGANS)
					if((istype(O, CORE)) || (istype(O, CYBERORGAN))) // No legion or cyberimp organs if it wants organs.
						return
					else
						tame_progress += rand(300, 500)
			user.visible_message("<span class='notice'>[user] feeds [O] to [src].</span>")
			playsound(get_turf(src), 'sound/items/eatfood.ogg', 50, 0)
			user.drop_item()
			qdel(O)
			if(food_wanted == MEAT)
				feed_cooldown = rand(5, 10)
			else
				feed_cooldown = rand(20, 50)
			reroll_food()
		else // If dead or not hungry
			if(stat == DEAD)
				to_chat(user, "<span class='warning'>\The [src] is dead!</span>")
			else if(feed_cooldown >= 1)
				to_chat(user, "<span class='warning'>\The [src] is not hungry yet!</span>")
	else if(istype(O, DRAGONSBLOOD) && draconian <= 1)
		if(!stat)
			user.visible_message("<span class='notice'>[user] feeds [O] to [src].</span>")
			user.drop_item()
			qdel(O)
			playsound(get_turf(src), 'sound/items/drink.ogg', 50, 0)
			tame_progress += rand(950, 1200)
			maxHealth += 100
			health += 100
			to_chat(src, "<span class='biggerdanger'>You feel flames coursing through your body!</span>")
			draconian++
			add_draconian_effect()
	else
		..()

/mob/living/simple_animal/hostile/asteroid/goliath/Destroy() // When gibbed / deleted, the ancient goliath that spawned it will be able to spawn another.
	..()
	leader.goliaths_owned--

#undef ANCIENT
#undef ADULT
#undef SUBADULT
#undef JUVENILE
#undef WILD
#undef PASSIVE
#undef TAMED
#undef NOT_DRACONIAN
#undef DRACONIAN
#undef FULL_DRACONIAN
#undef MEAT
#undef CORE
#undef FLORA
#undef ORGANS
#undef DIAMOND
#undef CYBERORGAN
#undef DRAGONSBLOOD
#undef GROWTH_MAX
