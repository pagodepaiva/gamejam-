extends RigidBody2D

#Direção da barra
var lineDirection = Vector2()
#Velocidade em que a barra se move
const SPEED = 5

func calc():
	#Caso o player aperte espaço a barra desce
	if Input.get_action_strength("ui_accept") == 1:
		return 1
	#Caso o player não esteja apertando espaço a barra sobe
	return -1

func _physics_process(delta):
	if(self.visible):
		lineDirection.y = calc()*SPEED
		move_and_collide(lineDirection)
