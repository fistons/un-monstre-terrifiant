extends Sprite2D




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("GameState", "star_potion")
		queue_free()
		
