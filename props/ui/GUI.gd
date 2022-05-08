extends CanvasLayer


func update(coins: int, hearts: int, max_hearts: int):
	$Control/VBoxContainer/CoinBar/CoinGauge/CoinCount.text = str(coins)

	$Control/VBoxContainer/HeartBar.update_values(hearts, max_hearts)
