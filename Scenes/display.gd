extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FishingMinigame/Range.visible = false
	$FishingMinigame/FishingBar.visible = false
	$FishingMinigame/FishingMinigameLine.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$Panel.hide()
	$Panel.queue_free()


func _on_musica_finished() -> void:
	$Musica.play()
