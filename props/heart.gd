extends Node2D



func _on_Area2D_body_entered(_body: CharacterBody2D):
	get_tree().call_group("GameState", "add_heart")
	queue_free()
