extends Node2D

var coins: int = 0
var heart: int = 0

func _ready():
	add_to_group("GameState")
	updateGUI()


func updateGUI():
	get_tree().call_group("GUI", "update", coins, heart)
