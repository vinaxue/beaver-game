extends RigidBody2D

var is_dragging = false
var is_over_trash = false

func _ready():
	freeze = true
	is_dragging = true

func _process(_delta):
	if is_dragging:
		global_position = get_global_mouse_position()
		linear_velocity = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and is_dragging:
			release_object()

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_dragging = true
			freeze = true

func release_object(): 
	is_dragging = false
	if is_over_trash: 
		discard()
	else:
		freeze = false

func set_over_trash(value): 
	print("set")
	is_over_trash = value

func discard(): 
	queue_free()
