extends Node
@export var Fish_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer_Nemo.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	var fish = Fish_scene.instantiate()
	var fishSpawnLocation = $Path2D/PathFollow2D
	
	var sort = randi() % 2
	if sort == 0:
		fishSpawnLocation.progress_ratio = randf_range(0.395,0.485)
		fish.FacingLeft = true
	else:
		fishSpawnLocation.progress_ratio = randf_range(0.885,0.975)
	
	 #Seta o progress ratio para excluir a parte superior do retangulo (o peixe nao vai vir do céu)
	fish.position = fishSpawnLocation.position
	
	var direction = fishSpawnLocation.rotation + PI/2
	direction += randf_range(-PI/10,PI/10)
	
	fish.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.),0.0)
	fish.linear_velocity = velocity.rotated(direction)
	
	add_child(fish)


func _on_area_2d_body_entered(body: Node2D) -> void:
	#body.linear_velocity = body.linear_velocity.bounce(Vector2(0,1))
	var PreviousAngVeloc = body.angular_velocity
	var bounceDir = Vector2(body.linear_velocity.x, -body.linear_velocity.y)
	body.linear_velocity = bounceDir
	if body.linear_velocity.x > 0:
		body.angular_velocity = bounceDir.angle()*10
	else:
		body.angular_velocity = -bounceDir.angle()*1.40
	if not body.is_queued_for_deletion():
		if not body.is_visible_in_tree():
			body.queue_free()
		else:
			await get_tree().create_timer(0.2).timeout
			body.angular_velocity = PreviousAngVeloc
	
	
	
