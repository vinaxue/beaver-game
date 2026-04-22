extends Control

@onready var marker: Marker2D = $Marker2D

signal slot_clicked(item_name)
var stored_item_name = ""
	
func display_item(item_name, child_node):
	child_node.position = Vector2.ZERO
	marker.add_child(child_node)
	self.visible = true
	stored_item_name = item_name

func clear_slot():
	for child in marker.get_children():
		child.queue_free()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and stored_item_name != "":
			slot_clicked.emit(stored_item_name)
