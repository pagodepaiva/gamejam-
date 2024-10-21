extends Node2D
var control = false
var inside = false
var mouse_posX 
var mouse_pos 
var mouse_posY
var pos
const UPPER_LIMIT = 500
const LOWER_LIMIT = 1250
signal hit
signal releasingFish

func _ready() -> void:
	$Line2D.set_point_position(0,$EndFishingRod.position)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#Change Collision faz com que o anzol so "fisgue" caso o usuario aperte LeftMButton
func ChangeCollision():
	if (not control):
		if Input.is_action_pressed("mouse_left"):
			$HookSprite/CollisionShape2D.set_deferred("disabled",false)
		else:
			$HookSprite/CollisionShape2D.set_deferred("disabled",true)
	else:
		$HookSprite/CollisionShape2D.set_deferred("disabled",false)
		$HookSprite.collision_layer = 4
		$HookSprite.collision_mask = 4

func CheckMousePos(): #Checa a posição do mouse e so atualiza se ela for maior que o final da vara, é so pra evitar que a linha vá pro céu
	if not control:
		mouse_posX = $EndFishingRod.position.x
		mouse_pos = get_global_mouse_position()
		mouse_posY
		
		if mouse_pos.y <= $EndFishingRod.position.y:
			mouse_posY = $EndFishingRod.position.y
		else:
			mouse_posY = mouse_pos.y
	return Vector2(mouse_posX,mouse_posY)
	
	
func _process(delta: float) -> void:
	if(not control):
		pos = CheckMousePos()
	$Line2D.set_point_position(1,pos)
	$HookSprite.position = $Line2D.get_point_position(1) + Vector2(-1,80) #o que tá em Vector2 é Correção da Imagem
	ChangeCollision()
	if(pos.y < UPPER_LIMIT and control):
		control = $HookSprite.releaseFish()
		Input.warp_mouse(pos)
		releasingFish.emit()
	if(pos.y > LOWER_LIMIT and control):
		control = $HookSprite.releaseFish()
		Input.warp_mouse(Vector2(0, UPPER_LIMIT))
		releasingFish.emit()


func _on_hook_sprite_hit() -> void:
	control = true
	hit.emit()


func _on_fishing_minigame_is_inside() -> void:
	pos.y -= 3
	inside = true


func _on_fishing_minigame_is_out() -> void:
	pos.y += 1
