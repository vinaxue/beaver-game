extends RigidBody2D

class_name BaseTopping

@onready var animated_sprite: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

@export var single_frame_index: int = 0
@export var stacked_frame_index: int = 1
@export var is_dragging: bool = false
@export var is_over_trash = false

func _process(_delta):
	if is_dragging:
		global_position = get_global_mouse_position()

func set_inventory_mode(is_in_inventory: bool):
	var anim_sprite = find_child("AnimatedSprite2D")
	var col_shape = find_child("CollisionShape2D")
	freeze = true
	
	if anim_sprite:
		anim_sprite.frame = 1 if is_in_inventory else 0
	else:
		print("Warning: AnimatedSprite2D not found on ", name)

	if col_shape:
		col_shape.disabled = is_in_inventory
	else:
		print("Warning: CollisionShape2D not found on ", name)

func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and is_dragging:
			release_object()

func release_object(): 
	is_dragging = false
	if is_over_trash: 
		discard()
	else:
		freeze = false

func set_over_trash(value): 
	is_over_trash = value
	
func discard():
	queue_free()
	
