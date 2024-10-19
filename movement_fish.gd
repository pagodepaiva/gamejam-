extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Path2D/PathFollow2D.progress_ratio


#Debug function, tem que tirar da versão final
func Dquit():
	if Input.is_action_just_pressed("down"):
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Dquit() #retirar da versão final
