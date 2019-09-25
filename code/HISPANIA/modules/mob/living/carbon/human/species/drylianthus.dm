/datum/species/drylianthus
	name = "Drylianthus"
	name_plural = "Drylianthus"
	icobase = 'icons/hispania/mob/human_races/r_drylianthus.dmi'
	deform = 'icons/hispania/mob/human_races/r_def_drylianthus.dmi'
	language = "Rootspeak"
	speech_sounds = list('sound/voice/dionatalk1.ogg') //Credit https://www.youtube.com/watch?v=ufnvlRjsOTI [0:13 - 0:16]
	speech_chance = 20
	remains_type = /obj/effect/decal/cleanable/ash


	warning_low_pressure = 50
	hazard_low_pressure = -1

	blurb = "-Soon-"

	species_traits = list(RADIMMUNE, IS_PLANT)
	dies_at_threshold = TRUE
	clothing_flags = HAS_UNDERWEAR | HAS_UNDERSHIRT | HAS_SOCKS
	default_hair_colour = "#000000"
	has_gender = TRUE
	dietflags = 0		//Drylianthus regenerate nutrition in light and water, no diet necessary
	taste_sensitivity = TASTE_SENSITIVITY_NO_TASTE
	skinned_type = /obj/item/stack/sheet/wood

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not
	blood_color = "#78f57e"
	flesh_color = "#907E4A"
	butt_sprite = "diona"
	dietflags = DIET_CARN
	reagent_tag = PROCESS_ORG

	has_organ = list(
	"heart" =    /obj/item/organ/internal/heart,
	"lungs" =    /obj/item/organ/internal/lungs,
	"liver" =    /obj/item/organ/internal/liver,
	"kidneys" =  /obj/item/organ/internal/kidneys,
	"brain" =    /obj/item/organ/internal/brain,
	"appendix" = /obj/item/organ/internal/appendix,
	"eyes" =     /obj/item/organ/internal/eyes
	)

	suicide_messages = list(
		"is losing branches!",
		"pulls out a secret stash of herbicide and takes a hearty swig!",
		"is pulling themselves apart!")

	allowed_consumed_mobs = list(
	/mob/living/simple_animal/hostile/poison/terror_spider,
	/mob/living/simple_animal/mouse,
	/mob/living/simple_animal/lizard,
	/mob/living/simple_animal/chick,
	/mob/living/simple_animal/butterfly
	)

/datum/species/drylianthus/on_species_gain(mob/living/carbon/human/H)
	..()

/datum/species/drylianthus/handle_life(mob/living/carbon/human/H)
	H.radiation = Clamp(H.radiation, 0, 100) //We have to clamp this first, then decrease it, or there's a few edge cases of massive heals if we clamp and decrease at the same time.
	var/rads = H.radiation / 25
	H.radiation = max(H.radiation-rads, 0)
	H.nutrition = min(H.nutrition+rads, NUTRITION_LEVEL_WELL_FED+30)
	H.adjustBruteLoss(-(rads))
	H.adjustToxLoss(-(rads))

	var/light_amount = 0 //how much light there is in the place, affects receiving nutrition and healing
	if(isturf(H.loc)) //else, there's considered to be no light
		var/turf/T = H.loc
		light_amount = min(T.get_lumcount() * 10, 5)  //hardcapped so it's not abused by having a ton of flashlights
	H.nutrition = min(H.nutrition+light_amount, NUTRITION_LEVEL_WELL_FED+30)

	if(light_amount > 0)
		H.clear_alert("nolight")
	else
		H.throw_alert("nolight", /obj/screen/alert/nolight)
		H.nutrition -= 5

	if((light_amount >= 5) && !H.suiciding) //if there's enough light, heal

		H.adjustBruteLoss(-(light_amount/2))
		H.adjustFireLoss(-(light_amount/4))
	if(H.nutrition < NUTRITION_LEVEL_STARVING+50)
		H.take_overall_damage(5,0)
	..()


