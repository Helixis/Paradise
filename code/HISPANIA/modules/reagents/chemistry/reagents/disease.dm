/datum/reagent/bianfu
	name = "bianfu"
	id = "bianfu"
	description = "A disease-causing agent that is neither bacterial nor fungal nor viral and contains no genetic material.Just dont eat bats next time"
	reagent_state = LIQUID
	color = "#5A1C1C"
	can_synth = FALSE
	taste_mult = 0

/datum/reagent/bianfu/on_mob_life(mob/living/carbon/M)
	if(volume > 4.5)
		M.ForceContractDisease(new /datum/disease/coronavirus(0))
	return ..()