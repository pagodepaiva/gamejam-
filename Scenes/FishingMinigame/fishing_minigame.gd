extends Node2D

var barDirection = Vector2()
const VELOCITY = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	barDirection.y = randi_range(-1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var nextPosition = $FishingBar.position.y + barDirection.y*VELOCITY
	print(nextPosition)
	if(nextPosition > 100 and nextPosition < 300):
		$FishingBar.position.y = nextPosition

func _on_timer_timeout() -> void:
	barDirection.y = round(randi_range(-1, 1))
