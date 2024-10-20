extends RigidBody2D
var TypeFish = 5 #UniFish
var FacingLeft = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FishSprite.animation = "swimming"
	$FishSprite.flip_h = true
	$FishSprite.flip_v = linear_velocity.x < 0
	$FishSprite.play()
	$CollisionPolygon2D.scale.x *=-1
	
	if FacingLeft: $CollisionPolygon2D.scale.y *=-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body: Node) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$FishSprite.hide()
	$FishSprite.queue_free()
