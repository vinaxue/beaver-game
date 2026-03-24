extends Node2D

@onready var marker: Marker2D = $Marker2D

var stored_item_name = ""
	
func display_item(item_name, child_node):
	child_node.position = Vector2.ZERO
	marker.add_child(child_node)
	print(marker.position, child_node.position)
	self.visible = true
	stored_item_name = item_name

func clear_slot():
	for child in marker.get_children():
		child.queue_free()
