/datum/disease/coronavirus
	form = "Disease"
	name = "Coronavirus"
	max_stages = 5
	spread_text = "Airborne"
	cure_text = "Pentetic Acid"
	cures = list("pen_acid")
	agent = "New Coronavirus 2343-nCoV"
	viable_mobtypes = list(/mob/living/carbon/human)
	cure_chance = 5//like hell are you getting out of hell
	desc = "A rare highly transmittable virulent coronavirus variant. It´s said to be grown and cultured by chinnese bio-weapon specialists. Causes common cold, loss of breath, lung damage, headache, and fatigue."
	required_organs = list(/obj/item/organ/internal/lungs)
	severity = DANGEROUS
	bypasses_immunity = TRUE //Fungal and bacterial in nature; also infects the lungs

/datum/disease/coronavirus/stage_act() //it begins
	..()
	switch(stage)
		if(1)
			if(prob(10))
				affected_mob.emote("cough")
		if(2)
			if(prob(2))
				affected_mob.emote("cough")
				to_chat(affected_mob, "<span class='danger'>Your chest hurts.</span>")
			if(prob(5))
				affected_mob.emote("cough")
				to_chat(affected_mob, "<span class='danger'>You feel a cold sweat form.</span>")
		if(4)
			if(prob(2))
				to_chat(affected_mob, "<span class='userdanger'>You see four of everything</span>")
				affected_mob.Dizzy(5)
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>You feel a sharp pain from your lower chest!</span>")
				affected_mob.adjustOxyLoss(5)
				affected_mob.emote("gasp")
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>You feel air escape from your lungs painfully.</span>")
				affected_mob.adjustOxyLoss(25)
				affected_mob.emote("gasp")
		if(5)
			if(prob(2))
				to_chat(affected_mob, "<span class='userdanger'>[pick("You feel your heart slowing...", "You relax and slow your heartbeat.")]</span>")
				affected_mob.adjustStaminaLoss(70)
			if(prob(10))
				affected_mob.adjustStaminaLoss(100)
				affected_mob.visible_message("<span class='warning'>[affected_mob] faints!</span>", "<span class='userdanger'>You surrender yourself and feel at peace...</span>")
				affected_mob.AdjustSleeping(5)
			if(prob(2))
				to_chat(affected_mob, "<span class='userdanger'>You feel your mind relax and your thoughts drift!</span>")
				affected_mob.AdjustConfused(8, bound_lower = 0, bound_upper = 100)
			if(prob(7))
				to_chat(affected_mob, "<span class='userdanger'>You can´t breathe!</span>")
				affected_mob.adjustOxyLoss(75)
				affected_mob.emote("gasp")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>[pick("You feel uncomfortably hot...", "You feel like unzipping your jumpsuit", "You feel like taking off some clothes...")]</span>")
				affected_mob.bodytemperature += 40
	return
