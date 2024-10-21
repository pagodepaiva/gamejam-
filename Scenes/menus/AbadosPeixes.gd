extends Node2D
var selling_fish = [0,0,0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(selling_fish)


func _on_botao_triangulo_nemoup() -> void:
	selling_fish[0] += 1
