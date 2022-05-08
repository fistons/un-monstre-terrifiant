extends AnimatedSprite




func _on_Player_animate(motion: Vector2):
	if motion.x != 0:
		play("walk")
		flip_h = motion.x < 0
	else:
		play("idle")
