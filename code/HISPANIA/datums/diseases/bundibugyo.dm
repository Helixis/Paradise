/datum/disease/bundibugyo
	name = "Bundibugyo"
	max_stages = 5
	spread_text = "On contact"
	cure_text = "Hydrocodone, Omnizine & Iron"
	cures = list("hydrocodone", "omnizine", "iron")
	cure_chance = 18
	agent = "REGN-EB3"
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 0.75
	desc = "A viral hemorrhagic fever of humans. Symptoms includes fever, sore throat, muscular pain, and headaches. Vomiting, diarrhea and rash usually follow, along with decreased function of the liver and kidneys."
	severity = DANGEROUS

/datum/disease/bundibugyo/stage_act()
	..()

	switch(stage)
		if(2)
			affected_mob.bodytemperature += 10
			if(prob(15))
				affected_mob.emote("cough")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel muscle weakness!</span>")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel nauseous!</span>")

		if(3)
			if(prob(5))
				if(affected_mob.nutrition > 10)
					affected_mob.visible_message("<span class='danger'>[affected_mob] vomits on the floor profusely!</span>")
					affected_mob.fakevomit(no_text = 1)
					affected_mob.adjust_nutrition(-rand(3,5))
			if(prob(10))
				affected_mob.emote("cough")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel muscle weakness!</span>")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>You feel a sharp pain from your lower chest!</span>")
				affected_mob.adjustOxyLoss(5)
				affected_mob.emote("gasp")

		if(4)
			if(prob(10))
				affected_mob.adjustBruteLoss(10)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>Your nose is bleeding!</span>")
				affected_mob.adjustBruteLoss(5)
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>You feel air escape from your lungs painfully.</span>")
				affected_mob.adjustOxyLoss(10)
				affected_mob.emote("gasp")
				affected_mob.take_organ_damage(0,5)
			if(prob(5))
				if(affected_mob.nutrition > 10)
					affected_mob.visible_message("<span class='danger'>[affected_mob] vomits on the floor profusely!</span>")
					affected_mob.fakevomit(no_text = 1)
					affected_mob.adjust_nutrition(-rand(3,5))
		if(5)
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>Your abdomen stings painfully.</span>")
				if(prob(20))
					affected_mob.adjustToxLoss(25)
					affected_mob.take_organ_damage(0,15)
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>All your holes are bleeding!.</span>")
				affected_mob.adjustBruteLoss(15)
				affected_mob.take_organ_damage(0,10)
			if(prob(10))
				if(affected_mob.nutrition > 10)
					affected_mob.visible_message("<span class='danger'>[affected_mob] vomits on the floor profusely!</span>")
					affected_mob.fakevomit(no_text = 1)
					affected_mob.adjust_nutrition(-rand(3,5))
	return