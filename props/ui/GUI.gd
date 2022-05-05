extends CanvasLayer


func update(coins: int, hearts: int):
	$Control/HBoxContainer/HearthGauge/HeartCount.text = str(hearts)
	$Control/HBoxContainer/CoinGauge/CoinCount.text = str(coins)

