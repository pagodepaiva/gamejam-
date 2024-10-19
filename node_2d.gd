extends Node2D

func Dquit():
	if Input.is_action_just_pressed("down"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Line2D.set_point_position(0,$EndFishingRod.position)
	print($Area2D/Hoook.global_position)
	print($Line2D.get_point_position(1))

func CheckMousePos():
	var mouse_posX = $EndFishingRod.position.x
	var mouse_pos = get_global_mouse_position()
	var mouse_posY
	
	if mouse_pos.y <= $EndFishingRod.position.y:
		mouse_posY = $EndFishingRod.position.y
	else:
		mouse_posY = mouse_pos.y
	
	return Vector2(mouse_posX,mouse_posY)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos = CheckMousePos()
	$Line2D.set_point_position(1,pos)
	$Area2D.position = $Line2D.get_point_position(1) + Vector2(382,45)
	print($Area2D.position)

	Dquit()
