extends CharacterBody2D

const SPEED = 10000.0
const start_max_y = 500
const start_min_y = 10
const right_start_x = 1500
const left_start_x = -400

var direction = 0
var last_direction = 0
func _ready():
	position.y = -10000
	position.x = -10000
	
	
func _physics_process(delta: float) -> void:
	
	if last_direction != direction:
		position.y = randf_range(start_min_y, start_max_y)
		
		if direction == -1:
			position.x = left_start_x
		elif direction == 1:
			position.x = right_start_x
		last_direction = direction
		print(position)
	velocity.y = 0
	velocity.x = -1*direction*delta * SPEED
	#print(position)
	move_and_slide()
	



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
