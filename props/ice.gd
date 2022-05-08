extends Node2D


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("down")


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$AnimationPlayer.play_backwards("down")
