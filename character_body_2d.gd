# Movement where the character rotates and moves forward or backward.
extends CharacterBody2D

# Movement speed in pixels per second.
var speed := 300  
	   
func calc():
	if Input.get_action_strength("move") == 1:
		return 1
	else:
		return -1

func _physics_process(delta):
	velocity = (calc()) * transform.y * speed
	move_and_slide()
