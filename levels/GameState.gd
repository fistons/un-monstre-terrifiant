extends Node2D

var coins: int = 0

export var hearts: int = 3
export var max_hearts: int = 5

onready var player = $Player

func _ready():
	add_to_group("GameState")
	Global.coins = coins
	Global.hearts = hearts
	Global.max_hearts = max_hearts
	update_GUI()

func update_GUI():
	get_tree().call_group("GUI", "update_gui")

func add_coin():
	Global.coins+=1
	update_GUI()
	
func add_heart():
	if Global.hearts < Global.max_hearts:
		Global.hearts+=1
		update_GUI()
		
func add_potion():
	Global.max_hearts += 1
	update_GUI()
	
func star_potion():
	$Player.set_invincible(5)

func reload_scene():
	get_tree().reload_current_scene()

func hurt():
	if not $Player.invincible:
		Global.hearts -= 1
		if Global.hearts < 0:
			lost()
	update_GUI()
	$Player.hurt()

func lost():
	# restart the level for now
	get_tree().reload_current_scene()

func win():
	get_tree().change_scene("res://levels/WinScreen.tscn")
	
