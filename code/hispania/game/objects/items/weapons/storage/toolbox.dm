/obj/item/storage/fancylunchbox
	name = "Fancy Lunchbox"
	desc = "A fancy leather lunchbox with golden attachs."
	icon = 'icons/hispania/obj/storage.dmi'
	icon_state = "fancylunch_box"
	item_state = "fancylunch_box"
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 9
	storage_slots = 4

/obj/item/storage/fancylunchbox/populate_contents()
	var/newwine = pick(/obj/item/reagent_containers/food/drinks/bottle/hispania/white_wine, /obj/item/reagent_containers/food/drinks/bottle/wine)
	var/newentry = pick(/obj/item/reagent_containers/food/snacks/butter_toast, /obj/item/reagent_containers/food/snacks/stuffed_mushrooms, /obj/item/reagent_containers/food/snacks/ensaladacactus, /obj/item/reagent_containers/food/snacks/garlic_snack, /obj/item/reagent_containers/food/snacks/salmoncreamtoast)
	var/newentree = pick(/obj/item/reagent_containers/food/snacks/peach_meat, /obj/item/reagent_containers/food/snacks/smokedsalmon, /obj/item/reagent_containers/food/snacks/avocadosalmon, /obj/item/reagent_containers/food/snacks/citrussalmon, /obj/item/reagent_containers/food/snacks/filetmignon, /obj/item/reagent_containers/food/snacks/garlic_soup, /obj/item/reagent_containers/food/snacks/salmoncurry)
	new newwine(src)
	new /obj/item/reagent_containers/food/drinks/drinkingglass(src)
	new newentry(src)
	new newentree(src)