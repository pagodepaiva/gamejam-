extends CharacterBody2D


const SPEED_Y = 900
#const SPEED_Y = 0
const SPEED_X = 2700
#const SPEED_X = 0

var direction_x = 1
var direction_y = -1

func _physics_process(delta: float) -> void:
	
	velocity.x = SPEED_X*delta * direction_x
	velocity.y = SPEED_Y*delta * direction_y

	move_and_slide()


func _on_lefty_screen_entered() -> void:
	direction_x = -1
	

func _on_righty_screen_entered() -> void:
	direction_x = 1
	
	


func _on_upsy_screen_exited() -> void:
	direction_y = -1 # Replace with function body.


func _on_downsy_screen_entered() -> void:
	direction_y = 1 # Replace with function body.
