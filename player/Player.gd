extends KinematicBody2D


var motion = Vector2(0,0)
const SPEED = 500
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 2500

func _ready():
	add_to_group("player")

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
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED

func apply_grativity():
	if  is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func restart():
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
