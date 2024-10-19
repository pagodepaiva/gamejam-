extends Area2D
signal hit
var control = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.set_deferred("disabled",true)


#Change Collision faz com que o anzol so "fisgue" caso o usuario aperte LeftMButton
func ChangeCollision():
	if Input.is_action_pressed("LeftMButton") and control==0:
		$CollisionShape2D.set_deferred("disabled",false)
	else:
		$CollisionShape2D.set_deferred("disabled",true)


#DEBUG ONLY
func releaseFish():
	if Input.is_action_pressed("left"):
		$Sprite2D.texture = preload("res://Arts/Anzol.png")
		control = 0
#DEBUG ONLY


func _process(delta: float) -> void:
	ChangeCollision()
	releaseFish()

#Função de colisão, caso o Usuario fisgue o anzol passa a ser um anzol com o peixe
func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$Sprite2D.texture = preload("res://Arts/peixe1.png")
	$CollisionShape2D.set_deferred("disabled",true)
	body.hide()
	control = 1

#Função de colisão, TALVEZ inutil
func _on_area_entered(area: Area2D) -> void:
	hit.emit()
	$Sprite2D.texture = preload("res://Arts/peixe1.png")
	$CollisionShape2D.set_deferred("disabled",true)
	
