/obj/item/reagent_containers/food/snacks/tinychocolate
	name = "chocolate"
	desc = "A tiny and sweet chocolate."
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "tiny_chocolate"
	list_reagents = list("nutriment" = 1, "candy" = 1, "cocoa" = 1)
	filling_color = "#A0522D"
	tastes = list("chocolate" = 1)

/obj/item/reagent_containers/food/snacks/proteinbar
	name = "protein bar"
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "proteinbar"
	bitesize = 5
	desc = "A nutrition bar that contain a high proportion of protein to carbohydrates and fats made by a NT Medical Branch"
	trash = /obj/item/trash/proteinbar
	filling_color = "#631212"
	list_reagents = list("protein" = 5, "sugar" = 2, "nutriment" = 5)
	tastes = list("protein" = 1)

/obj/item/reagent_containers/food/snacks/sliceable/cake/slimecake
	name = "Slime cake"
	desc = "A cake made of slimes. Probably not electrified."
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "slimecake"
	slice_path = /obj/item/reagent_containers/food/snacks/cakeslice/slimecake
	slices_num = 5
	bitesize = 3
	list_reagents = list("nutriment" = 20, "vitamin" = 5)
	tastes = list("cake" = 5, "sweetness" = 1, "slime" = 1)

/obj/item/reagent_containers/food/snacks/cakeslice/slimecake
	name = "slime cake slice"
	desc = "A slice of slime cake."
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "slimecake_slice"
	trash = /obj/item/trash/plate
	filling_color = "#00FFFF"
	tastes = list("cake" = 5, "sweetness" = 1, "slime" = 1)

/obj/item/reagent_containers/food/snacks/caribean_paradise
	name = "Caribean Paradise"
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "caribean_paradise"
	bitesize = 3
	desc = "Half coconut stuffed with mango"
	trash = /obj/item/reagent_containers/food/snacks/grown/coconutsliced
	filling_color = "#E37F0E"
	list_reagents = list("nutriment" = 3, "sugar" = 2, "vitamin" = 4)
	tastes = list("mango" = 1)

/obj/item/reagent_containers/food/snacks/mushrooms_curry
	name = "Mushrooms Curry"
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "mushrooms_curry"
	bitesize = 5
	desc = "A slight twist to the traditional recipe, rare but delicious"
	list_reagents = list("nutriment" = 5,  "vitamin" = 4)

/obj/item/reagent_containers/food/snacks/garlic_snack
	name = "Garlic Dip Dish "
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "garlic_snack"
	bitesize = 5
	desc = "A fresh garlic-avocado mix"
	filling_color = "#E6EBD1"
	list_reagents = list("nutriment" = 4,  "vitamin" = 4)
