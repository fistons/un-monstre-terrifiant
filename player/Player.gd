extends KinematicBody2D


var motion = Vector2(0,0)
var invincible: bool = false
var ladder: bool = false

const SPEED = 500
const GRAVITY = 300
const GRAVITY_LADDER = 100
const UP = Vector2(0,-1)
const JUMP_SPEED = 2500
const JUMP_SPEED_LADDER = -300

func _ready():
	add_to_group("Player")


func _physics_process(_delta):
	apply_grativity()
	jump()
	move()
	move_and_slide(motion, UP)
	restart()
		

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
	

func apply_grativity():
	if position.y > 6500:
		get_tree().call_group("GameState", "lost")
	if  is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		if not ladder:
			motion.y += GRAVITY
		else: 
			motion.y += GRAVITY_LADDER

func restart():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func hurt():
	if not invincible:
		invincible = true
		$InvincibleTimer.start()
		$AnimationPlayer.play("invisible")
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED*2

func in_ladder(in_ladder: bool = true): 
	ladder = in_ladder
	print("in ladder " + str(ladder))

func _on_InvincibleTimer_timeout():
	invincible = false

