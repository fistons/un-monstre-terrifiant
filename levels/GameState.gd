extends Node2D

var coins: int = 0
var hearts: int = 3

func _ready():
	add_to_group("GameState")
	update_GUI()

func update_GUI():
	get_tree().call_group("GUI", "update", coins, hearts)

func add_coin():
	coins+=1
	update_GUI()
	
func add_heart():
	hearts+=1
	update_GUI()

func reload_scene():
	get_tree().reload_current_scene()

func hurt():
	hearts -= 1
	if hearts < 0:
		lost()
	update_GUI()
	$Player.hurt()

func lost():
	# restart the level for now
	get_tree().reload_current_scene()
