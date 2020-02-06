/datum/disease/coronavirus
	name = "Coronavirus"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = CONTACT_GENERAL
	cure_text = "Incurable"
	agent = "bianfu"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "China Number One"
	severity = BIOHAZARD
	disease_flags = CAN_CARRY
	bypasses_immunity = TRUE
	virus_heal_resistant = TRUE

/datum/disease/coronavirus/stage_act()
	..()
	switch(stage)
		if(1)
			if(prob(50))
				affected_mob.emote("cough")
			if(prob(50))
				affected_mob.Weaken(25)
		if(2)
			if(prob(50))
				affected_mob.visible_message("<span class='danger'>[affected_mob] coughs like its about to pop!</span>")
				affected_mob.Stun(10)
				affected_mob.Weaken(10)
				affected_mob.Weaken(250)
				affected_mob.drop_l_hand()
				affected_mob.drop_r_hand()
		if(3)
			if(prob(25))
				to_chat(affected_mob, "<span class='danger'>You feel like you are about to drop dead!</span>")
				to_chat(affected_mob, "<span class='danger'>Your body convulses painfully!</span>")
				affected_mob.drop_l_hand()
				affected_mob.drop_r_hand()
				affected_mob.adjustBruteLoss(5)
				affected_mob.adjustOxyLoss(5)
				affected_mob.Stun(10)
				affected_mob.Weaken(10)
				affected_mob.Jitter(250)
				affected_mob.visible_message("<span class='danger'>[affected_mob] coughs uncontrollably!</span>")
		if(4)
			if(prob(25))
				to_chat(affected_mob, "<span class='danger'>You feel like you are going to die!</span>")
				affected_mob.adjustOxyLoss(200)
				affected_mob.adjustBruteLoss(25)
				affected_mob.drop_l_hand()
				affected_mob.drop_r_hand()
				affected_mob.Stun(10)
				affected_mob.Weaken(10)
				affected_mob.visible_message("<span class='danger'>[affected_mob] coughs uncontrollably!</span>")