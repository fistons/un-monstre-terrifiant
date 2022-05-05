extends Node2D


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("down")


func _on_Area2D_body_exited(_body):
	$AnimationPlayer.play_backwards("down")
