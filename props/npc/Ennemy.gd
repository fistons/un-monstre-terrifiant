extends CharacterBody2D

const SPEED = 250

var motion: Vector2 = Vector2(0,0)
var see_player: bool = false
var dying: bool = false

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(_delta):
	apply_grativity()
	seek_player()
	set_velocity(motion)
	set_up_direction(Global.UP)
	move_and_slide()
	
func seek_player(): 
	if not dying:
		if see_player:
			$AnimatedSprite2D.play("walk")
			var player_pos = owner.player.get_global_position()
			var direction = global_position.direction_to(player_pos)
			if direction.x < 0:
				motion.x = -SPEED
				$AnimatedSprite2D.flip_h = false
			else:
				motion.x = SPEED
				$AnimatedSprite2D.flip_h = true
		else:
			motion.x = 0
			$AnimatedSprite2D.play("idle")

func apply_grativity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += Global.GRAVITY


func _on_detection_body_entered(body):
	if body.name == "Player":
		see_player = true


func _on_detection_body_exited(body):
	if body.name == "Player":
		see_player = false


func _on_JumpZone_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("dead")
		motion.x = 0
		dying = true
		get_tree().call_group("Player", "jump_ennemy")



func _on_Deathzone_body_entered(body):
	if body.name == "Player":	
		get_tree().call_group("GameState", "hurt", false)


func _on_AnimatedSprite_animation_finished():
	if dying:
		queue_free()
