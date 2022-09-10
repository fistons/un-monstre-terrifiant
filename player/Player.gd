extends KinematicBody2D


var motion = Vector2(0,0)
var invincible: bool = false
var ladder: bool = false

const SPEED = 500
const GRAVITY_LADDER = 100
const JUMP_SPEED = 2500
const JUMP_SPEED_LADDER = -300

signal animate

func _ready():
	add_to_group("Player")


func _physics_process(_delta):
	apply_grativity()
	jump()
	move()
	move_and_slide(motion, Global.UP)
	restart()
	animate()
		

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else: 
		motion.x = 0

func jump():
	if Input.is_action_pressed("jump"):
		if not ladder and is_on_floor():
			motion.y -= JUMP_SPEED
		elif ladder:
			motion.y = JUMP_SPEED_LADDER
			
func jump_ennemy():
	motion.y -= JUMP_SPEED

func apply_grativity():
	if position.y > 6500:
		get_tree().call_group("GameState", "lost")
	if  is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		if not ladder:
			motion.y += Global.GRAVITY
		else: 
			motion.y += GRAVITY_LADDER

func restart():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func hurt(jump: bool = true):
	set_invincible(1.5)
	yield(get_tree(), "idle_frame")
	if jump:
		position.y -= 1
		motion.y = -JUMP_SPEED*1.5
	
func set_invincible(duration: float = 5):
	if not invincible:
		invincible = true
		$InvincibleTimer.start(duration)
		$AnimationPlayer.play("invisible")

func in_ladder(in_ladder: bool = true): 
	ladder = in_ladder
	
func animate():
	emit_signal("animate", motion)

func _on_InvincibleTimer_timeout():
	invincible = false
	$AnimationPlayer.stop()
	$AnimationPlayer.seek(0, true)

