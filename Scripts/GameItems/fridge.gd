extends Node2D

@onready var inventory_slots: CanvasLayer = $InventorySlots

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_slots.toggle_inventory(false)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		inventory_slots.toggle_inventory(true)
