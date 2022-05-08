extends Node2D

var coins: int = 0

export var hearts: int = 3
export var max_hearts: int = 5

func _ready():
	add_to_group("GameState")
	update_GUI()

func update_GUI():
	get_tree().call_group("GUI", "update", coins, hearts, max_hearts)

func add_coin():
	coins+=1
	update_GUI()
	
func add_heart():
	if hearts < max_hearts:
		hearts+=1
		update_GUI()
		
func add_potion():
	max_hearts += 1
	update_GUI()
	
func star_potion():
	$Player.set_invincible(5)

func reload_scene():
	get_tree().reload_current_scene()

func hurt():
	if not $Player.invincible:
		hearts -= 1
		if hearts < 0:
			lost()
	update_GUI()
	$Player.hurt()

func lost():
	# restart the level for now
	get_tree().reload_current_scene()

func win():
	# get_tree().reload_current_scene()
	pass
	
