# Movement where the character rotates and moves forward or backward.
extends Area2D
var pos


func _ready() -> void:
	position.y = 700
	position.x = 1900
	


# Movement speed in pixels per second.
@export var speed := 10


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if velocity.length()>0:
		velocity = velocity.normalized() * speed
	
	position += velocity
	
	Dquit()

#Debug function
func Dquit():
	if Input.is_action_just_pressed("down"):
		get_tree().quit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$AnimatedSprite2D.hide()
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D.hide()
	queue_free()
