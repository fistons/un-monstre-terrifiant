extends Node2D

onready var player = $Player

func _ready():
	add_to_group("GameState")
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

func hurt(jump: bool = true):
	if not $Player.invincible:
		Global.hearts -= 1
		if Global.hearts < 0:
			lost()
	update_GUI()
	$Player.hurt(jump)

func lost():
	# restart the level for now
	get_tree().reload_current_scene()

func win():
	var currentScene = get_tree().current_scene.get_name()
	if currentScene == "Level1":
		get_tree().change_scene("res://levels/level2.tscn")
	else:
		get_tree().change_scene("res://levels/WinScreen.tscn")
	
	


func _on_Timer_timeout():
	var canon : Particles2D = $Player/Camera2D2/Particles2D
	canon.emitting = true
	
