extends ParallaxBackground

const SCROLL_SPEED = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x -= SCROLL_SPEED*delta
