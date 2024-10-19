extends RigidBody2D

var barDirection = Vector2()
#Velocidade da barra
const VELOCITY = 1
#Proporção da diminuição da barra quando dentro da área do minigame
const DOWN_SCALE = 0.7
#Variável que diz se a barra está dentro da área do minigame
var isLineInside = false
#"Constante" que salva a escala x (ta rotacionado 90°) do sprite da barra (O sprite tá mal feito ai nao alinha com os outros)
var BAR_SPRITE_SCALE
#"Constante" que salva a escala y da colisão
var COLLISION_SCALE
#"Constante" que salva a escala y da area2D intercessão
var INTERCESSION_SCALE
#Limite superior do sprite quando ele vai retornar ao valor original (O sprite ta muito mal feito)
var UPPER_LIMIT_SPRITE
#Limite superior quando o objeto vai retornar ao valor original
var UPPER_LIMIT
#Limite inferior do sprite quando ele vai retornar ao valor original
var LOWER_LIMIT_SPRITE
#Limite inferior quando o objeto vai retornar ao valor original
var LOWER_LIMIT

func _ready() -> void:
	#Define uma direção aleatória pra barra no intervalo (-1, 1)
	barDirection.y = round(randi_range(-1, 1))
	#Definindo as "constantes" declaradas acimna
	BAR_SPRITE_SCALE = $BarSprite.scale.x
	COLLISION_SCALE = $Collision.scale.y
	INTERCESSION_SCALE = $IntercessionArea/IntercessionCollision.scale.y
	UPPER_LIMIT_SPRITE = $BarSprite.scale.x / DOWN_SCALE
	LOWER_LIMIT_SPRITE = $BarSprite.scale.x * DOWN_SCALE
	UPPER_LIMIT = $Collision.scale.y / DOWN_SCALE
	LOWER_LIMIT = $Collision.scale.y * DOWN_SCALE
	#Debug
	print(UPPER_LIMIT)
	print(LOWER_LIMIT)

func resizeBar():
	#Caso a area2D possua algum corpo dentro (A linhazinha do minigame)
	if($IntercessionArea.has_overlapping_bodies()):
		print("Inside")
		#Timer para deixar mais natural
		await get_tree().create_timer(0.1).timeout
		#Caso ainda não tenha atingido o limite
		if($BarSprite.scale.x > LOWER_LIMIT_SPRITE):
			#Diminui de forma suave o tamanho do sprite
			$BarSprite.scale.x -= 0.001
		#//
		if($Collision.scale.y > LOWER_LIMIT):
			#Diminui de forma suave o tamanho do objeto
			$Collision.scale.y -= 0.1
			$IntercessionArea.scale.y = $Collision.scale.y
	else:
		#//
		if($BarSprite.scale.x < UPPER_LIMIT_SPRITE):
			$BarSprite.scale.x += 0.001
		#//
		if($Collision.scale.y < UPPER_LIMIT):
			$Collision.scale.y += 0.1
			$IntercessionArea.scale.y = $Collision.scale.y
		print("Out")

func _process(delta: float) -> void:
	#Seta a direção com a velocidade
	barDirection.y *= VELOCITY
	resizeBar()
	move_and_collide(barDirection)

func _on_timer_timeout() -> void:
	#A cada 0.5 segundos seta uma nova direção pra barra
	barDirection.y = round(randi_range(-1, 1))
