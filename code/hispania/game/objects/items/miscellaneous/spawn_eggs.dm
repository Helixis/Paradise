/obj/item/princesa_eggs
	name = "Princess of Terror Spiders Egg"
	desc = "Big egg with a lot of black fur around, seems to be ready to hatch."
	icon = 'icons/hispania/obj/miscellaneous.dmi'
	icon_state = "princesa"
	item_state = "princesa"
	throwforce = 1
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 3
	throw_range = 7
	pressure_resistance = 8
	var/awakening = FALSE

/obj/item/princesa_eggs/attack_self(mob/user)
	if(awakening || istype(user.loc, /turf/space))
		return
	to_chat(user, "<span class='notice'>You begin to awaken the Princess of Terror Spiders...</span>")
	awakening = TRUE
	spawn(300)
		if(!QDELETED(src))
			var/turf/T = get_turf(src)
			var/mob/living/simple_animal/hostile/poison/terror_spider/queen/princess/K = new /mob/living/simple_animal/hostile/poison/terror_spider/queen/princess(T)
			K.visible_message("<span class='notice'>The Princess suddenly awakens.</span>")
			message_admins("[key_name_admin(user)] released a Princess of Terror Spiders at [ADMIN_COORDJMP(T)]")
			log_game("[key_name(user)] released a Princess of Terror Spiders at [COORD(T)]")
			playsound(src, 'sound/hispania/effects/princesa.ogg', 70, 7)
			if(is_station_level(T.z))
				spawn(90 SECONDS) // IT JUST WORKS
					GLOB.command_announcement.Announce("Confirmed outbreak of level 3 biohazard aboard [station_name()]. All personnel must contain the outbreak.", "Biohazard Alert", 'sound/effects/siren-spooky.ogg')
			if(user)
				user.unEquip(src)
			qdel(src)

/obj/item/paper/princesa
	name = "Princess of Terror Spider Egg Guide"
	icon_state = "paper_words"
	info = {"<b>Instructions</b><br>
 			<b><i>Congrats you want to start hell on earth... well not exactly but you get the idea.</b></i><br>
 			<b><i> 1- Find a place with vents and no people </b></i><br>
 			<b><i> 2- Use the eggs on your hand and they will start to shake </b></i><br>
 			<b><i> 3- Leave them on the ground and RUN, OH GOD OH FUCK, RUN!</b></i><br>
 			<b><i> 4- After 30 seconds a princess of terror spiders will hatch from the egg </b></i><br>
 			<b><i> 5- Survive and watch hell on earth </b></i><br>
 			<br>
 			<b><p style="color:red;"><i>REMEMBER THEY ARE NOT YOUR FRIENDS</b></i></p>
			"}

/obj/item/storage/box/syndie_kit/princesa
	name = "Princess of Terror Spider kit"

/obj/item/storage/box/syndie_kit/princesa/New()
	..()
	new /obj/item/princesa_eggs(src)
	new /obj/item/paper/princesa(src)
	return
