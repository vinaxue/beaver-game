extends CanvasLayer

class_name BaseInventory

@onready var slots: Node = $Control/TextureRect/Slots
@onready var control: Control = $Control

var item_scenes = {} 
var data_source = []
var slots_list = []
var item_parent = ""

func _ready():
	_initialize_slots()

func _initialize_slots():
	if not slots_list.is_empty():
		return
		
	slots_list = slots.get_children()
	
	for slot in slots_list:
		if not slot.slot_clicked.is_connected(_on_slot_clicked):
			slot.slot_clicked.connect(_on_slot_clicked)
	
func toggle_inventory(should_show: bool):
	control.visible = should_show
	if should_show:
		update_data()
		refresh_inventory()
	else:
		for slot in slots.get_children():
			slot.visible = false

func refresh_inventory():
	if slots_list.is_empty(): 
		_initialize_slots()
		
	for s in slots_list:
		s.clear_slot()
		s.visible = false
		
	for i in range(data_source.size()):
		if i < slots_list.size():
			var slot = slots_list[i]
			var item_key = data_source[i]
				
			if item_scenes.has(item_key): 
				var instance = item_scenes[item_key].instantiate()
				if instance.has_method("set_inventory_mode"):
					instance.set_inventory_mode(true)

				slot.display_item(item_key, instance)
				slot.visible = true
		else:
			break

func _on_background_shield_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			toggle_inventory(false)

func update_data():
	pass

func _on_slot_clicked(item_name):
	var instance = item_scenes[item_name].instantiate()
	if instance.has_method("set_inventory_mode"):
		instance.set_inventory_mode(false)
	
	get_tree().current_scene.add_child(instance)
	
	instance.global_position = control.get_global_mouse_position()
	instance.is_dragging = true
	
	toggle_inventory(false)
