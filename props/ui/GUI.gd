extends CanvasLayer


func update(coins: int, hearts: int):
	if hearts == 0:
		$Control/HBoxContainer/HearthGauge/HeartCount.set("custom_colors/font_color", Color.red)
	else: 
		$Control/HBoxContainer/HearthGauge/HeartCount.set("custom_colors/font_color", Color.white)
	
	$Control/HBoxContainer/HearthGauge/HeartCount.text = str(hearts)
	$Control/HBoxContainer/CoinGauge/CoinCount.text = str(coins)

