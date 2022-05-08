extends Node2D




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("open_door")


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$AnimationPlayer.play_backwards("open_door")	

func _on_WinZone_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("GameState", "win")
