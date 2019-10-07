/obj/item/toy/redbutton/laughbutton
	name = "laugh button"
	desc = "A button that provides you with sitcom laughs."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "bigred"
	w_class = WEIGHT_CLASS_SMALL
	cooldown = 0

/obj/item/toy/redbutton/attack_self(mob/user)
	if(cooldown < world.time)
		cooldown = (world.time + 200) // Sets cooldown at 30 seconds
		user.visible_message("<span class='warning'>[user] presses the laugh button.</span>", "<span class='notice'>You press the button, it plays a sitcom laugh!</span>", "<span class='notice'>The button clicks loudly.</span>")
		playsound(src, 'sound/effects/laughsound.ogg', 80, 0, 0)
		for(var/mob/M in range(10, src)) // Checks range
			if(!M.stat && !istype(M, /mob/living/silicon/ai)) // Checks to make sure whoever's getting shaken is alive/not the AI
				sleep(8) // Short delay to match up with the explosion sound

	else
		to_chat(user, "<span class='alert'>It's not the time.</span>")