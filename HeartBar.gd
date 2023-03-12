extends HBoxContainer

func update_values(hearts: int, max_hearts: int):
	for o in get_tree().get_nodes_in_group("gui_heart"):
		o.queue_free()
	
	for n in range(Global.hearts):
		add_child(load("res://props/ui/FullHeart.tscn").instantiate())
		
	for n in range(Global.hearts, Global.max_hearts):
		add_child(load("res://props/ui/EmptyHeart.tscn").instantiate())
		
