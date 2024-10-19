extends Area2D

var direction = Vector2()
const VELOCITY = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction.y = randi_range(-1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var nextPosition = position.y + direction.y*VELOCITY
	print(nextPosition)
	if(nextPosition > 100 and nextPosition < 300):
		position.y = nextPosition
		print("Andando")
		print(position.y)

func _on_timer_timeout() -> void:
	direction.y = round(randi_range(-1, 1))
