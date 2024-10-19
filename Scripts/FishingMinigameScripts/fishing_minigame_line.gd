# Movement where the character rotates and moves forward or backward.
extends RigidBody2D

# Movement speed in pixels per second.
var lineDirection = Vector2()
var speed := 1
	   
func calc():
	if Input.get_action_strength("ui_accept") == 1:
		return 1
	else:
		return -1

func _physics_process(delta):
	lineDirection.y = calc()*speed
	move_and_collide(lineDirection)
