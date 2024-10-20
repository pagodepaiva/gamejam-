extends Node2D
func _ready() -> void:
	var n =get_node("roaming_fish")
	n.direction = 1


func _on_roaming_fish_tree_exited() -> void:
	print("baser")
	queue_free()
