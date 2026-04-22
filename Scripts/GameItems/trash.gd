extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	var object = area.get_parent()
	if object.is_in_group("trashable"): 
		object.set_over_trash(true)


func _on_area_2d_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if is_instance_valid(area):
		var object = area.get_parent()
		if object.is_in_group("trashable"): 
			object.set_over_trash(false)
