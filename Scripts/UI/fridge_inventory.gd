extends BaseInventory

func _ready() -> void:
	item_scenes = {
		Constants.MILK: preload("res://Scenes/DrinkElements/Liquids/milk.tscn"),
		#Constants.ICE: preload("res://Scenes/Toppings/coconut_jelly.tscn"),
	}
	item_parent = Constants.FRIDGE

func update_data():
	data_source = Inventory.inventory[Constants.FRIDGE].keys()
