extends HBoxContainer

func update_values(hearts: int, max_hearts: int):
	for o in get_tree().get_nodes_in_group("gui_heart"):
		o.queue_free()
	
	for n in range(hearts):
		var child: Container = add_child(load("res://props/ui/FullHeart.tscn").instance())
		
	for n in range(hearts, max_hearts):
		var child: Container = add_child(load("res://props/ui/EmptyHeart.tscn").instance())
		
