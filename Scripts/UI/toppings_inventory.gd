extends BaseInventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_scenes = {
		Constants.BOBA: preload("res://Scenes/DrinkElements/Toppings/boba.tscn"),
		Constants.COCONUT_JELLY: preload("res://Scenes/DrinkElements/Toppings/coconut_jelly.tscn"),
	}
	item_parent = Constants.TOPPINGS

func update_data():
	data_source = Inventory.inventory[Constants.TOPPINGS].keys()
