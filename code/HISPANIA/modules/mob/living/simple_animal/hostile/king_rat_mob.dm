/mob/living/simple_animal/hostile/poison/king_rat_mob
	name = "king rat"
	desc = "A bunch of rats, cuff together from the tail. Very dangerous stuff."
	icon = 'icons/hispania/mob/animals.dmi'
	icon_state = "king_rat_testonly"
	icon_living = "king_rat_testonly"
	icon_dead = "king_rat_testonly"
	icon_gib = "syndicate_gib"
	vision_range = 7
	speed = 5
	maxHealth = 800
	health = 800
	harm_intent_damage = 6
	melee_damage_lower = 6
	melee_damage_upper = 6
	obj_damage = 20
	attacktext = "bites"
	attack_sound = 'sound/weapons/pierce.ogg'
	a_intent = INTENT_HARM
	speak_emote = list("screeches")
	status_flags = PASSTABLE
	response_help  = "pets"
	response_harm   = "hits"
	robust_searching = 1
	stat_attack = 1
	loot = list()
	gold_core_spawnable = HOSTILE_SPAWN
	butcher_results = list(/obj/item/stack/sheet/animalhide/human = 15)
	var/venom_per_bite = 10

/mob/living/simple_animal/hostile/poison/king_rat_mob/AttackingTarget()
	// This is placed here, NOT on /poison, because the other subtypes of /poison/ already override AttackingTarget() completely, and as such it would do nothing but confuse people there.
	. = ..()
	if(. && venom_per_bite > 0 && iscarbon(target) && (!client || a_intent == INTENT_HARM))
		var/mob/living/carbon/C = target
		var/inject_target = pick("chest", "head")
		if(C.can_inject(null, 0, inject_target, 0))
			C.reagents.add_reagent("toxin", venom_per_bite)