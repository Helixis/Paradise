/*
Slimecrossing Potions
	Potions added by the slimecrossing system.
	Collected here for clarity.
*/

/obj/item/slimepotion/slime_reviver
	name = "slime revival potion"
	desc = "Infused with plasma and compressed gel, this brings dead slimes back to life."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "potsilver"

/obj/item/slimepotion/slime_reviver/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))
		to_chat(user, "<span class='warning'>The potion only works on slimes!</span>")
		return ..()
	if(M.stat != DEAD)
		to_chat(user, "<span class='warning'>The slime is still alive!</span>")
		return
	if(M.maxHealth <= 0)
		to_chat(user, "<span class='warning'>The slime is too unstable to return!</span>")
	M.revive(full_heal = 1)
	M.stat = CONSCIOUS
	M.visible_message("<span class='notice'>[M] is filled with renewed vigor and blinks awake!</span>")
	M.maxHealth -= 10 //Revival isn't healthy.
	M.health -= 10
	M.regenerate_icons()
	qdel(src)

//Stabilizer potion - Charged Blue
/obj/item/slimepotion/slime/chargedstabilizer
	name = "slime omnistabilizer"
	desc = "An extremely potent chemical mix that will stop a slime from mutating completely."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "potcyan"

/obj/item/slimepotion/slime/chargedstabilizer/attack(mob/living/simple_animal/slime/M, mob/user)
	if(!isslime(M))
		to_chat(user, "<span class='warning'>The stabilizer only works on slimes!</span>")
		return ..()
	if(M.stat)
		to_chat(user, "<span class='warning'>The slime is dead!</span>")
		return
	if(M.mutation_chance == 0)
		to_chat(user, "<span class='warning'>The slime already has no chance of mutating!</span>")
		return

	to_chat(user, "<span class='notice'>You feed the slime the omnistabilizer. It will not mutate this cycle!</span>")
	M.mutation_chance = 0
	qdel(src)
