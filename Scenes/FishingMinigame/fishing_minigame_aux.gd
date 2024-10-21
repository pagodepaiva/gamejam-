extends Node2D
signal is_inside
signal is_out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fishing_bar_is_inside() -> void:
	is_inside.emit()


func _on_anzol_hit() -> void:
	$Range.visible = true
	$FishingBar.visible = true
	$FishingMinigameLine.visible = true


func _on_fishing_bar_is_out() -> void:
	is_out.emit()


func _on_anzol_releasing_fish() -> void:
	$Range.visible = false
	$FishingBar.visible = false
	$FishingMinigameLine.visible = false
