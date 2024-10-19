extends Node2D

func Dquit(): #DEVE ser retirado do código final
	if Input.is_action_just_pressed("down"):
		get_tree().quit()


func _ready() -> void:
	$Line2D.set_point_position(0,$EndFishingRod.position)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func CheckMousePos(): #Checa a posição do mouse e so atualiza se ela for maior que o final da vara, é so pra evitar que a linha vá pro céu
	var mouse_posX = $EndFishingRod.position.x
	var mouse_pos = get_global_mouse_position()
	var mouse_posY
	
	if mouse_pos.y <= $EndFishingRod.position.y:
		mouse_posY = $EndFishingRod.position.y
	else:
		mouse_posY = mouse_pos.y
	
	return Vector2(mouse_posX,mouse_posY)
	
	
func _process(delta: float) -> void:
	var pos = CheckMousePos()
	$Line2D.set_point_position(1,pos)
	$HookSprite.position = $Line2D.get_point_position(1) - Vector2(16,0) + Vector2(0,45) #o que tá em Vector2 é Correção da Imagem
	
	
	Dquit()
