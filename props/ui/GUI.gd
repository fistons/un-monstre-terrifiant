extends CanvasLayer


func update_gui():
	$Control/VBoxContainer/CoinBar/CoinGauge/CoinCount.text = str(Global.coins)

	$Control/VBoxContainer/HeartBar.update_values(Global.hearts, Global.max_hearts)
