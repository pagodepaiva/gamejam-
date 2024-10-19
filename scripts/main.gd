extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

const fishs = [
	preload("res://scenes/right_roaming_fish.tscn"),
	preload("res://scenes/left_roaming_fish.tscn")
]
var control = 0

func _on_timer_timeout() -> void:
	$Timer.wait_time = randf_range(2, 5)
	
	var new_fish = fishs[control%2].instantiate() 
	control += 1
	add_child(new_fish)

	
	
