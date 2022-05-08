extends Sprite




func _on_Area2D_body_entered(body):
	if body.name=="Player":
		get_tree().call_group("Player", "in_ladder", true)


func _on_Area2D_body_exited(body):
	if body.name=="Player":
		get_tree().call_group("Player", "in_ladder", false)
