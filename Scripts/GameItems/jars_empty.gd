extends Node2D

@export var jar_empty: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_new_jar():
	var instance = jar_empty.instantiate()
	add_child(instance)
	instance.global_position = get_global_mouse_position()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT: 
			spawn_new_jar()
