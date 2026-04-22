extends Node2D

@onready var kettle: AnimatedSprite2D = $Area2D/Kettle
@onready var steam: Node2D = $Steam

var is_boiling = false
var current_temp = 0.0

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if not is_boiling: 
			start_boiling()

func start_boiling():
	is_boiling = true
	kettle.frame = 1

func finish_boiling():
	is_boiling = false
	kettle.frame = 0
	current_temp = 100
	
func _process(delta: float) -> void:
	if current_temp > 0 and not is_boiling: 
		current_temp -= Constants.COOLING_RATE * delta
	
	if is_boiling: 
		if current_temp < 100: 
			current_temp += Constants.BOILING_RATE * delta
		else:
			finish_boiling()
	
	if current_temp < 70:
		steam.visible = false
	else:
		steam.visible = true
