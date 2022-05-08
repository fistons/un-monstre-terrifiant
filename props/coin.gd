extends Node2D




func _on_Area2D_body_entered(body: KinematicBody2D):
	get_tree().call_group("GameState", "add_coin")
	queue_free()
