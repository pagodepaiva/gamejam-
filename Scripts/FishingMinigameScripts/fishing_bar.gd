extends RigidBody2D

var barDirection = Vector2()
const VELOCITY = 1

func _ready() -> void:
	barDirection.y = round(randi_range(-1, 1))

func _process(delta: float) -> void:
	barDirection.y *= VELOCITY
	move_and_collide(barDirection)

func _on_timer_timeout() -> void:
	barDirection.y = round(randi_range(-1, 1))
