extends ProgressBar
var maxValue = 100
@export var currentValue: float
var minValue = 0
var rate = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("RightMButton"):
		value += rate*delta
		if value == maxValue: value =0
		
	elif Input.is_action_just_released("RightMButton"):
		currentValue = value
		hide()
		queue_free()
