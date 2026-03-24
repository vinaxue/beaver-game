extends CanvasLayer

@onready var slots: Node = $Control/TextureRect/Slots
@onready var control: Control = $Control

var topping_scenes = {
	"boba": preload("res://Scenes/boba.tscn"),
	"coconut_jelly": preload("res://Scenes/coconut_jelly.tscn"),
}

func toggle_inventory(should_show: bool):
	control.visible = should_show
	if should_show:
		refresh_inventory()
	else:
		for slot in slots.get_children():
			slot.visible = false

func refresh_inventory():
	var my_toppings = Inventory.toppings.keys()
	
	var slots_list = slots.get_children()
	
	for i in range(my_toppings.size()):
		var slot = slots_list[i]
		var topping = my_toppings[i]
		
		slot.clear_slot()
		
		if i < slots_list.size():
			slot.display_item(topping, topping_scenes[topping].instantiate())
			slot.visible = true
		else:
			break

func _on_background_shield_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			toggle_inventory(false)
