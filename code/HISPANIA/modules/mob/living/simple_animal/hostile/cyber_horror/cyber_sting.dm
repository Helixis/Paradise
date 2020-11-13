/mob/living/simple_animal/hostile/cyber_organic/poison/cyber_sting
	name = "unknown cyber horror"
	desc = "A horrific mix of organic tissue with nanomachines, there's nothing of what this thing used to be."
	icon_state = "ling_cyber_horror"
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	melee_damage_lower = 5
	melee_damage_upper = 5
	health = 30
	maxHealth = 30
	move_to_delay = 3
	obj_damage = 20
	var/nano_per_bite = 2

/mob/living/simple_animal/hostile/cyber_organic/poison/cyber_sting/AttackingTarget()
	. = ..()
	if(. && nano_per_bite > 0 && iscarbon(target) && (!client || a_intent == INTENT_HARM))
		var/mob/living/carbon/C = target
		var/inject_target = pick("chest", "head")
		if(C.can_inject(null, 0, inject_target, 0))
			C.reagents.add_reagent("nanomachines", nano_per_bite)
